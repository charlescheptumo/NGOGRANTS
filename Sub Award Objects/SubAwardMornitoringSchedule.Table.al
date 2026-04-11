table 65065 "Sub Award Mornitoring Schedule"
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
        field(3; "Visit Code"; Code[30])
        {
            Caption = 'Visit Code';
            DataClassification = ToBeClassified;
        }
        field(4; "Visiting Date"; Date)
        {
            Caption = 'Visiting Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Focus Area"; Text[255])
        {
            Caption = 'Focus Area';
            DataClassification = ToBeClassified;
        }
        field(8; "Report to Sub-grantee"; Date)
        {
            Caption = 'Report to Sub-grantee';
            DataClassification = ToBeClassified;

        }
        field(9; "Report to Donor"; Date)
        {
            Caption = 'Report to Donor';
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
