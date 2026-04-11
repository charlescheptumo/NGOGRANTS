page 50103 PortalUserCard
{
    ApplicationArea = All;
    Caption = 'PortalUserCard';
    PageType = Document;
    SourceTable = HRPortalUsers;
    PromotedActionCategories = 'New';
    DeleteAllowed = false;
    RefreshOnActivate = true;



    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Id Number"; Rec.IdNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Employee ID Number';
                }
                field("Employee Number"; Rec.employeeNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Employee Number';

                }
                field("Password"; Rec.password)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee password Number';

                }
                field("Password Changed"; Rec.changedPassword)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether or not an employee has changed their password';

                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Test Email Send")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    HRPortal: Codeunit HRPortal;
                begin
                    HRPortal.resetPassword(rec.employeeNo);
                end;
            }
        }
    }
}
