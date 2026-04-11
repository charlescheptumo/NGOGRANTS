table 97123 "Workplan Outcome Setup"
{
    Caption = 'Workplan Outcome Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(50001; "Workplan No."; Code[30])
        {
            Caption = 'Workplan No';
            tablerelation="Workplan Header"."Document No.";
        }

        field(50002; "Outcome Code"; Code[30])
        {
            Caption = 'Outcome Code';
            TableRelation ="Outcome Setup".Code;

            trigger OnValidate()
            begin
                "Workplan No." := "Workplan No.";
                Outcome.Reset;
                Outcome.SetRange(Code,"Outcome Code");
                if Outcome.Find('-') then begin
                    Description := Outcome.Description;
                end
            end;

        }
         field(50003; Description; Text[2000])
        {
            Caption = 'Description';
        }
         field(50004; "Output Code"; Code[30])
        {
            Caption = 'Output Code';
            TableRelation = "Output Setup"."Output Code";

            trigger OnValidate()
            begin
                "Workplan No." := "Workplan No.";
                Output.Reset;
                Output.SetRange("Output Code","Output Code");
                if Output.Find('-') then begin
                    "Output Decription" := Output."Output Description";
                end
            end;
        }
        field(50005; "Output Decription";  Text[500])
        {
            Caption = 'Output Description';
        }
        // field(50006; "Activity ID"; Code[100])
        // {
        //     Caption = 'Activity ID';
        //     TableRelation = "Plan Activities"."Activity ID";

        //     trigger OnValidate()
        //     begin
        //         "Workplan No." := "Workplan No.";
        //         PlanActivity.Reset;
        //         PlanActivity.SetRange("Activity ID","Activity ID");
        //         if PlanActivity.Find('-') then begin
        //              "Activity Description":= PlanActivity."Activity Description";
        //         end
        //     end;
        // }
        // field(50007; "Activity Description"; Text[500])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Activity Description';
        // }
        // field(50008; "Sub Activity ID"; Code[100])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Sub Activity ID';
        //     TableRelation = "WorkPlan Sub Activities"."Sub Activity ID";

        //     trigger OnValidate()
        //     begin
        //         "Workplan No." := "Workplan No.";
        //         WorkPlanSubActivities.Reset;
        //         WorkPlanSubActivities.SetRange("Sub Activity ID","Sub Activity ID");
        //         if WorkPlanSubActivities.Find('-') then begin
        //              "Sub Activity Description":= WorkPlanSubActivities."Sub Activity Description";
        //         end
        //     end;
        // }
        // field(50009; "Sub Activity Description"; Text[500])
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Sub Activity Description';
        // }
       
    }
    keys
    {
        key(PK; "Workplan No.","Outcome Code","Output Code" )
        {
            Clustered = true;
        }
    }

    var
        Outcome: Record "Outcome Setup";
        Output: Record "Output Setup";
        PlanActivity: Record "Plan Activities";
        WorkPlanSubActivities: Record "WorkPlan Sub Activities";

}
