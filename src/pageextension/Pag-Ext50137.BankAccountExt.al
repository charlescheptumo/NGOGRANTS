pageextension 50137 BankAccountExt extends "Bank Account Card"
{
    layout
    {
        addafter(Name)
        {
            field("Bank Branch No. 2"; Rec."Bank Branch No. 2")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies a number of the bank branch.';
            }
        }
        modify("Bank Branch No.")
        {
            Visible = false;
        }

    }
}
