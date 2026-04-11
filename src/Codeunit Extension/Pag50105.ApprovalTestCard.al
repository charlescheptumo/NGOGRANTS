page 50105 "Approval Test Card"
{
    ApplicationArea = All;
    Caption = 'Approval Test Card';
    PageType = Card;
    SourceTable = "Approval Test";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Approval status"; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Approval status field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                //Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                //Promoted = true;
                //PromotedCategory = Category4;
                ToolTip = 'Executes the Send A&pproval Request action.';


                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin

                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                //Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.

                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);


                end;
            }
        }
    }
    
}