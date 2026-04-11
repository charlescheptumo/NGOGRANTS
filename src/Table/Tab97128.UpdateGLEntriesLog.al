table 97128 "Update GL Entries Log"
{
    Caption = 'Update GL Entries Log ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "GL Correction Entry No."; Integer)
        {
            TableRelation = "Update GL Entries"."Entry No.";
        }

        field(2; "Start Entry No."; Integer)
        {
            TableRelation = "Update GL Entries"."Entry No.";
        }

        field(3; "End Entry No."; Integer)
        {
            TableRelation = "Update GL Entries"."Entry No.";
        }
    }

    keys
    {
        key(Key1; "GL Correction Entry No.", "Start Entry No.", "End Entry No.")
        {
        }
    }
}
