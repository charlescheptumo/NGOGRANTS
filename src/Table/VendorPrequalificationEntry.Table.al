table 70111 "Vendor Prequalification Entry"
{
    DrillDownPageID = "Vendor Prequalification Entry";
    LookupPageID = "Vendor Prequalification Entry";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "IFP No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(3; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(4; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types1".Code;
        }
        field(5; "Procurement Category Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code WHERE(Blocked = CONST(false));

            trigger OnValidate()
            begin
                ProcurementCategory.Reset;
                ProcurementCategory.SetRange(Code, "Procurement Category Code");
                if ProcurementCategory.FindSet then begin
                    Description := ProcurementCategory.Description;
                    "Procurement Type" := ProcurementCategory."Procurement Type";
                    if Vendors.Get("Vendor No.") then begin
                        "Vendor Name" := Vendors.Name;
                    end;
                end;
            end;
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Date Blocked"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response,Supplier Registration';
            OptionMembers = "IFP Response","EOI Response","Supplier Registration";
        }
        field(12; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Financial Year"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code WHERE("Current Year" = CONST(true));

            trigger OnValidate()
            begin
                // AnnualReportingCodes.RESET;
                // AnnualReportingCodes.SETRANGE(Code,"Financial Year");
                // IF AnnualReportingCodes.FINDSET THEN BEGIN
                //  "Start Date":=
                //
                // END;
            end;
        }
        field(15; "Vendor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Vendor Phone No"; Text[300])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No.", "Procurement Category Code", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Vendor No.", "Vendor Name")
        {
        }
    }


    var
        ProcurementCategory: Record "Procurement Category";
        AnnualReportingCodes: Record "Annual Reporting Codes";
        Vendors: Record Vendor;
}

