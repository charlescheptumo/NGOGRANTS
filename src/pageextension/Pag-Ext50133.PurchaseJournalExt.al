pageextension 50133 "Purchase Journal Ext" extends "Purchase Journal"
{
    layout
    {
        addafter("Gen. Prod. Posting Group")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
                Caption = 'Project No.';
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
                Caption = 'Project Activity Code';
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
                Caption = 'Project Activity Quantity';
            }
        }
        modify(AccName)
        {
            Caption = 'Account Name';
        }
        modify("Currency Code")
        {
            Visible = true;
        }
    }
}
