#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50007 "pageextension50007" extends "Customer Card"
{
    Caption = 'Donor Card';
    PromotedActionCategories = '';

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Customer Card"(Page 21)".

    layout
    {

        //Unsupported feature: Code Modification on ""No."(Control 2).OnAssistEdit".

        //trigger "(Control 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF AssistEdit(xRec) THEN
          CurrPage.UPDATE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         IF AssistEdit(xRec) THEN
          CurrPage.UPDATE;
        */
        //end;
        addafter(Name)
        {
            field("Donor Type"; Rec."Customer Type")
            {
                ApplicationArea = Basic;
                Caption = 'Donor Type';
                Visible = false;
            }
        }
        addafter("Privacy Blocked")
        {
            field("Funding Class"; Rec."Funding Class")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Preferred Bank Account Code")
        {
            field("Donor's Bank"; Rec."Employee's Bank")
            {
                ApplicationArea = Basic;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch"; Rec."Bank Branch")
            {
                ApplicationArea = Basic;
            }
            field("Bank Branch Name"; Rec."Bank Branch Name")
            {
                ApplicationArea = Basic;
            }
            field("Bank Account Number"; Rec."Bank Account Number")
            {
                ApplicationArea = Basic;
            }
        }
        modify("Document Sending Profile")
        {
            Visible = false;
        }
        modify("Salesperson Code")
        {
            Visible = false;
        }
        modify(TotalSales2)
        {
            Visible = false;
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Visible = false;
        }
        modify(AdjCustProfit)
        {
            Visible = false;
        }
        modify(AdjProfitPct)
        {
            Visible = false;
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to-Donor No.';
        }
        modify("Customer Posting Group")
        {
            Caption = 'Donor Posting Group';
        }
        modify("Customer Price Group")
        {
            Caption = 'Donor Price Group';
            Visible = false;
        }
        modify("Customer Disc. Group")
        {
            Caption = 'Donor Disc. Group';
            Visible = false;
        }
        modify("Prices Including VAT")
        {
            Caption = 'Amount Including VAT';
        }
        modify("Sales This Year")
        {
            Visible = false;
        }

        modify(Details)
        {
            Visible = false;
        }
        modify(AgedAccReceivableChart2)
        {
            Visible = false;
        }
        modify(Control39)
        {
            Visible = false;
        }
        modify(SalesHistSelltoFactBox)
        {
            Visible = false;
        }
        modify(SalesHistBilltoFactBox)
        {
            Visible = false;
        }
        modify(CustomerStatisticsFactBox)
        {
            Visible = false;
        }
        modify(Control1905532107)
        {
            Visible = false;
        }
        modify(Control1902613707)
        {
            Visible = false;
        }
        modify(WorkflowStatus)
        {
            Visible = false;
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Visible) on "NewSalesCreditMemo(Action 1902583505)".

        //     modify(NewSalesInvoiceAddin)
        //     {
        //         Visible = false;
        //     }
        //     modify(Flow)
        //     {
        //         Visible = false;
        //     }
        //     addafter(NewSalesQuoteAddin)
        //     {
        //         action(NewSalesInvoiceAddin)
        //         {
        //             AccessByPermission = TableData "Sales Header"=RIM;
        //             ApplicationArea = Basic,Suite;
        //             Caption = 'Sales Invoice';
        //             Image = NewSalesInvoice;
        //             Promoted = true;
        //             PromotedCategory = Process;
        //             PromotedOnly = true;
        //             ToolTip = 'Create a sales invoice for the customer.';
        //             Visible = IsOfficeAddin;

        //             trigger OnAction()
        //             begin
        //                 CreateAndShowNewInvoice;
        //             end;
        //         }
        //     }
        //     addafter(CancelApprovalRequest)
        //     {
        //         group(Flow)
        //         {
        //             Caption = 'Flow';
        //         }
        //     }
        // }

        //Unsupported feature: Property Deletion (RefreshOnActivate).
        modify("S&ales")
        {
            Visible = false;
        }
        modify("&Customer")
        {
            Caption = 'Donor';
        }
        modify("Prices and Discounts")
        {
            Visible = false;
        }
        modify(Documents)
        {
            Visible = false;
        }
        modify(History)
        {
            Caption = 'Donor';
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        Rec.TestField(Address);
        // Rec.TestField("Address 2");
    end;


}
#pragma implicitwith restore
