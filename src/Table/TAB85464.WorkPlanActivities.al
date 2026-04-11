table 85464 "Workplan Activites"
{
    Caption = 'Workplan Activities';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            Caption = 'Workplan No';
            tablerelation="Workplan Header"."Document No.";
        }

        field(2; "Outcome Code"; Code[30])
        {
            Caption = 'Outcome Code';
            TableRelation ="Workplan Outcome Setup"."Outcome Code"  where ("Workplan No."=field("Workplan No."));

            trigger OnValidate()
            begin
               // "Workplan No." := "Workplan No.";
                Out.Reset;
                Out.SetRange(Code,"Outcome Code");
                if Out.Find('-') then begin
                    Description := Out.Description;
                end
            end;

        }
         field(3; Description; Text[500])
        {
            Caption = 'Outcome Description';
        }
         field(4; "Output Code"; Code[30])
        {
            Caption = 'Output Code';
            TableRelation = "Workplan Outcome Setup"."Output Code" where ("Outcome Code"=field("Outcome Code"));

            trigger OnValidate()
            begin
                //"Workplan No." := "Workplan No.";
                WorkOut.Reset;
                WorkOut.SetRange("Output Code","Output Code");
                if WorkOut.Find('-') then begin
                     "Output Decription":= WorkOut."Output Decription";
                end
            end;
        }
         field(5; "Output Decription";  Text[2048])
        {
            Caption = 'Output Decription';
        }
        field(6; "Activity ID"; Code[30])
        {
            Caption = 'Activity ID';
            // TableRelation = "Workplan Outcome Setup"."Activity ID" where("Activity ID"=field("Activity ID"));
            TableRelation = "Plan Activities";

            trigger OnValidate()
            begin
                //"Workplan No." := "Workplan No.";
                PlanActivity.Reset;
                PlanActivity.SetRange("Activity ID","Activity ID");
                if PlanActivity.Find('-') then begin
                     "Activity Description":= PlanActivity."Activity Description";
                end
                // WorkOut.Reset;
                // WorkOut.SetRange("Activity ID","Activity ID");
                // if WorkOut.Find('-') then begin
                //      "Activity Description":= WorkOut."Activity Description";
                // end
            end;
             
        }
        field(7; "Activity Description"; Text[2048])
        {
            Caption = 'Activity Description';
        }
        field(8; "Sub Activity ID"; Code[30])
        {
            Caption = 'Sub Activity ID';
            // TableRelation = "Workplan Outcome Setup"."Sub Activity ID" where("Sub Activity ID"=field("Sub Activity ID"));
            TableRelation = "WorkPlan Sub Activities";


            trigger OnValidate()
            begin
                //"Workplan No." := "Workplan No.";
                WorkPlanSubActivities.Reset;
                WorkPlanSubActivities.SetRange("Sub Activity ID","Sub Activity ID");
                if WorkPlanSubActivities.Find('-') then begin
                     "Sub Activity Description":= WorkPlanSubActivities."Sub Activity Description";
                end
                // WorkOut.Reset;
                // WorkOut.SetRange("Sub Activity ID","Sub Activity ID");
                // if WorkOut.Find('-') then begin
                //      "Sub Activity Description":= WorkOut."Sub Activity Description";
                // end
            end;
             
        }
        field(9; "Sub Activity Description"; Text[2048])
        {
            Caption = 'Sub Activity Description';
        }
       
    }
    keys
    {
        key(PK; "Workplan No.","Outcome Code","Output Code","Activity ID","Sub Activity ID")
        {
            Clustered = true;
        }
    }

    var
        Out: Record "Outcome Setup";
        WorkOut: Record "Workplan Outcome Setup";
        PlanActivity: Record "Plan Activities";
        WorkPlanSubActivities: Record "WorkPlan Sub Activities";
}
