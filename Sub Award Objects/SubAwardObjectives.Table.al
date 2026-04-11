table 65060 "Sub Award Objectives"
{
    Caption = 'Sub Award Objectives';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sub Award No"; Code[30])
        {
            Caption = 'Sub Award No';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(3; "Objectives"; text[255])
        {
            Caption = 'Objectives';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Sub Award No", "Line No")
        {
            Clustered = true;
        }
    }
}
