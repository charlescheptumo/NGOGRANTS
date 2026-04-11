pageextension 50148 "Purchase Quote Ext" extends "Purchase Quote"
{
    layout
    {
        addafter("No.")
        {
            field("Invitation For Supply No"; Rec."Invitation For Supply No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Invitation For Supply No field.';
            }
        }
    }

}
