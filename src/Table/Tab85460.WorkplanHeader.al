#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85460 "Workplan Header"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(3; "Workplan Year"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }

        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Shortcut Dimension 1 Code"; Code[20])
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
        field(8; "Shortcut Dimension 2 Code"; Code[20])
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
        field(9; "Dimension Set ID"; Integer)
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

        field(11; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Closed';
            OptionMembers = Open,"Pending Approval",Released,Closed;
        }
        field(26; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
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
        fieldgroup(DropDown; "Document No.", "Workplan Year")
        {
        }
    }

    trigger OnInsert()
    begin
        CashManagement.Get;
        CashManagement.TestField("Workplan No. Series");
        if "Document No." = '' then
            "Document No." := NoSeriesMgt.GetNextNo(CashManagement."Workplan No. Series", Today, true);
        // NoSeriesMgt.InitSeries(CashManagement."Workplan No. Series", CashManagement."Workplan No. Series", 0D, "Document No.", CashManagement."Workplan No. Series");

        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var

        NoSeriesMgt: Codeunit "No. Series";
        CashManagement: Record "Cash Management Setup";
        DimMgt: Codeunit DimensionManagement;

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
