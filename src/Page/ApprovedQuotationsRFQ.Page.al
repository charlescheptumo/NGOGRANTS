#pragma implicitwith disable
page 75324 "Approved Quotations(RFQ)"
{
    Caption = 'Request For Quotations (RFQ)';
    CardPageID = "Request For Quotation (RFQ)";
    // Editable = false;
    PageType = List;
    SourceTable = "Standard Purchase Code";
    SourceTableView = WHERE("Procurement Method" = filter(RFQ | RFP),
                            Status = CONST(Released));
    ApplicationArea = all;
    layout
    
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("External Document No"; Rec."External Document No")
                {
                    Caption = 'RFQs No';
                }
                field(Published; Rec.Published)
                {
                    ToolTip = 'Specifies the value of the Published field.';
                }

            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
            }
            systempart(Control8; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control10; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        // VendorPurchaseCode.RESET;
        // VendorPurchaseCode.SETRANGE(Code,Code);
        // VendorPurchaseCode.SETRANGE("Invitation Email Sent",TRUE);
        // IF VendorPurchaseCode.FINDFIRST THEN BEGIN
        //  "RFQ Sent":=TRUE;
        //  "RFQ Sent On":=VendorPurchaseCode."Date/Time Notified";
        //  MODIFY(TRUE);
        //  END;
    end;

    var
        VendorPurchaseCode: Record "Standard Vendor Purchase Code";
}

#pragma implicitwith restore

