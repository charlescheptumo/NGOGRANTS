page 50107 APHFStaff
{
    ApplicationArea = All;
    Caption = 'APHF Staff';
    PageType = RoleCenter;
    
    layout
    {
        area(RoleCenter)
        {
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Requisitions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Advance requests';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Advance requests.';
                }
                action("Approved Imprest Requisitions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Advance requests ';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Imprest Requisitions";
                    ToolTip = 'Approved Advance requests.';
                }
                action("Imprest Surrenders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Advance requests Surrenders';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Advance requests Surrenders.';
                }
                action("Approved Imprest Surrenders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Advance Surrenders';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Imprest Surrenders";
                    ToolTip = 'Approved Advance Surrenders.';
                }
                action("Staff Claims")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff Claims';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Staff Claims";
                    ToolTip = 'Staff Claims';
                }

                action("Approved Staff Claims")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Staff Claims';
                    Image = BankAccountRec;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Staff Claims";
                    ToolTip = 'Approved Staff Claims';
                }
                action("Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Leave Application";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Leave Application action.';
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Purchase Requisition Card";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Purchase Requisition action.';
                }
                action(Items3)
                {
                    ApplicationArea = Basic;
                    Caption = 'Functional Procurement Plan';
                    RunObject = Page "Departmental Procurement Plan";
                }
                action("Training Needs requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs requests';
                    Image = Balance;
                    RunObject = Page "Training Need Requests";
                    ToolTip = 'Executes the Training Needs requests action.';
                }
                action(Appraisal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Page "Standard Perfomance Appraisal";

                }
                action(SelfSupAppraisal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Page "Self-Supervisor Appraisals";
                    Visible = false;
                }
                action(SelfSupAppraisal1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Page "Self-Supervisor Appraisals-E";
                    Visible = false;
                }
            }

        }
    }
}
