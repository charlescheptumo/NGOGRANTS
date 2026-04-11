table 97124 "Output Setup"
{
    Caption = 'Output Setup';
    DataClassification = ToBeClassified;
    DrillDownPageID = "Output Setups";
    LookupPageID = "Output Setups";
    
    fields
    {
        field(1; "Output Code"; Code[50])
        {
            Caption = 'Output Code';
        }
        field(2; "Output Description"; Text[2000])
        {
            Caption = 'Output Description';
        }
    }
    keys
    {
        key(PK; "Output Code")
        {
            Clustered = true;
        }
    }
}
