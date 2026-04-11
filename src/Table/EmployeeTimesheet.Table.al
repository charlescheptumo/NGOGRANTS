table 59995 "Employee Timesheet"
{

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Exit voucher Nos");
                    "No. Series" := '';
                end;
            end;
        }

        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindFirst then begin
                    "Employee Names" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Date of Join" := Employee."Date Of Join";
                    // "Job Id" := Employee."Current Position ID";
                    // Validate("Job Id");
                end;
            end;
        }
        field(5; "Employee Names"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created By"; Code[50])
        {

        }
        field(17; "Created On"; Date)
        {
        }
        field(18; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Timesheet Month"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(23; "Current Year"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Date of Join"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                        Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(28; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                        Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(29; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(30; Project; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where(Status = filter(<> Completed));
        }
        field(31; "Job Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Project));
        }
        field(32; "Project Description"; Text[250])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Shortcut Dimension 2 Code")));
            FieldClass = FlowField;
        }
        field(33; "Approval Document Type"; Enum "Approval Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(34; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval",Released,Rejected,,Closed;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Document No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Exit voucher Nos");
            "Document No." := NoSeriesMgt.GetNextNo(HRSetup."Exit voucher Nos", Today, true);
            //NoSeriesMgt.InitSeries(HRSetup."Exit voucher Nos", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;

        "Created By" := UserId;
        "Created On" := Today;
        "Document Date" := Today;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "Human Resources Setup";
        Employee: Record Employee;
        ExitPlanLines: Record "Exit Plan Lines";
        DimMgt: Codeunit DimensionManagement;
    //PositionExitTemplates: Record "Position Exit Templates";

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //IF "No." <> '' THEN
        //  MODIFY;
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
        MODIFY;
        IF PurchLinesExist THEN
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2', "Document Type", "No."),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
        
        
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;
}

