#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65029 "Project Contract Header"
{
    DrillDownPageID = "Projects List";
    LookupPageID = "Projects List";

    fields
    {
        field(1; "Project Contract No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Opportunity."No.";

            trigger OnValidate()
            begin
                "Grant Application ID" := "Project Contract No";
                /* if "Project Contract No" <> xRec."Project Contract No" then begin
                    GrantsSetup.Get;
                    NoSeriesMgt.TestManual(GrantsSetup."Project Contract Nos");
                    "No. Series" := '';
                end; */
            end;
        }
        field(2; "Grant Application ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Opportunity;

            // trigger OnValidate()
            // begin
            //     GFA.Reset;
            //     GFA.SetRange("No.", "Grant Application ID");
            //     if GFA.Find('-') then begin

            //         "Primary Contract Customer No":=GFA."Contact Company No.";
            //         "Name" := GFA."Contact Company Name";
            //         // "Currency Code" := GFA."Calcd. Current Value (LCY)";
            //         // Name := GFA."Grantor Name";
            //         // Address := GFA.;
            //         // "Address 2" := GFA.Address2;
            //         // "Post Code" := GFA."Post Code";
            //         // City := GFA.City;
            //         // "Phone No." := GFA."Phone No";
            //         "Contract Start Date":=GFA."Contract Start Date";
            //         "Contract End Date":=GFA."Contract End Date";
            //     end;
            // end;
            // trigger OnValidate()
            // begin
            //     GFA.Reset;
            //     GFA.SetRange("Grant No", "Grant Application ID");
            //     if GFA.Find('-') then begin

            //         "Name" := GFA."Grantor Name";
            //         // "Grant Class" := CRMO."Grant Class";
            //         // "Grant Type" := CRMO."Grant Type";
            //         // "Requested Grant Amount" := CRMO.BudgetAmount;
            //         "Currency Code" := GFA."Currency Code";
            //         // "Awarded Grant Amount" := CRMO.ActualValue;
            //         // "Created By" := CRMO.CreatedByName;
            //         // "Created On" := CRMO.CreatedOn;
            //         // "Date Closed" := CRMO.ActualCloseDate;
            //         // CRMO.CalcFields("Principal Investigator");
            //         // "Primary Contract Customer No" := CRMO."Grantor No.";
            //         Name := GFA."Grantor Name";
            //         Address := GFA.Address;
            //         "Address 2" := GFA.Address2;
            //         "Post Code" := GFA."Post Code";
            //         City := GFA.City;
            //         "Phone No." := GFA."Phone No";
            //         // Email:=CRMO.
            //         // "Responsibility Center" := CRMO."Research Center";
            //         // "Principal Investigator" := CRMO."Principal Investigator";
            //         // "Currency Code" := CRMO."Currency Code";
            //         //"Grant Administrator":=GFA

            //         //"Country/Region Code":=

            //     end;

            //     // trigger OnValidate()
            //     // begin
            //     //     GFA.Reset;
            //     //     GFA.SetRange("Application No", "Grant Application ID");
            //     //     if GFA.Find('-') then begin
            //     //         GFA.CalcFields("Principal Investigator");
            //     //         "Primary Contract Customer No" := GFA."Grantor No.";
            //     //         Name := GFA."Grantor Name";
            //     //         Address := GFA.Address;
            //     //         "Address 2" := GFA.Address2;
            //     //         "Post Code" := GFA."Post Code";
            //     //         City := GFA.City;
            //     //         "Phone No." := GFA."Phone No";
            //     //         //Email:=GFA.
            //     //         "Responsibility Center" := GFA."Research Center";
            //     //         "Principal Investigator" := GFA."Principal Investigator";
            //     //         "Currency Code" := GFA."Currency Code";
            //     //         //"Grant Administrator":=GFA

            //     //         //"Country/Region Code":=

            //     //     end;
            // end;
        }
        field(3; "External Contract No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Primary Contract Customer No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where("Funding Class" = const(Grant));

            trigger OnValidate()
            var
                Cust: Record Customer;
            begin
                Cust.Reset();
                Cust.SetRange("No.", "Primary Contract Customer No");
                if Cust.Find('-') then begin
                    "Contact No." := Cust.Contact;
                    Name := Cust.Name;
                    Address := Cust.Address;
                    "Address 2" := Cust."Address 2";
                    City := Cust.City;
                    "Country/Region Code" := Cust."Country/Region Code";
                    "Phone No." := Cust."Phone No.";
                    Email := Cust."E-Mail";
                end
            end;
        }
        field(6; "Contact No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Name; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Address; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Address 2"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Post Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; City; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Country/Region Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Contact; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Phone No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Email; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Responsibility Center"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Principal Investigator"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where("Researcher?" = const(true));
        }
        field(18; "Grant Administrator"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Award Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Core Funding,Sub-Award';
            OptionMembers = "Core Funding","Sub-Award";
        }
        field(20; "Primary Funding Sponsor ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Funding Class" = const(Grant));

            trigger OnValidate()
            begin
                if Cust.Get("Primary Funding Sponsor ID") then begin
                    "Primary Sponsor Name" := Cust.Name;
                end;
            end;
        }
        field(21; "Primary Sponsor Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Contract Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Contract End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Contract Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Signed,Cancelled';
            OptionMembers = Signed,Cancelled;
        }
        field(25; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(26; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29; "Currency Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(30; "Original Award Contract"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Renewed Award Contract No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; "Addendum Counter"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Project Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        /* if "Project Contract No" = '' then begin
            GrantsSetup.Get;
            GrantsSetup.TestField("Project Contract Nos");
            NoSeriesMgt.InitSeries(GrantsSetup."Project Contract Nos", xRec."No. Series", 0D, "Project Contract No", "No. Series");
        end; */

        "Created On" := Today;
        "Created By" := UserId;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        GrantsSetup: Record "Grants Setup";
        GFA: Record Opportunity;
        Cust: Record Customer;

}

