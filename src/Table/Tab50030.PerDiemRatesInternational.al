table 50030 "Per Diem Rates International"
{
    Caption = 'Per Diem Rates International';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
            TableRelation = "Country/Region".Code;
            DataClassification = ToBeClassified;
        }
        field(2; "Area Code"; Code[100])
        {
            Caption = 'Area Code';
            DataClassification = ToBeClassified;
        }
        field(3; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = ToBeClassified;
        }
        field(4; "First 60 Days Amount"; Decimal)
        {
            Caption = 'First 60 Days Amount';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                GenLedSetup.Get;
                if "Currency Code" <> '' then
                    "First 60 Days Amount (LCY)" := ROUND(
                          CurrExchRate.ExchangeAmtFCYToLCY(
                            WorkDate(), "Currency Code",
                            "First 60 Days Amount", "Currency Factor"),
                          GenLedSetup."Inv. Rounding Precision (LCY)")
                else
                    "First 60 Days Amount (LCY)" := "First 60 Days Amount";
            end;
        }
        field(5; "More than 60 Days Amount"; Decimal)
        {
            Caption = '> 60 Days Local';

            trigger OnValidate()
            begin
                GenLedSetup.Get;
                if "Currency Code" <> '' then
                    "More than 60 Days Amount (LCY)" := ROUND(
                          CurrExchRate.ExchangeAmtFCYToLCY(
                            WorkDate(), "Currency Code",
                            "More than 60 Days Amount", "Currency Factor"),
                          GenLedSetup."Inv. Rounding Precision (LCY)")
                else
                    "More than 60 Days Amount (LCY)" := "More than 60 Days Amount";
            end;

        }
        field(6; "First 60 Days Amount (LCY)"; Decimal)
        {
            Caption = 'First 60 Days Amount (USD)';
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                if "Currency Code" = '' then
                    "First 60 Days Amount" := "First 60 Days Amount (LCY)"
                else begin
                    GenLedSetup.Get;
                    "First 60 Days Amount" := ROUND(CurrExchRate.ExchangeAmtLCYToFCY(WorkDate(), "Currency Code",
                        "First 60 Days Amount (LCY)", "Currency Factor"), GenLedSetup."Inv. Rounding Precision (LCY)");

                end;
            end;


        }
        field(7; "Room as Percent of DSA"; Decimal)
        {
            Caption = 'Room as Percent of DSA';
            DataClassification = ToBeClassified;
        }
        field(8; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
            trigger OnValidate()
            begin

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
        field(9; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(10; "More than 60 Days Amount (LCY)"; Decimal)
        {
            Caption = '> 60 Days (USD)';
            trigger OnValidate()

            begin
                if "Currency Code" = '' then
                    "More than 60 Days Amount" := "More than 60 Days Amount (LCY)"
                else begin
                    GenLedSetup.Get;
                    "More than 60 Days Amount" := ROUND(CurrExchRate.ExchangeAmtLCYToFCY(WorkDate(), "Currency Code",
                        "More than 60 Days Amount (LCY)", "Currency Factor"), GenLedSetup."Inv. Rounding Precision (LCY)");

                end;
            end;

        }
        field(11; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blocked';
        }

    }
    keys
    {
        key(PK; "Country Code", "Area Code", "Effective Date")
        {
            Clustered = true;
        }
    }
    var
        Confirmed: Boolean;
        Text022: label 'Do you want to update the exchange rate?';
        HideValidationDialog: Boolean;
        CurrencyDate: Date;
        CurrExchRate: Record "Currency Exchange Rate";
        GenLedSetup: Record "General Ledger Setup";

    procedure UpdateCurrencyFactor()
    var
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        ConfirmManagement: Codeunit "Confirm Management";
        Updated: Boolean;
    begin

        if "Currency Code" <> '' then begin

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

    procedure GetHideValidationDialog(): Boolean
    begin
        exit(HideValidationDialog);
    end;
}
