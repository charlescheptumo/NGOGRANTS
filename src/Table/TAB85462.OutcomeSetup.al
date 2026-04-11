table 85462 "Outcome Setup"
{
    Caption = 'Outcome Setup';
    DataClassification = ToBeClassified;
    DrillDownPageID = "Outcome Setups";
    LookupPageID = "Outcome Setups";
    

    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[2048])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
