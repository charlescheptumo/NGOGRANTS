pageextension 50076 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field("Acc Name"; "Acc Name")
            {
                Caption = 'Account Name';
                ApplicationArea = Basic;
            }
        }
        addafter("Bal. Account No.")
        {
            field("Bal. Acc Name"; "Bal. Acc Name")
            {
                Caption = 'Bal. Account Name';
                ApplicationArea = Basic;
            }
        }
    }
}
