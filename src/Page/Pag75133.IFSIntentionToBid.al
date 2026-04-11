#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75133 "IFS Intention To Bid"
{
    Caption = 'Recurring Purchase Lines';
    DataCaptionFields = "Vendor No.";
    PageType = ListPart;
    SourceTable = "Standard Vendor Purchase Code";
    ApplicationArea = Basic;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                    Visible = false;
                }
                field("Vendor No."; Rec."Vendor 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the vendor to which the standard purchase code is assigned.';

                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a standard purchase code from the Standard Purchase Code table.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Primary Email"; Rec."Primary Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Email field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the standard purchase code.';
                }
                field("Insert Rec. Lines On Quotes"; Rec."Insert Rec. Lines On Quotes")
                {
                    ApplicationArea = Suite;
                    Visible = false;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase quotes.';
                }
                field("Insert Rec. Lines On Orders"; Rec."Insert Rec. Lines On Orders")
                {
                    ApplicationArea = Suite;
                    Visible = false;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase orders.';
                }
                field("Insert Rec. Lines On Invoices"; Rec."Insert Rec. Lines On Invoices")
                {
                    ApplicationArea = Suite;
                    Visible = false;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase invoices.';
                }
                field("Insert Rec. Lines On Cr. Memos"; Rec."Insert Rec. Lines On Cr. Memos")
                {
                    ApplicationArea = Suite;
                    Visible = false;
                    ToolTip = 'Specifies how you want to use standard purchase codes on purchase credit memos.';
                }
            }
        }

    }

    actions
    {
        area(Processing)
        {
            group("&Purchase")
            {
                Caption = '&Purchase';
                Image = Purchasing;
                action(Card)
                {
                    ApplicationArea = Suite;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Standard Purchase Code Card";
                    RunPageLink = Code = field(Code);
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Specifies a standard purchase code from the Standard Purchase Code table.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        StandardPurchaseCode: Record "Standard Purchase Code";
    begin
        StandardPurchaseCode.Reset();
        StandardPurchaseCode.Setrange(Code, Rec.code);
        if StandardPurchaseCode.FindFirst() then begin
            Rec."Procurement Category" := StandardPurchaseCode."Procurement Category ID";
        end
    end;

    procedure GetSelected(var StdVendPurchCode: Record "Standard Vendor Purchase Code")
    begin
        CurrPage.SetSelectionFilter(StdVendPurchCode);
    end;
}

#pragma implicitwith restore

