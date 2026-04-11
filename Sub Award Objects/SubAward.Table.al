table 65059 "Sub Award"
{
    Caption = 'Sub Award';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[30])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;

        }
        field(2; "PFC No"; Code[30])
        {
            Caption = 'PFC No';
            DataClassification = ToBeClassified;
            TableRelation = "Project Contract Header"."Project Contract No";

            trigger OnValidate()
            begin
                PFC.Reset();
                PFC.SetRange("Project Contract No", Rec."PFC No");
                IF PFC.findset() then begin
                    GFA := PFC."Grant Application ID";
                    Validate(GFA);
                end;


            end;


        }
        field(3; Purpose; Text[250])
        {
            Caption = 'Purpose';
            DataClassification = ToBeClassified;
        }

        field(4; Goal; Text[250])
        {
            Caption = 'Goal';
            DataClassification = ToBeClassified;
        }
        field(5; "Physical Address"; Text[200])
        {
            Caption = 'Physical Address';
            DataClassification = ToBeClassified;
        }
        field(6; "Sub Awardee No"; Code[20])
        {
            Caption = 'Implementing Partner Code';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin

                Vend.Reset;
                Vend.SetRange("No.", "Sub Awardee No");
                IF Vend.FindSet() then begin
                    "Sub Awardee Name" := Vend.Name;
                    "Physical Address" := Vend.Address + Vend."Post Code" + ' ' + Vend.City + ' ' + Vend."Country/Region Code";
                end;
            end;
        }
        field(7; "Sub Awardee Name"; Text[100])
        {
            Caption = 'Implementing Partner Name';
            DataClassification = ToBeClassified;
        }
        field(8; "Sub-award Start Date"; Date)
        {
            Caption = 'Sub-award Start Date';
            DataClassification = ToBeClassified;
        }
        field(9; "Sub-award End Date"; Date)
        {
            Caption = 'Sub-award End Date';
            DataClassification = ToBeClassified;
        }
        field(10; "Main Award"; Code[100])
        {
            Caption = 'Main Award';
            DataClassification = ToBeClassified;
        }
        field(11; "Main Award Start Date"; Date)
        {
            Caption = 'Main Award Start Date';
            DataClassification = ToBeClassified;
        }
        field(12; "Main Award End Date"; Date)
        {
            Caption = 'Main Award End Date';
            DataClassification = ToBeClassified;
        }
        field(13; "Main Award Objective"; Text[255])
        {
            Caption = 'Main Award Objective';
            DataClassification = ToBeClassified;
        }
        field(14; "Main Award Program"; Code[50])
        {
            Caption = 'Main Award Program';
            DataClassification = ToBeClassified;
        }
        field(15; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if not (CurrFieldNo in [0, FieldNo("Created On")]) or ("Currency Code" <> xRec."Currency Code") then
                    TestStatusOpen;
                if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
                    UpdateCurrencyFactor
                else
                    if "Currency Code" <> xRec."Currency Code" then
                        UpdateCurrencyFactor
                    else
                        if "Currency Code" <> '' then begin
                            UpdateCurrencyFactor;
                            if "Currency Factor" <> xRec."Currency Factor" then
                                ConfirmUpdateCurrencyFactor;
                        end;
            end;
        }
        field(16; "Approved Amount"; Decimal)
        {
            Caption = 'Approved Amount';
            DataClassification = ToBeClassified;
        }
        field(17; "Approved Amount(LCY)"; Decimal)
        {

            Caption = 'Approved Amount(USD)';
            DataClassification = ToBeClassified;
        }
        field(18; "Created by"; Code[30])
        {
            Caption = 'Created by';
            DataClassification = ToBeClassified;
        }
        field(19; "Created On"; Date)
        {
            Caption = 'Created On';
            DataClassification = ToBeClassified;

        }
        field(20; "Approved By"; Code[30])
        {
            Caption = 'Approved By';
            DataClassification = ToBeClassified;
        }
        field(21; "Approved On"; Date)
        {
            Caption = 'Approved On';
            DataClassification = ToBeClassified;
        }
        field(22; "Document Status"; Option)
        {
            OptionMembers = Open,Ongoing,Closed,Closeout,Extension;
            OptionCaption = 'Open,Ongoing,Closed,Closeout,Extension';
            Caption = 'Project Status';
            DataClassification = ToBeClassified;
        }
        field(23; Status; Option)
        {
            OptionMembers = Open,"Pending approval",Released;
            OptionCaption = 'Open,Pending Approval,Released';
            DataClassification = ToBeClassified;
        }
        field(24; Street; Text[255])
        {
            Caption = 'Street';
            DataClassification = ToBeClassified;
        }
        field(30; "No series"; code[30])
        {
            Caption = 'No series';
            DataClassification = ToBeClassified;
        }
        field(31; GFA; code[30])
        {
            Caption = 'GFA';
            DataClassification = ToBeClassified;
            TableRelation = Opportunity;
            trigger OnValidate()
            begin
                GFAPP.Reset();
                GFAPP.SetRange("No.", Rec.GFA);
                IF GFAPP.FindSet() then begin

                end;

            end;
        }
        field(32; "Project Title"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(33; Location; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Under Contracting Status"; Option)
        {
            OptionMembers = "ARF Approval","Awaiting Supporting Documents","Contract Drafting","Legal Review","Signing by Implementing Partner","Signing by APHF","Completion";
            OptionCaption = 'ARF Approval,Awaiting Supporting Documents,Contract Drafting,Legal Review,Signing by Implementing Partner,Signing by APHF,Completion';
            Caption = 'Under Contracting Status';
            DataClassification = ToBeClassified;
        }
        field(57001; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdatePurchLinesByFieldNo(FieldNo("Currency Factor"), CurrFieldNo <> 0);
            end;
        }
        field(57002; "Budget Ceiling"; Decimal)
        {

        }
        field(57003; "Actual Spent"; Decimal)
        {
            //CalcFormula = Sum(Payments."Total Amount LCY" where("Payment Type" = const("Standing Imprest Surrender"), Posted = const(true)));
            //FieldClass = FlowField;
            trigger onValidate()
            begin
                // Balance := Rec."Approved Amount(LCY)" - Rec."Actual Spent" - Rec."DeObligated Funds";
                Balance := Rec."Approved Amount" - Rec."Actual Spent" - Rec."DeObligated Funds";
            end;
        }
        field(57004; "DeObligated Funds"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger onValidate()
            begin
                Validate(Rec."Actual Spent");
            end;
        }
        field(57005; "Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57006; "Original Sub Award Contract"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(57007; "Renewed Sub Award Contract No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(57008; "Addendum Counter"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; No, "Document Status")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "No", "Sub Awardee Name", "Document Status")
        {

        }
    }
    trigger OnInsert()
    var
        PV: record Payments;
        PVL: Record "PV Lines";
    begin
        GrantsSetup.Get();
        GrantsSetup.TestField("Sub Award No");
        if No = '' then begin
            No := NoSeriesMgt.GetNextNo(GrantsSetup."Sub Award No", Today, true);   
            //NoSeriesMgt.InitSeries(GrantsSetup."Sub Award No", xRec."No series", 0D, No, "No series");
        end;
        "Created On" := Today;
        "Created by" := UserId;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnRename()
    begin

    end;

    var

        NoSeriesMgt: Codeunit "No. Series";
        Vend: Record Vendor;
        UserSetup: Record "User Setup";
        GrantsSetup: Record "Grants Setup";
        PFC: Record "Project Contract Header";
        GFAPP: Record Opportunity;
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
        Confirmed: Boolean;
        Text022: label 'Do you want to update the exchange rate?';
        StatusCheckSuspended: Boolean;
        HideValidationDialog: Boolean;


    procedure UpdatePurchLinesByFieldNo(ChangedFieldNo: Integer; AskQuestion: Boolean)
    var
        "Field": Record "Field";
        PurchLineReserve: Codeunit "Purch. Line-Reserve";
        Question: Text[250];
    begin
    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;

        if StatusCheckSuspended then
            exit;

        TestField(Status, Status::Open);

        OnAfterTestStatusOpen;
    end;

    procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        ConfirmManagement: Codeunit "Confirm Management";
        Updated: Boolean;
    begin
        OnBeforeUpdateCurrencyFactor(Rec, Updated);
        if Updated then
            exit;

        if "Currency Code" <> '' then begin
            if "Created On" <> 0D then
                CurrencyDate := "Created On"
            else
                CurrencyDate := WorkDate;

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");

            end else begin
                // if ConfirmManagement.ConfirmProcess(
                //      StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate), true)
                // then begin
                //     UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
                //     UpdateCurrencyFactor;
                // end else
                //     RevertCurrencyCodeAndPostingDate;
            end;
        end else
            "Currency Factor" := 0;

        OnAfterUpdateCurrencyFactor(Rec, GetHideValidationDialog);
    end;

    local procedure ConfirmUpdateCurrencyFactor(): Boolean
    begin
        if GetHideValidationDialog or not GuiAllowed then
            Confirmed := true
        else
            Confirmed := Confirm(Text022, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
        exit(Confirmed);
    end;

    procedure CalcPayment()
    var
        PV: record Payments;
        PVL: Record "PV Lines";
    begin
        "Actual Spent" := 0;
        pv.Reset();
        pv.SetRange("Sub award No", No);
        pv.SetAutoCalcFields("Total Amount LCY");
        if pv.FindSet() then
            repeat
                // if pv."Total Amount LCY" > 0 then begin
                //     "Amounts Disbursed" += pv."Total Amount LCY";
                // end else begin
                //     "Amounts Accounted" += pv."Total Amount LCY";
                // end;
                if pv."Total Amount LCY" < 0 then begin
                    "Actual Spent" += pv."Total Amount LCY";
                    // end else begin
                    // "Amounts Accounted" += pv."Total Amount LCY";
                end;
            until pv.Next() = 0;
        if Rec."Actual Spent" <> xRec."Actual Spent" then begin
            Modify();
            Validate("Actual Spent");
        end;


    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateCurrencyFactor(var SubAward: Record "Sub Award"; var Updated: Boolean)
    begin
    end;

    local procedure RevertCurrencyCodeAndPostingDate()
    begin
        "Currency Code" := xRec."Currency Code";
        "created on" := xRec."created on";
        Modify;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateCurrencyFactor(var SubAward: Record "Sub Award"; HideValidationDialog: Boolean)
    begin
    end;

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;



}
