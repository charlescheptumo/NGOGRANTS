table 97125 "Plan Activities"
{
    Caption = 'WorkPlan Activities';
    DataClassification = ToBeClassified;
    DrillDownPageID = "Plan Activities";
    LookupPageID = "Plan Activities";
    
    fields
    {
        // field(1; "Work Plan No."; Code[50])
        // {
        //     Caption = 'Work Plan No';
        //     tablerelation="Workplan Header"."Document No.";
        // }
        // field(2; "Outcome No"; Code[50])
        // {
        //     Caption = 'Outcome No';

        //     TableRelation ="Outcome Setup".Code;

        //     trigger OnValidate()
        //     begin
        //         "Work Plan No." := "Work Plan No.";
        //         Outcome.Reset;
        //         Outcome.SetRange(Code,"Outcome No");
        //         if Outcome.Find('-') then begin
        //             "Outcome Description" := Outcome.Description;
        //         end
        //     end;
        // }
        // field(3; "Output No"; Code[50])
        // {
        //     Caption = 'Output No';

        //     TableRelation = "Output Setup"."Output Code";

        //     trigger OnValidate()
        //     begin
        //         "Work Plan No." := "Work Plan No.";
        //         Output.Reset;
        //         Output.SetRange("Output Code","Output No");
        //         if Output.Find('-') then begin
        //             "Output Description" := Output."Output Description";
        //         end
        //     end;
        // }
        // field(4; "Output Description"; Text[2048])
        // {
        //     Caption = 'Output Description';
        // }
        field(5; "Activity ID"; Code[100])
        {
            Caption = 'Activity ID';
        }
        field(6; "Activity Description"; Text[500])
        {
            Caption = 'Activity Description';
        }
        // field(7; "Outcome Description"; Text[2048])
        // {
        //     Caption = 'Outcome Description';
        // }
        // field(8; "Sub Activity ID"; Code[50])
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(9; "Sub Activity Description"; Text[2048])
        // {
        //     Caption = 'Sub Activity Description';
        // }
    }
    keys
    {
        // key(PK; "Work Plan No.","Outcome No","Output No","Activity ID")
        // {
        //     Clustered = true;
        // }
        key(PK; "Activity ID")
        {
            Clustered = true;
        }
    }

    var
        Outcome: Record "Outcome Setup";
        
        Output: Record "Output Setup";
}
