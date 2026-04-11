table 65066 "Sub Award Reporting Schedule"
{
    Caption = 'Sub Award Reporting';
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
            AutoIncrement = true;
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

                // "Due Date to Report" := CalcDate('-' + Format("Due Date to Report"), "To Date");
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
            OptionMembers = "Financial Reporting ","Programmatic Reporting";
            OptionCaption = 'Financial Reporting,Programmatic Reporting';
            DataClassification = ToBeClassified;
        }
        field(9; "Report Type Detailed"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Reporting Period"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Report Due Date Narration"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // Amos  -- Added the fields below to track whether a user has submitted a  report or not (and when). 
        field(12; "Report Status"; Option)
        {
            OptionMembers = "Pending","Submitted","Re-Submission";
            OptionCaption = 'Pending,Submitted,Re-Submission';
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
        field(15; "Re-Submission Comment"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Reporting Type"; Option)
        {
            OptionMembers = " ","Yearly","Quartely";
            OptionCaption = ' ,Yearly,Quartely';
            DataClassification = ToBeClassified;
        }
        field(17; "Submitted By"; Code[20])
        {
            Caption = 'Sub Awardee No';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange("No.", "Submitted By");
                IF Cust.FindSet() then begin
                    "Submitted By Name" := cust.Name;
                end;
            end;
        }
        field(18; "Submitted By Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(19; Notified; Boolean)
        {
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
    var
        Cust: Record Vendor;
}

// trigger OnInsert()
//     begin
//         Rec."Line No":= A
//     end;
