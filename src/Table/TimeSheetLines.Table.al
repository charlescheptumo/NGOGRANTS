table 59996 "Timesheet Lines"
{

    fields
    {
        field(1; "Timesheet Header No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" WHERE("Operating Unit Type" = CONST(Directorate));

            trigger OnValidate()
            begin
                "Timesheet Header No" := "Timesheet Header No";
                ResponsibilityCenter.Reset();
                if ResponsibilityCenter.Find('-') then begin
                    "Department Name" := ResponsibilityCenter.Name;
                end
            end;
        }
        field(4; "Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" WHERE("Operating Unit Type" = CONST("Department/Center"),
                                                           "Direct Reports To" = FIELD("Directorate"));

            trigger OnValidate()
            begin
                "Timesheet Header No" := "Timesheet Header No";
                ResponsibilityCenter.Reset();
                if ResponsibilityCenter.Find('-') then begin
                    "Department Name" := ResponsibilityCenter.Name;
                end
            end;
        }
        field(7; "Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Responsible Employee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(9; "Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Day"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Day Option"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = " ",Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;

        }
        field(11; "Non-working"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(12; Description; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Date Description"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Total Hours"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Project; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where(Status = filter(<> Completed));
        }
        field(16; "Job Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Project));
        }

        // field(17; "Project Description"; Text[250])
        // {
        //     CalcFormula = lookup(Job.Description where("No." = field("Shortcut Dimension 2 Code")));
        //     FieldClass = FlowField;
        // }
        field(18; "Customer"; Code[50])
        {
            Caption = 'Customer';
            TableRelation = Customer."No.";
        }

    }

    keys
    {
        key(Key1; "Timesheet Header No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

