pageextension 50003 "Employee Relatives Ext" extends "Employee Relatives"
{
    layout
    {
        modify("Middle Name")
        {
            Visible = true;
        }
        addafter("Middle Name")
        {

            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Last Name field.';
            }
        }
        addlast(content)
        {

            field("Emergency Contact"; Rec."Emergency Contact")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Emergency Contact field.';
            }
        }
    }

}
