table 97131 "GL Entry Change"
{
    Caption = 'GL Entry Change';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "GL Correction Entry No."; Integer)
        {
            TableRelation = "Update GL Entries"."Entry No.";
        }

        field(2; "Project No."; Code[20])
        {
            TableRelation = Job."No.";
        }

        field(3; "Project Code"; Text[100])
        {
            TableRelation = "Job Task"."Job No." where("Job No." = field("Project No."));
        }

        field(4; "New Value Task"; Text[100])
        {
            trigger OnValidate()
            var
                DimensionValue: Record "Job Task";
                DimensionCorrectionMgt: Codeunit "GL Entry Mgt";
                DimensionManagement: Codeunit "GLEntries Management";
            begin
                if "New Value Task" = '' then begin
                    Rec.Validate(Rec."Change Type", Rec."Change Type"::"No Change");
                    exit;
                end;

                DimensionCorrectionMgt.VerifyIfDimensionCanBeChanged(Rec);

                if Rec."Change Type" <> Rec."Change Type"::Add then
                    Rec."Change Type" := Rec."Change Type"::Change;

                DimensionValue.SetRange("Job No.", Rec."Project No.");
                DimensionValue.SetRange("Job Task No.", "New Value Task");
                DimensionValue.FindFirst();

                if not DimensionManagement.CheckDim(DimensionValue."Job Task No.") then Error(DimensionManagement.GetDimErr());

                if not DimensionManagement.CheckDimValue(DimensionValue."Job Task No.", DimensionValue."Job Task No.") then
                    Error(DimensionManagement.GetDimErr());

                // Rec."New Value ID" := DimensionValue."Dimension Value ID";
                Rec."New Value Task" := DimensionValue."Job Task No.";
            end;
        }

        field(5; "New Value ID"; Integer)
        {
        }

        field(6; "Change Type"; Option)
        {
            OptionMembers = "No Change","Change","Add","Remove";
            trigger OnValidate()
            var
                DimensionCorrectionMgt: Codeunit "GL Entry Mgt";
            begin
                if Rec."Change Type" = Rec."Change Type"::Remove then
                    DimensionCorrectionMgt.VerifyIfDimensionCanBeChanged(Rec);

                if Rec."Change Type" in [Rec."Change Type"::"No change", Rec."Change Type"::"Remove"] then begin
                    Clear(Rec."New Value Task");
                    Clear(Rec."New Value ID");
                end;
            end;
        }

        field(10; "Dimension Values"; Blob)
        {
        }

        field(11; "Dimension Value Count"; Integer)
        {
        }
        field(12; "New Value Project"; Text[100])
        {
            trigger OnValidate()
            var
                Dimension: Record Job;
                DimensionCorrectionMgt: Codeunit "GL Entry Mgt";
                DimensionManagement: Codeunit DimensionManagement;
            begin
                if "New Value Project" = '' then begin
                    Rec.Validate(Rec."Change Type", Rec."Change Type"::"No Change");
                    exit;
                end;

                DimensionCorrectionMgt.VerifyIfDimensionCanBeChanged(Rec);

                if Rec."Change Type" <> Rec."Change Type"::Add then
                    Rec."Change Type" := Rec."Change Type"::Change;

                Dimension.SetRange("No.", Rec."Project No.");
                Dimension.SetRange("No.", "New Value Project");
                Dimension.FindFirst();

                if not DimensionManagement.CheckDim(Dimension."No.") then Error(DimensionManagement.GetDimErr());

                if not DimensionManagement.CheckDimValue(Dimension."No.", Dimension."Project No") then
                    Error(DimensionManagement.GetDimErr());

                // Rec."New Value ID" := Dimension."Dimension Value ID";
                Rec."New Value Project" := Dimension."No.";
            end;
        }
    }

    keys
    {
        key(Key1; "GL Correction Entry No.", "Project No.")
        {
            Clustered = true;
        }
    }

    procedure SetDimensionValues(DimensionValues: List of [Integer])
    var
        DimValuesOutStream: OutStream;
        DimSetValue: Integer;
        DimSetValueFilter: Text;
    begin
        if DimensionValues.Count() = 0 then begin
            Clear(Rec."Dimension Values");
            exit;
        end;

        foreach DimSetValue in DimensionValues do
            if DimSetValueFilter = '' then
                DimSetValueFilter += Format(DimSetValue)
            else
                DimSetValueFilter += '|' + Format(DimSetValue);

        Rec."Dimension Values".CreateOutStream(DimValuesOutStream);
        DimValuesOutStream.WriteText(DimSetValueFilter);
    end;

    procedure GetDimensionValues(): Text
    var
        DimValuesInStream: InStream;
        DimSetValueFilter: Text;
    begin
        Rec.CalcFields(Rec."Dimension Values");
        if not Rec."Dimension Values".HasValue() then
            exit('');

        Rec."Dimension Values".CreateInStream(DimValuesInStream);
        DimValuesInStream.ReadText(DimSetValueFilter);
        exit(DimSetValueFilter);
    end;
}
