#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65128 "Cost Reimbursement Billings"
{
    ApplicationArea = Jobs;
    Caption = 'Project Billable List';
    CardPageID = "Cost Reimbursement Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Billable Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(ProjectBillableID;Rec."Project Billable ID")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectID;Rec."Project ID")
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
            }
        }
    }

    actions
    {
    }
}
