tableextension 50072 "Employee Relative Ext" extends "Employee Relative"
{
    fields
    {
        field(50000; "Emergency Contact"; Boolean)
        {
            Caption = 'Emergency Contact';
            DataClassification = ToBeClassified;
        }
    }
}
