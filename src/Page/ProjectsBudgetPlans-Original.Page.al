#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65114 "Projects Budget Plans-Original"
{
    ApplicationArea = Jobs;
    Caption = 'Projects Budget Plans';
    CardPageID = "Budget Plan Card-Original";
    Editable = false;
    PageType = List;
    SourceTable = "Project Budget Header";
    SourceTableView = where("Budget Type"=const(Original),
                            "Procurement Plan"=const(false),
                            Posted=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(ProjectBudgetID;Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectID;Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetType;Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialYearCode;Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus;Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
