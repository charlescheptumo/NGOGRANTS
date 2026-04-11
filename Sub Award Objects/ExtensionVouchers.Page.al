page 65197 "Extension Vouchers"
{
    ApplicationArea = All;
    Caption = 'Addendum';
    PageType = List;
    SourceTable = "Sub Contract Extension Voucher";
    // SourceTableView = sorting("No.") order(descending) where("Extension Focus" = const("Sub Award Extension"), Status = filter(Open | "Pending Approval"));
    SourceTableView = sorting("No.") order(descending) where(Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    CardPageId = "Sub Contract Extension Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Amendment No"; Rec."Amendment No")
                {
                    ToolTip = 'Specifies the value of the Amendment No field.';
                }
                field("Sub Award No"; Rec."Sub Award No")
                {
                    ToolTip = 'Specifies the value of the Sub Award No field.';
                }
                field("Sub Award  Name"; Rec."Sub Award  Name")
                {
                    ToolTip = 'Specifies the value of the Sub Award  Name field.';
                }
                field("Sub Award Start Date"; Rec."Sub Award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award Start Date field.';
                }
                field("Sub Award End Date"; Rec."Sub Award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award End Date field.';
                }
                field("Award No"; Rec."Award No")
                {
                    ToolTip = 'Specifies the value of the Award No field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }
                field("Extended By"; Rec."Extended By")
                {
                    ToolTip = 'Specifies the value of the Extended By field.';
                }
                field("Extented On"; Rec."Extented On")
                {
                    ToolTip = 'Specifies the value of the Extented On field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ToolTip = 'Specifies the value of the Additional Budget field.';
                }
                field("Extend to Date"; Rec."Extend to Date")
                {
                    ToolTip = 'Specifies the value of the Extend to Date field.';
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin

    end;
}
