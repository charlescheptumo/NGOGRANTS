table 99211 "Award Extension"
{
    Caption = 'Award Extension';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(4; "Award No"; Code[50])
        {
            Caption = 'Award No';
            TableRelation = "Project Contract Header";
            DataClassification = ToBeClassified;


            trigger OnValidate()
            var
                MainAward: Record "Project Contract Header";
            begin
                MainAward.Reset();
                MainAward.SetRange("Project Contract No", MainAward."Project Contract No");
                IF MainAward.FindSet() then begin
                    "Donor Name" := MainAward.Name;
                    "Award Description" := MainAward.Description;
                    "Award Start Date" := MainAward."Contract Start Date";
                    "Award End Date" := MainAward."Contract End Date";
                end;
            end;
        }
        field(5; "Donor Name"; Text[100])
        {
            Caption = 'Donor Name';

        }
        field(7; "Award Start Date"; Date)
        {
            Caption = 'Award Start Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Award End Date"; Date)
        {
            Caption = 'Award End Date';
            DataClassification = ToBeClassified;
        }
        field(9; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = "Open","Pending approval",Approved;
            OptionCaption = 'Open,Pending Approval,Approved';

        }
        field(10; "Extension Type"; Option)
        {
            Caption = 'Extension Type';
            DataClassification = ToBeClassified;
            OptionMembers = "","Without Additional Budget","With Additional Budget";
            OptionCaption = ' ,No Cost Extension,With Cost Extension';
            trigger OnValidate()
            begin
                if "Extension Type" = "Extension Type"::"Without Additional Budget" then
                    Rec."Additional Budget" := 0;
            end;
        }
        field(11; "Extend to Date"; Date)
        {
            Caption = 'Extend to Date';
            DataClassification = ToBeClassified;
        }
        field(12; "Extended By"; Code[100])
        {
            Caption = 'Extended By';
            DataClassification = ToBeClassified;
        }
        field(13; "Extented On"; Date)
        {
            Caption = 'Extented On';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Extend to Date" := CalcDate('+' + format("Extented On"), "Award End Date");
            end;
        }
        field(14; Extended; Boolean)
        {
            Caption = 'Extended';
            DataClassification = ToBeClassified;
        }
        field(15; "Additional Budget"; Decimal)
        {
            Caption = 'Additional Budget';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                IF ("Extension Type" = "Extension Type"::"Without Additional Budget") and (Rec."Additional Budget" > 0) then begin
                    Error('Additional Amount is only available for with Cost Extension Option only');
                end;
            end;
        }
        field(16; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(17; "No series"; code[30])
        {
            Caption = 'No series';
            DataClassification = ToBeClassified;
        }
        // Ammendment Voucher for Sub Awards Only, Main Award Ammendment will have its own page.
        // field(18; "Extension Focus"; Option)
        // {
        //     OptionMembers = "Main Award Extension","Sub Award Extension";
        //     OptionCaption = 'Main Award Extension,Sub Award Extension';

        // }
        field(19; Purpose; Text[250])
        {
            Caption = 'Purpose';
            DataClassification = ToBeClassified;
        }
        field(20; "Amendment No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Award Description"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.", "Award Start Date")
        {
            Clustered = true;
        }
    }


    trigger Oninsert()
    var

    begin
        GrantsSetup.Get();
        GrantsSetup.TestField("Sub Award No");
        if "No." = '' then begin
            "No." := NoSeriesMgt.GetNextNo(GrantsSetup."Sub Award No", Today, true);
            // NoSeriesMgt.InitSeries(GrantsSetup."Funding Opportunity Nos", xRec."No series", 0D, "No.", "No series");
        end;
        "Creation Date" := Today;

    end;

    trigger OnRename()
    var

    begin

    end;

    trigger Ondelete()
    var

    begin

    end;

    var
        ProjectContractHeader: record "Project Contract Header";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        GrantsSetup: Record "Grants Setup";
        ExtVoucher: Record "Sub Contract Extension Voucher";
}
