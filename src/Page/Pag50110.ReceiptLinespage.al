
page 50110 "Receipt Lines page"
{
    ApplicationArea = All;
    Caption = 'Receipt Lines page';
    PageType = List;
    SourceTable = "Receipt Lines1";
    UsageCategory = Tasks;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("Applies to Doc. No"; Rec."Applies to Doc. No")
                {
                    ToolTip = 'Specifies the value of the Applies to Doc. No field.';
                }
                field("Applies to ID"; Rec."Applies to ID")
                {
                    ToolTip = 'Specifies the value of the Applies to ID field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    ToolTip = 'Specifies the value of the Gross Amount field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ToolTip = 'Specifies the value of the Net Amount field.', Comment = '%';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ToolTip = 'Specifies the value of the Receipt No. field.', Comment = '%';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ToolTip = 'Specifies the value of the Registration No(Students ONLY) field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
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
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ToolTip = 'Specifies the value of the Transaction Type field.', Comment = '%';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ToolTip = 'Specifies the value of the VAT Amount field.', Comment = '%';
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ToolTip = 'Specifies the value of the VAT Code field.', Comment = '%';
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ToolTip = 'Specifies the value of the W/Tax Amount field.', Comment = '%';
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ToolTip = 'Specifies the value of the W/Tax Code field.', Comment = '%';
                }
            }
        }
    }
}
