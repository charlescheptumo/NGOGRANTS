pageextension 50149 "Comment Sheet Ext" extends "Comment Sheet"
{
    layout
    {
        addafter(Comment)
        {

            field("Comment Description"; Rec."Comment Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Comment field.';
            }
        }
    }
}
