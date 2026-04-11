page 50111 "Receipts Header Page"
{
    ApplicationArea = All;
    Caption = 'Receipts Header Page';
    PageType = List;
    SourceTable = "Receipts Header1";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                    ToolTip = 'Specifies the value of the Allocated Amount field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ToolTip = 'Specifies the value of the Application No. field.', Comment = '%';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.', Comment = '%';
                }
                field("Being Payment of"; Rec."Being Payment of")
                {
                    ToolTip = 'Specifies the value of the Being Payment of field.', Comment = '%';
                }
                field(Cashier; Rec.Cashier)
                {
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ToolTip = 'Specifies the value of the Currency Factor field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                    ToolTip = 'Specifies the value of the Date Reversed field.', Comment = '%';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.', Comment = '%';
                }
                field("Depot Name"; Rec."Depot Name")
                {
                    ToolTip = 'Specifies the value of the Depot Name field.', Comment = '%';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.', Comment = '%';
                }
                field("Direct Income Voucher"; Rec."Direct Income Voucher")
                {
                    ToolTip = 'Specifies the value of the Direct Income Voucher field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Expense Account"; Rec."Expense Account")
                {
                    ToolTip = 'Specifies the value of the Income Account field.';
                }
                field("Fully Allocated"; Rec."Fully Allocated")
                {
                    ToolTip = 'Specifies the value of the Fully Allocated field.', Comment = '%';
                }
                field("Fully Allocated Imprest"; Rec."Fully Allocated Imprest")
                {
                    ToolTip = 'Specifies the value of the Fully Allocated Imprest field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ToolTip = 'Specifies the value of the On Behalf Of field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ToolTip = 'Specifies the value of the Payment Reference field.', Comment = '%';
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ToolTip = 'Specifies the value of the Payment Reference No. field.', Comment = '%';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ToolTip = 'Specifies the value of the Posted Time field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Reason for Reversing"; Rec."Reason for Reversing")
                {
                    ToolTip = 'Specifies the value of the Reason for Reversing field.', Comment = '%';
                }
                field("Received From"; Rec."Received From")
                {
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ToolTip = 'Specifies the value of the Remaining Amount field.', Comment = '%';
                }
                field(Reversed; Rec.Reversed)
                {
                    ToolTip = 'Specifies the value of the Reversed field.', Comment = '%';
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    ToolTip = 'Specifies the value of the Reversed By field.', Comment = '%';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Tel No"; Rec."Tel No")
                {
                    ToolTip = 'Specifies the value of the Tel No field.', Comment = '%';
                }
                field("Time Reversed"; Rec."Time Reversed")
                {
                    ToolTip = 'Specifies the value of the Time Reversed field.', Comment = '%';
                }
            }
        }
    }
}
