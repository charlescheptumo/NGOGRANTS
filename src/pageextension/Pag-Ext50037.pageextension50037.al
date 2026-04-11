#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50037 "pageextension50037" extends "Posted Purchase Invoice"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Posted Purchase Invoice"(Page 138)".

    layout
    {
        addafter("Buy-from Contact")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Attached Documents")
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Caption = 'Attachments';
            }
        }
    }
    actions
    {
        addafter("Update Document")
        {
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    DMSManagement.FnUploadPurchaseInvoiceDocuments(Rec."No.", 'Purchase Invoice', Rec.RecordId);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin

        DocType := DocType::Invoice;
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    var
        PVLines: Record "Purchase Line";
        DMSManagement: Codeunit "DMS Management";
        UserSetup: Record "User Setup";
        ArchiveManagement: Codeunit ArchiveManagement;
        DMSDocuments: Record "DMS Documents";
}

#pragma implicitwith restore

