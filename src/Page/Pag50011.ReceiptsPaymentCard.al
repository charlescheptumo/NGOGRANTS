page 50011 "Receipts Payment Card"
{
    ApplicationArea = All;
    Caption = 'Receipts Payment Card';
    PageType = Card;
    SourceTable = "Receipts and Payment Types1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field.';
                }

                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {
                    ToolTip = 'Specifies the value of the VAT Chargeable field.';
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {
                    ToolTip = 'Specifies the value of the Withholding Tax Chargeable field.';
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ToolTip = 'Specifies the value of the Withholding Tax Code field.';
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                    ToolTip = 'Specifies the value of the Default Grouping field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Pending Voucher"; Rec."Pending Voucher")
                {
                    ToolTip = 'Specifies the value of the Pending Voucher field.';
                }
                field("Transation Remarks"; Rec."Transation Remarks")
                {
                    ToolTip = 'Specifies the value of the Transation Remarks field.';
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ToolTip = 'Specifies the value of the Payment Reference field.';
                }
                field("Customer Payment On Account"; Rec."Customer Payment On Account")
                {
                    ToolTip = 'Specifies the value of the Customer Payment On Account field.';
                }
                field("Direct Expense"; Rec."Direct Expense")
                {
                    ToolTip = 'Specifies the value of the Direct Expense field.';
                }
                field("Calculate Retention"; Rec."Calculate Retention")
                {
                    ToolTip = 'Specifies the value of the Calculate Retention field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ToolTip = 'Specifies the value of the Retention Code field.';
                }
                field("Subsistence?"; Rec."Subsistence?")
                {
                    ToolTip = 'Specifies the value of the Subsistence? field.';
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';
                }
                field("Appear on Imprest?"; Rec."Appear on Imprest?")
                {
                    ToolTip = 'Specifies the value of the Appear on Imprest? field.';
                }

            }
        }
    }
}
