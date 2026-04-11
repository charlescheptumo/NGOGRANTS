#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50016 "pageextension50016" extends "General Journal"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Modification (Visible) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Modification (Visible) on "Amount(Control 18)".


        //Unsupported feature: Property Modification (Visible) on ""Amount (LCY)"(Control 113)".


        //Unsupported feature: Property Modification (Visible) on ""Debit Amount"(Control 1000)".


        //Unsupported feature: Property Modification (Visible) on ""Credit Amount"(Control 1001)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Modification (Visible) on ""Bal. Account No."(Control 55)".

        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Document No.")
        {
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(AccountName)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Bal. Account No.")
        {
            // field(BalAc; Rec.BalAc)
            // {
            //     ApplicationArea = Basic;
            // }
            // field(BalAc; Rec.BalAc)
            // {
            //     ApplicationArea = Basic;
            // }
            // field(BalNew; BalAccName)
            // {
            //     ApplicationArea = Basic;

            //     trigger OnValidate()
            //     begin
            //         // Rec.BalAc := Rec.BalNew;
            //         Rec.BalAc := BalAccName;
            //     end;
            // }
            field(BalAccNam; BalAccName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bal. Name';
                Editable = false;
                ToolTip = 'Specifies the name of the balancing account that has been entered on the journal line.';
            }
        }
    }


    var
        PrevGenJnlLine: Record "Gen. Journal Line";
        AccountNames: Dictionary of [Text, Text];
        BalAccName: Text[100];

    trigger OnOpenPage()
    var
        AllocationAccountMgt: Codeunit "Allocation Account Mgt.";
        ServerSetting: Codeunit "Server Setting";
        VATReportingDateMgt: Codeunit "VAT Reporting Date Mgt";
        LastGenJnlBatch: Code[10];
        ImportPayrollTransactionsAvailable: Boolean;
        IsSaaSExcelAddinEnabled: Boolean;
        CanRequestFlowApprovalForBatch: Boolean;
        CanRequestFlowApprovalForBatchAndAllLines: Boolean;
        CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
        CanCancelFlowApprovalForBatch: Boolean;
        CanCancelFlowApprovalForLine: Boolean;
        CurrentCurrencyCode: Code[10];
        IsChangingDocNo: Boolean;
        VATDateEnabled: Boolean;
        UseAllocationAccountNumber: Boolean;
        ClientTypeManagement: Codeunit "Client Type Management";
        ShowWorkflowStatusOnBatch: Boolean;
        ShowWorkflowStatusOnLine: Boolean;
        DocumentNumberMsg: Label 'Document No. must have a value in Gen. Journal Line.';
        AmountVisible: Boolean;
        DebitCreditVisible: Boolean;
        GenJnlManagement: Codeunit GenJnlManagement;
        CurrentDocNo: Code[20];
        CurrentPostingDate: Date;
    begin
        IsSaaSExcelAddinEnabled := ServerSetting.GetIsSaasExcelAddinEnabled();
        VATDateEnabled := VATReportingDateMgt.IsVATDateEnabled();
        UseAllocationAccountNumber := AllocationAccountMgt.UseAllocationAccountNoField();
        if ClientTypeManagement.GetCurrentClientType() = CLIENTTYPE::ODataV4 then
            exit;

        BalAccName := '';
        SetControlVisibility();
        SetDimensionVisibility();
        if OpenJournalFromBatch() then
            exit;

        SelectTemplate();

        // OnOpenPageOnBeforeGetLastViewedJournalBatchName(CurrentJnlBatchName, GenJnlManagement);
        LastGenJnlBatch := GenJnlManagement.GetLastViewedJournalBatchName(PAGE::"General Journal");
        if LastGenJnlBatch <> '' then
            CurrentJnlBatchName := LastGenJnlBatch;
        // OnOpenPageOnAfterAssignCurrentJnlBatchName(CurrentJnlBatchName);

        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
        SetControlAppearanceFromBatch();

        SetDataForSimpleModeOnOpen();

        if IsSimplePage and (CurrentDocNo = '') and GenJnlManagement.IsBatchNoSeriesEmpty(CurrentJnlBatchName, Rec) then
            Message(DocumentNumberMsg);
    end;

    local procedure SetDataForSimpleModeOnOpen()
    var
        CurrentPostingDate: Date;
        CurrentCurrencyCode: Code[10];
    begin
        if IsSimplePage then begin
            // Filter on the first record
            Rec.SetCurrentKey("Document No.", "Line No.");
            if Rec.FindFirst() then
                SetDataForSimpleMode(Rec)
            else begin
                // if no rec is found reset the currentposting date to workdate and currency code to empty
                CurrentPostingDate := WorkDate();
                Clear(CurrentCurrencyCode);
            end;
        end;
    end;

    local procedure SetDataForSimpleMode(GenJournalLine1: Record "Gen. Journal Line")
    var
        CurrentPostingDate: Date;
        CurrentCurrencyCode: Code[10];
        CurrentDocNo: Code[20];
    begin
        CurrentDocNo := GenJournalLine1."Document No.";
        CurrentPostingDate := GenJournalLine1."Posting Date";
        CurrentCurrencyCode := GenJournalLine1."Currency Code";
        SetDocumentNumberFilter(CurrentDocNo);
    end;

    local procedure SetDocumentNumberFilter(DocNoToSet: Code[20])
    var
        OriginalFilterGroup: Integer;
    begin
        OriginalFilterGroup := Rec.FilterGroup;
        Rec.FilterGroup := 25;
        Rec.SetFilter("Document No.", DocNoToSet);
        Rec.FilterGroup := OriginalFilterGroup;
    end;

    local procedure SelectTemplate()
    var
        JnlSelected: Boolean;
        IsHandled: Boolean;
        GenJnlManagement: Codeunit GenJnlManagement;
    begin
        IsHandled := false;
        // OnBeforeSelectTemplate(Rec, GenJnlManagement, IsHandled);
        if IsHandled then
            exit;

        GenJnlManagement.TemplateSelection(PAGE::"General Journal", Enum::"Gen. Journal Template Type"::General, false, Rec, JnlSelected);
        if not JnlSelected then
            Error('');
    end;

    local procedure SetDimensionVisibility()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        if not IsSimplePage then
            DimMgt.UseShortcutDims(
              DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimMgt);
    end;

    local procedure OpenJournalFromBatch() Result: Boolean
    var
        IsHandled: Boolean;
        GenJnlManagement: Codeunit GenJnlManagement;
    begin
        IsHandled := false;
        // OnBeforeOpenJournalFromBatch(Rec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if Rec.IsOpenedFromBatch() then begin
            CurrentJnlBatchName := Rec."Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            SetControlAppearanceFromBatch();
            SetDataForSimpleModeOnOpen();
            exit(true);
        end;
    end;

    local procedure SetControlAppearanceFromBatch()
    var
        GenJournalBatch: Record "Gen. Journal Batch";
        ClientTypeManagement: Codeunit "Client Type Management";
        GenJnlManagement: Codeunit GenJnlManagement;
        ShowWorkflowStatusOnBatch: Boolean;
        ShowWorkflowStatusOnLine: Boolean;
        JournalErrorsMgt: Codeunit "Journal Errors Mgt.";
        ShowAllLinesEnabled: Boolean;
        BackgroundErrorCheck: Boolean;
        BackgroundErrorHandlingMgt: Codeunit "Background Error Handling Mgt.";
        ApprovalEntriesExistSentByCurrentUser: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesOnJnlBatchExist: Boolean;
        OpenApprovalEntriesOnJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
        CanCancelApprovalForJnlBatch: Boolean;
        CanCancelApprovalForJnlLine: Boolean;
        ImportPayrollTransactionsAvailable: Boolean;
        IsSaaSExcelAddinEnabled: Boolean;
        CanRequestFlowApprovalForBatch: Boolean;
        CanRequestFlowApprovalForBatchAndAllLines: Boolean;
        CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
        CanCancelFlowApprovalForBatch: Boolean;
        CanCancelFlowApprovalForLine: Boolean;
        EnabledGenJnlLineWorkflowsExist: Boolean;
        EnabledGenJnlBatchWorkflowsExist: Boolean;
    begin
        if ClientTypeManagement.GetCurrentClientType() = CLIENTTYPE::ODataV4 then
            exit;

        if not GenJournalBatch.Get(Rec.GetRangeMax("Journal Template Name"), CurrentJnlBatchName) then
            exit;

        ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RecordId);
        SetApprovalStateForBatch(GenJournalBatch, Rec, OpenApprovalEntriesExistForCurrUser, OpenApprovalEntriesOnJnlBatchExist, OpenApprovalEntriesOnBatchOrAnyJnlLineExist, CanCancelApprovalForJnlBatch, CanRequestFlowApprovalForBatch, CanCancelFlowApprovalForBatch, CanRequestFlowApprovalForBatchAndAllLines, ApprovalEntriesExistSentByCurrentUser, EnabledGenJnlBatchWorkflowsExist, EnabledGenJnlLineWorkflowsExist);
        BackgroundErrorCheck := BackgroundErrorHandlingMgt.BackgroundValidationFeatureEnabled();
        ShowAllLinesEnabled := true;
        Rec.SwitchLinesWithErrorsFilter(ShowAllLinesEnabled);
        JournalErrorsMgt.SetFullBatchCheck(true);
    end;

    local procedure SetControlVisibility()
    var
        GLSetup: Record "General Ledger Setup";
        EnvironmentInfo: Codeunit "Environment Information";
        AmountVisible: Boolean;
        DebitCreditVisible: Boolean;
        IsSaaS: Boolean;
    begin
        IsSaaS := EnvironmentInfo.IsSaaS();
        GLSetup.Get();
        if IsSimplePage then begin
            AmountVisible := false;
            DebitCreditVisible := true;
        end else begin
            AmountVisible := not (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Debit/Credit Only");
            DebitCreditVisible := not (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Amount Only");
        end;
    end;

    procedure GetAccounts(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[100]; var BalAccName: Text[100])
    begin
        if (GenJnlLine."Account Type" <> PrevGenJnlLine."Account Type") or
           (GenJnlLine."Account No." <> PrevGenJnlLine."Account No.")
        then begin
            AccName := '';
            if GenJnlLine."Account No." <> '' then
                AccName := GetAccountName(GenJnlLine."Account Type", GenJnlLine."Account No.");
        end;

        if (GenJnlLine."Bal. Account Type" <> PrevGenJnlLine."Bal. Account Type") or
           (GenJnlLine."Bal. Account No." <> PrevGenJnlLine."Bal. Account No.")
        then begin
            BalAccName := '';
            if GenJnlLine."Bal. Account No." <> '' then begin
                BalAccName := GetAccountName(GenJnlLine."Bal. Account Type", GenJnlLine."Bal. Account No.");
                // Rec."Bal. Account Name" := BalAccName;
                Rec.BalAc := BalAccName;
            end

        end;

        OnAfterGetAccounts(GenJnlLine, AccName, BalAccName);

        PrevGenJnlLine := GenJnlLine;
    end;

    local procedure GetAccountName(AccType: Enum "Gen. Journal Account Type"; AccNo: Code[20]): Text[100]
    var
        KeyName: Text;
        AccName: Text[100];
    begin
        if AccNo = '' then
            exit('');
        KeyName := Format(AccType.AsInteger()) + '$' + AccNo;
        if AccountNames.ContainsKey(KeyName) then
            AccName := CopyStr(AccountNames.Get(KeyName), 1, MaxStrLen(AccName))
        else begin
            AccName := LookupAccountName(AccType, AccNo);
            AccountNames.Add(KeyName, AccName);
        end;
        exit(AccName);
    end;

    local procedure LookupAccountName(AccType: Enum "Gen. Journal Account Type"; AccNo: Code[20]): Text[100]
    var
        [SecurityFiltering(SecurityFilter::Filtered)]
        GLAcc: Record "G/L Account";
        [SecurityFiltering(SecurityFilter::Filtered)]
        Cust: Record Customer;
        [SecurityFiltering(SecurityFilter::Filtered)]
        Vend: Record Vendor;
        [SecurityFiltering(SecurityFilter::Filtered)]
        BankAcc: Record "Bank Account";
        [SecurityFiltering(SecurityFilter::Filtered)]
        FA: Record "Fixed Asset";
        [SecurityFiltering(SecurityFilter::Filtered)]
        ICPartner: Record "IC Partner";
        [SecurityFiltering(SecurityFilter::Filtered)]
        Employee: Record Employee;
        [SecurityFiltering(SecurityFilter::Filtered)]
        AllocationAccount: Record "Allocation Account";
        AccName: Text[100];
    begin
        case AccType of
            AccType::"G/L Account":
                begin
                    GLAcc.SetloadFields(Name);
                    if GLAcc.Get(AccNo) then
                        AccName := GLAcc.Name;
                end;
            AccType::Customer:
                begin
                    Cust.SetloadFields(Name);
                    if Cust.Get(AccNo) then
                        AccName := Cust.Name;
                end;
            AccType::Vendor:
                begin
                    Vend.SetloadFields(Name);
                    if Vend.Get(AccNo) then
                        AccName := Vend.Name;
                end;
            AccType::"Bank Account":
                begin
                    BankAcc.SetloadFields(Name);
                    if BankAcc.Get(AccNo) then
                        AccName := BankAcc.Name;
                end;
            AccType::"Fixed Asset":
                begin
                    FA.SetloadFields(Description);
                    if FA.Get(AccNo) then
                        AccName := FA.Description;
                end;
            AccType::"IC Partner":
                begin
                    ICPartner.SetloadFields(Name);
                    if ICPartner.Get(AccNo) then
                        AccName := ICPartner.Name;
                end;
            AccType::Employee:
                begin
                    Employee.SetloadFields("First Name", "Last Name");
                    if Employee.Get(AccNo) then
                        AccName := Employee."First Name" + ' ' + Employee."Last Name";
                end;
            AccType::"Allocation Account":
                begin
                    AllocationAccount.SetloadFields(Name);
                    if AllocationAccount.Get(AccNo) then
                        AccName := AllocationAccount.Name;
                end;
        end;
        exit(AccName);
    end;

    internal procedure SetApprovalStateForBatch(GenJournalBatch: Record "Gen. Journal Batch"; GenJournalLine: Record "Gen. Journal Line"; var OpenApprovalEntriesExistForCurrentUser: Boolean; var OpenApprovalEntriesOnJournalBatchExist: Boolean; var OpenApprovalEntriesOnBatchOrAnyJournalLineExist: Boolean; var CanCancelApprovalForJournalBatch: Boolean; var LocalCanRequestFlowApprovalForBatch: Boolean; var LocalCanCancelFlowApprovalForBatch: Boolean; var LocalCanRequestFlowApprovalForBatchAndAllLines: Boolean; var LocalApprovalEntriesExistSentByCurrentUser: Boolean; var EnabledGeneralJournalBatchWorkflowsExist: Boolean; var EnabledGeneralJournalLineWorkflowsExist: Boolean)
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowManagement: Codeunit "Workflow Management";
        CanRequestFlowApprovalForAllLines: Boolean;
    begin
        OpenApprovalEntriesExistForCurrentUser := OpenApprovalEntriesExistForCurrentUser or ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RecordId);
        OpenApprovalEntriesOnJournalBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RecordId);
        OpenApprovalEntriesOnBatchOrAnyJournalLineExist := OpenApprovalEntriesOnJournalBatchExist or ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries(GenJournalLine."Journal Template Name", GenJournalLine."Journal Batch Name");
        CanCancelApprovalForJournalBatch := ApprovalsMgmt.CanCancelApprovalForRecord(GenJournalBatch.RecordId);
        WorkflowWebhookManagement.GetCanRequestAndCanCancelJournalBatch(GenJournalBatch, LocalCanRequestFlowApprovalForBatch, LocalCanCancelFlowApprovalForBatch, CanRequestFlowApprovalForAllLines);
        LocalCanRequestFlowApprovalForBatchAndAllLines := LocalCanRequestFlowApprovalForBatch and CanRequestFlowApprovalForAllLines;
        LocalApprovalEntriesExistSentByCurrentUser := ApprovalsMgmt.HasApprovalEntriesSentByCurrentUser(GenJournalBatch.RecordId) or ApprovalsMgmt.HasApprovalEntriesSentByCurrentUser(GenJournalLine.RecordId);

        EnabledGeneralJournalLineWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Gen. Journal Line", WorkflowEventHandling.RunWorkflowOnSendGeneralJournalLineForApprovalCode());
        EnabledGeneralJournalBatchWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Gen. Journal Batch", WorkflowEventHandling.RunWorkflowOnSendGeneralJournalBatchForApprovalCode());
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetAccounts(var GenJournalLine: Record "Gen. Journal Line"; var AccName: Text[100]; var BalAccName: Text[100])
    begin
    end;

    // [IntegrationEvent(true, false)]
    // local procedure OnBeforeOpenJournalFromBatch(var GenJournalLine: Record "Gen. Journal Line"; var Result: Boolean; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(true, false)]
    // local procedure OnBeforeSelectTemplate(var GenJournalLine: Record "Gen. Journal Line"; var GenJnlManagement: Codeunit GenJnlManagement; var IsHandled: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnOpenPageOnAfterAssignCurrentJnlBatchName(var CurrentJnlBatchName: Code[10])
    // begin
    // end;

    // [IntegrationEvent(true, false)]
    // local procedure OnOpenPageOnBeforeGetLastViewedJournalBatchName(var CurrentJnlBatchName: Code[10]; var GenJnlManagement: Codeunit GenJnlManagement)
    // begin
    // end;
}

#pragma implicitwith restore

