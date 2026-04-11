codeunit 50001 "Process Extensions"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnBeforeGetNoSeriesCode', '', false, false)]
    local procedure OnBeforeGetNoSeriesCode(var Sender: Record "Purchase Header"; PurchSetup: Record "Purchases & Payables Setup"; var NoSeriesCode: Code[20]; var IsHandled: Boolean; var PurchaseHeader: Record "Purchase Header");
    begin
        case PurchaseHeader."Document Type" of
            purchaseHeader."Document Type"::"Purchase Requisition":
                NoSeriesCode := PurchSetup."Purchase Requisition Nos.";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateNo', '', false, false)]
    local procedure OnBeforeValidateNo(var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line"; CurrentFieldNo: Integer; var IsHandled: Boolean);
    begin
        if (PurchaseLine."Document Type" = PurchaseLine."Document Type"::"Purchase Requisition") and (PurchaseLine.Type = PurchaseLine.Type::"G/L Account") then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeCheckBuyFromVendorNo', '', false, false)]
    local procedure OnBeforeCheckBuyFromVendorNo(PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean);
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition" then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch. Price Calc. Mgt.", 'OnBeforeFindPurchLinePrice', '', false, false)]
    local procedure OnBeforeFindPurchLinePrice(var PurchaseLine: Record "Purchase Line"; var PurchaseHeader: Record "Purchase Header"; CalledByFieldNo: Integer; var IsHandled: Boolean);
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition" then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetPurchApprovalDocumentType', '', false, false)]
    local procedure OnGetPurchApprovalDocumentType(PurchDocumentType: Enum "Purchase Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean);
    var
    begin
        if PurchDocumentType = PurchDocumentType::"Purchase Requisition" then
            ApprovalDocumentType := ApprovalDocumentType::"Purchase requisition";
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean);
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition" then begin

            PurchaseHeader.CheckPurchaseReleaseRestrictions();
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCode(var GenJournalLine: Record "Gen. Journal Line"; var HideDialog: Boolean);
    var

    begin
        if GenJournalLine."Posting Date" > CalcDate('CM', WorkDate()) then
            if not isFinanceHOD() then
                Error('You cannot post outside the current month');
        if GenJournalLine."Posting Date" < CalcDate('-CM', WorkDate()) then
            if not isFinanceHOD() then
                Error('You cannot post outside the current month');

    end;

    [EventSubscriber(ObjectType::Report, Report::"Create Time Sheets", OnBeforeResourceOnAfterGerRecord, '', false, false)]
    local procedure OnBeforeResourceOnAfterGerRecord(var Resource: Record Resource; var IsHandled: Boolean; var StartingDate: Date; var EndingDate: Date);
    begin
        EndingDate := CalcDate('<CM>', StartingDate);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Actual/Sched. Summary FactBox", OnBeforeUpdateData, '', false, false)]
    local procedure OnBeforeUpdateData(var Sender: Page "Actual/Sched. Summary FactBox"; var TimeSheetHeader: Record "Time Sheet Header"; var DateDescription: array[7] of Text[30]; var DateQuantity: array[7] of Text[30]; var TotalQtyText: Text[30]; var TotalQuantity: Decimal; var AbsenceQty: Decimal; var PresenceQty: Decimal; var IsHandled: Boolean);
    begin
        IsHandled := true;
    end;

    ///Allows all users to view approval entries
    [EventSubscriber(ObjectType::Table, Database::"Approval Entry", OnBeforeMarkAllWhereUserisApproverOrSender, '', false, false)]
    local procedure OnBeforeMarkAllWhereUserisApproverOrSender(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean);
    begin
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Calc.Discount", OnBeforeCalcPurchaseDiscount, '', false, false)]
    local procedure OnBeforeCalcPurchaseDiscount(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; UpdateHeader: Boolean; var GlobalPurchaseLine: Record "Purchase Line");
    begin
        IsHandled := true;
    end;


    procedure isFinanceHOD(): Boolean
    var
        Userstp: Record "User Setup";
    begin
        Userstp.Get(UserId);
        exit(Userstp."HOD Finance");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnBeforeGetFullDocTypeTxt, '', false, false)]
    local procedure OnBeforeGetFullDocTypeTxt(var PurchaseHeader: Record "Purchase Header"; var FullDocTypeTxt: Text; var IsHandled: Boolean);
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Purchase Requisition" then begin
            FullDocTypeTxt := 'Purchase Requisition';
            IsHandled := true;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::Resource, OnBeforeCreateTimeSheets, '', false, false)]
    local procedure Resource_OnBeforeCreateTimeSheets(var Resource: Record Resource; var IsHandled: Boolean)
    begin
        Resource.TestField("Use Time Sheet", true);

        Resource.SetRecFilter();
        REPORT.RunModal(REPORT::"Create Timesheets", true, false, Resource);
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Default Dimension", OnUpdateJobGlobalDimCodeOnBeforeJobModify, '', false, false)]
    local procedure "Default Dimension_OnUpdateJobGlobalDimCodeOnBeforeJobModify"(var Job: Record Job; NewDimValue: Code[20]; GlobalDimCodeNo: Integer)
    begin
        case GlobalDimCodeNo of
            3:
                Job."Shortcut Dimension 3 Code" := NewDimValue;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApprovalEntryInsert', '', false, false)]
    local procedure OnBeforeApprovalEntryInsert(var ApprovalEntry: Record "Approval Entry"; ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepArgument: Record "Workflow Step Argument"; ApproverId: Code[50]; var IsHandled: Boolean)
    var
        UserSetup: Record "User Setup";
        UserSetupEmployee: Record "User Setup";
        Employee: Record Employee;
        EmployeeNo: Code[20];
        LeaveApplications: Record "HR Leave Application";
        TimesheetHeader: Record "Time Sheet Header";
    begin
        case WorkflowStepArgument."Approver Type" of
            WorkflowStepArgument."Approver Type"::Approver:
                begin
                    if WorkflowStepArgument."Approver Limit Type" = WorkflowStepArgument."Approver Limit Type"::"Direct Approver" then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Portal User" then begin
                                LeaveApplications.Reset();
                                LeaveApplications.SetRange("Application Code", ApprovalEntryArgument."Document No.");
                                if LeaveApplications.FindFirst then begin
                                    ApprovalEntryArgument."Employee No." := LeaveApplications."Employee No";
                                end;
                                TimesheetHeader.Reset();
                                TimesheetHeader.SetRange("No.", ApprovalEntryArgument."Document No.");
                                if TimesheetHeader.find('-') then begin
                                    ApprovalEntryArgument."Employee No." := TimesheetHeader."Resource No.";
                                end;
                                if Employee.Get(ApprovalEntryArgument."Employee No.") then begin
                                    UserSetupEmployee.Reset();
                                    UserSetupEmployee.SetRange("Employee No.", ApprovalEntryArgument."Employee No.");
                                    if UserSetupEmployee.FindFirst then begin
                                        ApprovalEntry."Sender ID" := UserSetupEmployee."User ID";
                                        ApprovalEntry."Approver ID" := UserSetupEmployee."Approver ID";
                                        ApproverId := ApprovalEntry."Approver ID";
                                    end;
                                end
                            end;
                        end
                    end
                end;

        end;
    end;

}
