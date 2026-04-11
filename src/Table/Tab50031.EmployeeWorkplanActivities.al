table 50031 "Employee Workplan Activities"
{
    Caption = 'Employee Workplan Activities';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Goal"; Code[20])
        {
            TableRelation = Objectives."Goal no" where("Workplan No" = field("Workplan No."));

            DataClassification = ToBeClassified;

        }
        field(4; "Key Activities"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Extected Outcome"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Indicators"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "30 Days"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "60 Days"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "90 Days"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "EOY"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Comments RML"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Comments Supervisor"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Notes; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; DurationNeeded; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Workplan No.", EntryNo, Goal)
        {
            Clustered = true;
        }
    }
}
