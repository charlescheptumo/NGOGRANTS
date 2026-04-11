table 85465 "Workplan Funding Source"
{
    Caption = 'Workplan Funding Source';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Work Plan No"; Code[30])
        {
            Caption = 'Work Plan No';
        }
        field(2; "Outcome Code"; Code[30])
        {
            Caption = 'Outcome Code';
            DataClassification = ToBeClassified;
            TableRelation = "Outcome Setup".Code;
        }
        field(3; "Output Code"; Code[30])
        {
            Caption = 'Output Code';
            DataClassification = ToBeClassified;
            TableRelation = "Workplan Outcome Setup"."Output Code" where("Workplan No."=field("Work Plan No"));

            trigger OnValidate()
            begin
                "Work Plan No" := "Work Plan No";
                WorkplanOutcomeSetup.Reset;
                WorkplanOutcomeSetup.SetRange("Output Code","Output Code");
            end;
        }
        
        field(4; "Activity ID"; Code[256])
        {
            Caption = 'Activity ID';
            TableRelation = "Plan Activities"."Activity ID";

            // trigger OnValidate()
            // begin
            //     "Workplan No." := "Workplan No.";
            //     PlanActivity.Reset;
            //     PlanActivity.SetRange("Activity ID","Activity ID");
            //     if PlanActivity.Find('-') then begin
            //          "Activity Description":= PlanActivity."Activity Description";
            //     end
            // end;
        }

        field(5; "Sub Activity ID"; Code[256])
        {
            Caption = 'Sub Activity ID';
            TableRelation = "WorkPlan Sub Activities"."Sub Activity ID";
        }
        
        field(12; Budget; Decimal)
        {
            Caption = 'Budget';
        }
        field(13;"Implementing Partner"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type 2" = const("Implementing Partner"));
            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange("No.","Implementing Partner");
                if Cust.Find('-') then begin
                    "Implementing Partner Name":=Cust.Name;
                end;
            end;
        }
        field(14;"Implementing Partner Name"; Text[500])
        {
            Caption = 'Implementing Partner Name';
        }
       
    }
    keys
    {
        key(PK; "Work Plan No", "Outcome Code","Output Code", "Activity ID","Sub Activity ID","Implementing Partner")
        {
            Clustered = true;
        }
    }

    var
        PlanActivity: Record "Plan Activities";
        WorkplanOutcomeSetup: Record "Workplan Outcome Setup";
        Cust: Record Customer; 
        
}
