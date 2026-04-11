table 50037 Objectives
{
    Caption = 'Objectives';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Workplan No"; Code[20])
        {
            Caption = 'Workplan No';
            DataClassification = ToBeClassified;
        }

        field(2; Objective; Text[250])
        {
            Caption = 'Objective';
            DataClassification = ToBeClassified;
        }
        field(3; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(4; "Goal no"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Type"; Enum "PMObjectives Document Type")
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Workplan No", "Line No", "Goal no", "Document Type")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup("Goal no"; Objective)
        {

        }
    }
}
