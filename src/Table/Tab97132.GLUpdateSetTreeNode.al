table 97132 "GL Update Set Tree Node"
{
    Caption = 'GL Update Set Tree Node';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Parent GL Update Set ID"; Integer)
        {
            Caption = 'Parent GL Update Set ID';
        }
        field(2; "GL Update Value ID"; Integer)
        {
            Caption = 'GL Update Value ID';
        }
        field(3; "GL Update Set ID"; Integer)
        {
            AutoIncrement = true;
            Caption = 'GL Update Set ID';
        }
        field(4; "In Use"; Boolean)
        {
            Caption = 'In Use';
        }
    }

    keys
    {
        key(Key1; "Parent GL Update Set ID", "GL Update Value ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
