table 99210 WorkplanLines
{
    Caption = 'Work plan Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Work Plan No"; Code[30])
        {
            Caption = 'Work Plan No';
        }
        field(2; "Output Code"; Code[30])
        {
            Caption = 'Output Code';
        }
        field(3; "Output Description"; Text[200])
        {
            Caption = 'Output Description';
        }
        field(4; "Activity ID"; Code[30])
        {
            Caption = 'Activity ID';
        }
        field(5; "Activity Description"; Text[200])
        {
            Caption = 'Activity Description';
        }
        field(6; "Annual Reporting Code"; Code[30])
        {
            Caption = 'Annual Reporting Code';
        }
        field(7; "Reporting Code Type"; Option)
        {
            OptionCaption = 'Quarterly,Semi-Quarterly,Annually';
            OptionMembers = Quarterly,"Semi-Quarterly","Annually";
        }
        field(8; "Quarterly Period Code"; Code[30])
        {
            Caption = 'Quarterly Period Code';
        }
        field(9; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(10; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(11; Budget; Decimal)
        {
            Caption = 'Budget';
        }
        field(12; "Utilized Funds"; Decimal)
        {
            Caption = 'Utilized Funds';
        }
        field(13; Balance; Decimal)
        {
            Caption = 'Balance ';
        }
        field(14; Comments; Text[2000])
        {
            Caption = 'Comments';
        }
    }
    keys
    {
        key(PK; "Work Plan No", "Output Code", "Activity ID")
        {
            Clustered = true;
        }
    }
}
