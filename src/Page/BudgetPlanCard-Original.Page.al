#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65115 "Budget Plan Card-Original"
{
    Caption = 'Project Budget Plan Card';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Prices';
    RefreshOnActivate = true;
    SourceTable = "Project Budget Header";
    SourceTableView = where("Procurement Plan" = const(false));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(ProjectBudgetID; Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BudgetType; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProjectID; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReceiptReference; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Reference';
                }
                field(FinancialYearCode; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CurrencyCode; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(OriginalBudgetCost; Rec."Original Budget Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(OriginalBudgetCostLCY; Rec."Original Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FundingSource; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Budgeting Details")
            {
                field(TotalUnbudgetedAmount; Rec."Total Unbudgeted Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BudgetCategory; Rec."Budget Category")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptToBugdet; Rec."Receipt To Bugdet")
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptAmountToBudget; Rec."Receipt Amount To Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control11; "Budget Planning Lines")
            {
                SubPageLink = "Project Budget ID" = field("Project Budget ID"),
                              "Job No." = field("Project ID");
            }
            // part(Control26; "Approval Comments Subform")
            // {
            //     Caption = 'Comments';
            //     SubPageLink = "Document No." = field("No. Series");
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                Caption = '&Job';
                Image = Job;
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Rec."Approval Status", Rec."approval status"::Open);
                        Rec.TestField(Rec."Created By", UserId);
                        Rec.TestField(Rec."Budget Category");

                        if Rec."Budget Category" = Rec."budget category"::"Receipt Budget" then begin
                            Rec.TestField(Rec."Receipt To Bugdet");
                            Rec.CalcFields(Rec."Original Budget Cost (LCY)");
                            if Rec."Original Budget Cost (LCY)" <> Rec."Receipt Amount To Budget" then
                                Error('Amount Budgeted must be equal to receipt amount');
                        end;

                        // Temporarily disabled - approval methods need update for BC27
                        Message('Send approval request functionality is temporarily disabled');
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Approval Status", Rec."approval status"::"Pending Approval");
                        Rec.TestField(Rec."Created By", UserId);
                        // Temporarily disabled - approval methods need update for BC27
                        Message('Cancel approval request functionality is temporarily disabled');
                    end;
                }
                separator(Action15)
                {
                }
                action("Post Budget")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Approval Status", Rec."approval status"::Released);
                        Rec.TestField(Rec."Budget Category");

                        if Rec."Budget Category" = Rec."budget category"::"Receipt Budget" then begin
                            Rec.TestField(Rec."Receipt To Bugdet");
                            Rec.CalcFields(Rec."Original Budget Cost (LCY)");
                            if Rec."Original Budget Cost (LCY)" <> Rec."Receipt Amount To Budget" then
                                Error('Amount Budgeted must be equal to receipt amount');
                        end;

                        LineN := 0;
                        BudgetLines.Reset;
                        BudgetLines.SetRange("Project Budget ID", Rec."Project Budget ID");
                        BudgetLines.SetRange("Job No.", Rec."Project ID");
                        BudgetLines.SetRange(Transferred, false);

                        if BudgetLines.Find('-') then begin
                            repeat
                                BudgetLines.TestField("No.");
                                LineN := FnGetLastLineNo(BudgetLines."Job No.", BudgetLines."Job Task No.");
                                if LineN = 0 then
                                    LineN := 1
                                else
                                    LineN := LineN + 1;

                                JobPlanningLines.Init;
                                JobPlanningLines."Line No." := LineN;
                                JobPlanningLines."Job No." := BudgetLines."Job No.";
                                JobPlanningLines."Job Task No." := BudgetLines."Job Task No.";
                                JobPlanningLines.Type := BudgetLines.Type;
                                JobPlanningLines."No." := BudgetLines."No.";
                                JobPlanningLines.Validate(JobPlanningLines."No.");
                               // JobPlanningLines."Receipt Reference" := Rec."Receipt To Bugdet";
                                JobPlanningLines."Document No." := Rec."Project Budget ID";
                                JobPlanningLines."Planning Date" := BudgetLines."Planning Date";
                                JobPlanningLines."Planned Delivery Date" := BudgetLines."Planned Delivery Date";
                                JobPlanningLines.Quantity := BudgetLines.Quantity;
                                JobPlanningLines.Validate(JobPlanningLines.Quantity);
                                JobPlanningLines."Unit Cost" := BudgetLines."Unit Cost (LCY)";
                                JobPlanningLines.Validate("Unit Cost");
                                JobPlanningLines."Job Budget Templates" := BudgetLines."Job Budget Templates";
                                JobPlanningLines."Budget Type" := BudgetLines."Budget Type";
                                JobPlanningLines."Directorate Code" := BudgetLines."Directorate Code";
                                JobPlanningLines."Department Code" := BudgetLines."Department Code";
                                JobPlanningLines.Division := BudgetLines.Division;
                                JobPlanningLines.Insert();
                                BudgetLines.Transferred := true;
                                BudgetLines.Modify;
                            until BudgetLines.Next = 0;
                        end;

                        Message('Budget Posted Successfully');
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        Rec."Budget Type" := Rec."budget type"::Original;
        Rec."Procurement Plan" := false;
    end;

    var
        FormatAddress: Codeunit "Format Address";
        JobSimplificationAvailable: Boolean;
        TotalBudgetCommitments: Decimal;
        AvailableFunds: Decimal;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        JobPlanningLines: Record "Job Planning Line";
        BudgetHeader: Record "Project Budget Header";
        BudgetLines: Record "Project Budget Planning Line";
        ProcurementHeader: Record "Procurement Header";
       // ProcurementLine: Record "Procurement Plan 1";
        ProcurementEntry: Record "Procurement Plan Entry1";
        LineNumber: Integer;
        LineN: Integer;
        receiptheader: Record "Receipts Header1";

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
    end;

    procedure FnGetLastLineNo(JobNo: Code[30]; TaskNo: Code[30]) LineNumber: Integer
    begin
        JobPlanningLines.Reset;
        JobPlanningLines.SetRange("Job No.", JobNo);
        JobPlanningLines.SetRange("Job Task No.", TaskNo);
        if JobPlanningLines.FindLast then begin
            LineNumber := JobPlanningLines."Line No.";
        end;
        exit(LineNumber);
    end;

    procedure FnGetLastPLineNo() EntryNumber: Integer
    begin
        ProcurementEntry.Reset;
        if ProcurementEntry.FindLast then begin
            EntryNumber := ProcurementEntry."Entry No.";
        end;
        exit(EntryNumber);
    end;
}