table 95252 "Grant Reporting Schedule"
{
    Caption = 'Grant Reporting Schedule';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Grant No"; Code[30])
        {
            Caption = 'Award No';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(3; "Reporting Duration"; DateFormula)
        {
            Caption = 'Reporting Duration';
            DataClassification = ToBeClassified;
        }
        field(4; "From Date"; Date)
        {
            Caption = 'From Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "To Date" := CalcDate('+' + Format("Reporting Duration"), "From Date");
                Validate("To Date");
            end;
        }
        field(5; "To Date"; Date)
        {
            Caption = 'To Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Due Date to Report" := CalcDate('+' + Format("Duration Due to Report"), "To Date");
            end;
        }

        field(6; "Duration Due to Report"; DateFormula)
        {
            Caption = 'Duration Due to Report';
            DataClassification = ToBeClassified;
        }
        field(7; "Due Date to Report"; Date)
        {
            Caption = 'Due Date to Report';
            DataClassification = ToBeClassified;
        }
        field(8; "Type"; Option)
        {
            OptionMembers = "Final Report","Progess Report";
            OptionCaption = 'Final Report,Progess Report';
            DataClassification = ToBeClassified;
        }
        field(9; "Report Type Detailed"; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Report Type Description';
        }
        field(10; "Reporting Period"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Report Description';
        }
        field(11; "Report Due Date Narration"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // Amos  -- Added the fields below to track whether a user has submitted a  report or not (and when). 
        field(12; "Report Status"; Option)
        {
            OptionMembers = "Pending","Submitted";
            OptionCaption = 'Pending,Submitted';
            DataClassification = ToBeClassified;
        }
        field(13; "Report Submitted On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "File name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Grant No", "Line No")
        {
            Clustered = true;
        }
    }
}
