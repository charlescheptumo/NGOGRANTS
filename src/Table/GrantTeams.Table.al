#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65054 "Grant Teams"
{
    DataCaptionFields = "Team Code","Team Description";
    DrillDownPageID = "Grant Teams";
    LookupPageID = "Grant Teams";

    fields
    {
        field(1;"Team Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Team Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Team Code")
        {
            Clustered = true;
        }
        key(Key2;"Team Description")
        {
        }
    }

    fieldgroups
    {
    }
}
