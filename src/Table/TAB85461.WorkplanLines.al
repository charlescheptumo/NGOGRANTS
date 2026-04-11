table 85461 "Workplan Lines"
{
    Caption = 'Workplan Lines';
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
            // TableRelation = "Outcome Setup";
            TableRelation = "Workplan Funding Source"."Outcome Code" where("Work Plan No"= field("Work Plan No"));

            trigger OnValidate()
            begin
                "Work Plan No" := "Work Plan No";
                WorkplanOutputs.Reset;
                WorkplanOutputs.SetRange("Outcome Code","Outcome Code");
                if WorkplanOutputs.Find('-') then begin
                    "Outcome Description" := WorkplanOutputs.Description;
                    "Output Code":=WorkplanOutputs."Output Code";
                    "Output Description":=WorkplanOutputs."Output Decription";
                end
            end;
        }
        field(3; "Outcome Description"; Text[200])
        {
            Caption = 'Outcome Description';
        }
        field(4; "Activity ID"; Code[30])
        {
            Caption = 'Activity ID';
            TableRelation = "Workplan Activites"."Activity ID" where ("Workplan No."=field("Work Plan No"));

              trigger OnValidate() begin
               WorkplanActivities.reset();
                 WorkplanActivities.setrange("Workplan No.","Work Plan No");
                  WorkplanActivities.setrange("Activity ID","Activity ID");
                 IF  WorkplanActivities.findset() then begin
                    "Activity Description":=WorkplanActivities."Activity Description";
                    // "Outcome Code":=WorkplanActivities."Outcome Code";
                    // "Output Code":=WorkplanActivities."Output Code"; 
                    "Sub Activity ID":=WorkplanActivities."Sub Activity ID";
                    "Sub Activity Description":= WorkplanActivities."Sub Activity Description";
                 end              
               end;
            
        }
        field(5; "Activity Description"; Text[200])
        {
            Caption = 'Activity Description';
        }

        field(6; "Sub Activity ID"; Code[30])
        {
            Caption = 'Sub Activity ID';
            TableRelation = "Workplan Funding Source"."Sub Activity ID" where("Work Plan No"= field("Work Plan No"));

            trigger OnValidate() begin
               WorkplanActivities.reset();
                 WorkplanActivities.setrange("Workplan No.","Work Plan No");
                  WorkplanActivities.setrange("Sub Activity ID","Sub Activity ID");
                 IF  WorkplanActivities.findset() then begin
                    // "Outcome Code":=WorkplanActivities."Outcome Code";
                    // "Output Code":=WorkplanActivities."Output Code";
                    "Sub Activity ID":=WorkplanActivities."Sub Activity ID";
                    "Sub Activity Description":= WorkplanActivities."Sub Activity Description";
                 end              
               end;
        }
        field(7; "Sub Activity Description"; Text[200])
        {
            Caption = 'Sub Activity Description';
        }
        field(8; "Annual Reporting Code"; Code[30])
        {
            Caption = 'Annual Reporting Code';
        }
        field(9; "Reporting Code Type"; Option)
        {
            OptionCaption = 'Quarterly,Semi-Quarterly,Annually';
            OptionMembers = Quarterly,"Semi-Quarterly","Annually";
        }
        field(10; "Quarterly Period Code"; Code[30])
        {
            Caption = 'Quarterly Period Code';
        }
        field(11; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(12; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(13; Budget; Decimal)
        {
            Caption = 'Budget';
        }
        field(14; "Utilized Funds"; Decimal)
        {
            Caption = 'Utilized Funds';
        }
        field(15; Balance; Decimal)
        {
            Caption = 'Balance ';
            TableRelation = "Workplan Funding Source".Budget;
        }
        field(16; Comments; Text[2000])
        {
            Caption = 'Comments';
        }

        //added More Fields
         field(17; "Output Code"; Code[30])
        {
            Caption = 'Output Code';
            DataClassification = ToBeClassified;
            TableRelation = "Workplan Funding Source"."Output Code" where("Work Plan No"= field("Work Plan No"));

            trigger OnValidate()
            begin
                "Work Plan No" := "Work Plan No";
                WorkplanOutputs.Reset;
                WorkplanOutputs.SetRange("Outcome Code","Outcome Code");
                if WorkplanOutputs.Find('-') then begin
                    // "Outcome Description" := WorkplanOutputs.Description;
                    // "Output Code":=WorkplanOutputs."Output Code";
                    "Output Description":=WorkplanOutputs."Output Decription";
                end
            end;
        }
        field(18;"Total Funding Source Amount"; Decimal)
        {
            Caption = 'Total Funding Source Amount';
            CalcFormula = sum("Workplan Funding Source".Budget where("Work Plan No"= field("Work Plan No")));
            Editable = false;
            FieldClass = FlowField;

        }
        field(19; "Output Description"; Text[200])
        {
            Caption = 'Output Description';
        }
        field(20;"Implementing Partner"; Code[50])
        {
            Caption = 'Implementing Partner';
            TableRelation = "Workplan Funding Source"."Implementing Partner" where("Work Plan No"= field("Work Plan No"));

             trigger OnValidate()
            begin
                WorkplanFundingSource.Reset;
                WorkplanFundingSource.SetRange("Implementing Partner","Implementing Partner");
                if WorkplanFundingSource.Find('-') then begin
                    "Implementing Partner Name":= WorkplanFundingSource."Implementing Partner Name";
                end
            end;
        }
        field(21;"Implementing Partner Name"; Text[500])
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
    WorkplanActivities: record "Workplan Activites";
    WorkplanFundingSource: Record "Workplan Funding Source";
    WorkplanOutputs: Record "Workplan Outcome Setup";
}