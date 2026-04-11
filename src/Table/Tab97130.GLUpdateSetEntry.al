table 97130 "GL Update Set Entry"
{
    Caption = 'GL Update Set Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "GL Update Set ID"; Integer)
        {
            Caption = 'GL Update Set ID';
        }
        field(2; "GL Update Code"; Code[20])
        {
            Caption = 'GL Update Code';
            NotBlank = true;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if not DimMgt.CheckDim("GL Update Code") then
                    Error(DimMgt.GetDimErr());
                if "GL Update Code" <> xRec."GL Update Code" then begin
                    "GL Update Value Code" := '';
                    "GL Update Value ID" := 0;
                end;
            end;
        }
        field(3; "GL Update Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            NotBlank = true;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("GL Update Code"), Blocked = const(false));

            trigger OnValidate()
            begin
                if not DimMgt.CheckDimValue("GL Update Code", "GL Update Value Code") then
                    Error(DimMgt.GetDimErr());

                DimVal.Get("GL Update Code", "GL Update Value Code");
                // "GL Update Value ID" := DimVal."Dimension Value ID";
            end;
        }
        field(4; "GL Update Value ID"; Integer)
        {
            Caption = 'GL Update Value ID';
        }
        field(5; "GL Update Name"; Text[100])
        {
            CalcFormula = Lookup(Job.Description where("No." = field("GL Update Code")));
            Caption = 'GL Update Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Dimension Value Name"; Text[50])
        {
            CalcFormula = Lookup("Job Task".Description where("Job No." = field("GL Update Code"),
                                                               "Job No." = field("GL Update Value Code")));
            Caption = 'GL Update Value Name';
            Editable = false;
            FieldClass = FlowField;
        }
        // field(8; "Global Dimension No."; Integer)
        // {
        //     Caption = 'Shortcut Dimension No.';
        // }
    }

    keys
    {
        key(Key1; "GL Update Set ID", "GL Update Code")
        {
            Clustered = true;
        }
        key(Key2; "GL Update Value ID")
        {
        }
        key(Key3; "GL Update Code", "GL Update Value Code", "GL Update Set ID")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if DimVal.Get("GL Update Code", "GL Update Value Code") then
            "GL Update Value ID" := DimVal."Line No"
        else
            "GL Update Value ID" := 0;

        // "Global Dimension No." := GetGlobalDimNo();
    end;

    trigger OnModify()
    begin
        if DimVal.Get("GL Update Code", "GL Update Value Code") then
            "GL Update Value ID" := DimVal."Line No"
        else
            "GL Update Value ID" := 0;

        // "Global Dimension No." := GetGlobalDimNo();
    end;

    var
        DimVal: Record "Job Task";
        DimMgt: Codeunit "GLEntries Management";

    procedure GetDimensionSetID(var DimSetEntry: Record "GL Update Set Entry"): Integer
    var
        DimSetEntry2: Record "GL Update Set Entry";
        DimSetTreeNode: Record "GL Update Set Tree Node";
        Found: Boolean;
    begin
        OnBeforeGetDimensionSetID(DimSetEntry);

        DimSetEntry2.Copy(DimSetEntry);
        if DimSetEntry."GL Update Set ID" > 0 then
            DimSetEntry.SetRange("GL Update Set ID", DimSetEntry."GL Update Set ID");

        DimSetEntry.SetCurrentKey("GL Update Value ID");
        DimSetEntry.SetFilter("GL Update Code", '<>%1', '');
        DimSetEntry.SetFilter("GL Update Value Code", '<>%1', '');

        if not DimSetEntry.FindSet() then begin
            DimSetEntry.Copy(DimSetEntry2);
            exit(0);
        end;

        Found := true;
        DimSetTreeNode."GL Update Set ID" := 0;
        repeat
            DimSetEntry.TestField("GL Update Value ID");
            if Found then
                if not DimSetTreeNode.Get(DimSetTreeNode."GL Update Set ID", DimSetEntry."GL Update Value ID") then begin
                    Found := false;
                    DimSetTreeNode.LockTable();
                end;
            OnGetDimensionSetIDOnBeforeInsertTreeNode(DimSetEntry, Found);
            if not Found then begin
                DimSetTreeNode."Parent GL Update Set ID" := DimSetTreeNode."GL Update Set ID";
                DimSetTreeNode."GL Update Value ID" := DimSetEntry."GL Update Value ID";
                DimSetTreeNode."GL Update Set ID" := 0;
                DimSetTreeNode."In Use" := false;
                if not DimSetTreeNode.Insert(true) then
                    DimSetTreeNode.Get(DimSetTreeNode."Parent GL Update Set ID", DimSetTreeNode."GL Update Value ID");
            end;
        until DimSetEntry.Next() = 0;
        if not DimSetTreeNode."In Use" then begin
            if Found then begin
                DimSetTreeNode.LockTable();
                DimSetTreeNode.Get(DimSetTreeNode."Parent GL Update Set ID", DimSetTreeNode."GL Update Value ID");
            end;
            DimSetTreeNode."In Use" := true;
            DimSetTreeNode.Modify();
            InsertDimSetEntries(DimSetEntry, DimSetTreeNode."GL Update Set ID");
        end;

        DimSetEntry.Copy(DimSetEntry2);

        exit(DimSetTreeNode."GL Update Set ID");
    end;

    local procedure InsertDimSetEntries(var DimSetEntry: Record "GL Update Set Entry"; NewID: Integer)
    var
        DimSetEntry2: Record "GL Update Set Entry";
    begin
        DimSetEntry2.LockTable();
        if DimSetEntry.FindSet() then
            repeat
                DimSetEntry2 := DimSetEntry;
                DimSetEntry2."GL Update Set ID" := NewID;
                // DimSetEntry2."Global GL Update No." := DimSetEntry2.GetGlobalDimNo();
                DimSetEntry2.Insert();
            until DimSetEntry.Next() = 0;
    end;

    procedure UpdateGlobalDimensionNo(DimensionCode: Code[20]; GlobalDimensionNo: Integer)
    var
        DimensionSetEntry: Record "Dimension Set Entry";
    begin
        DimensionSetEntry.SetRange("Dimension Code", DimensionCode);
        DimensionSetEntry.ModifyAll("Global Dimension No.", GlobalDimensionNo);
    end;

    procedure GetGlobalDimNo(): Integer
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        // GeneralLedgerSetup.Get();
        // if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 3 Code" then
        //     exit(3);
        // if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 4 Code" then
        //     exit(4);
        // if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 5 Code" then
        //     exit(5);
        // if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 6 Code" then
        //     exit(6);
        // if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 7 Code" then
        //     exit(7);
        // if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 8 Code" then
        //     exit(8);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetDimensionSetID(var DimensionSetEntry: Record "GL Update Set Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetDimensionSetIDOnBeforeInsertTreeNode(var DimensionSetEntry: Record "GL Update Set Entry"; var Found: Boolean)
    begin
    end;
}
