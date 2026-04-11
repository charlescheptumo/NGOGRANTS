table 65061 "Budget Category"
{
    Caption = 'Budget Category';
    DataClassification = ToBeClassified;

    LookupPageId = "Budget Categories";

    fields
    {
        field(1; "Class Category"; Code[30])
        {
            Caption = 'Class Category';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Class Category")
        {
            Clustered = true;
        }
    }
}
