tableextension 50146 "Comment Line Ext" extends "Comment Line"
{
    fields
    {
        field(50000; "Comment Description"; Text[2048])
        {
            Caption = 'Additional Comment';
            DataClassification = ToBeClassified;
        }
    }
}
