page 50102 EssPortalUsers
{
    ApplicationArea = All;
    Caption = 'EssPortalUsers';
    PageType = List;
    SourceTable = HRPortalUsers;
    UsageCategory = Lists;
    DeleteAllowed = false;
    Editable = false;
    CardPageId = PortalUserCard;

    layout
    {
        area(content)
        {
            repeater(General)
            {

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
}
