#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50021 "pageextension50021" extends "Purchase Invoice"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Purchase Invoice"(Page 51)".

    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Posting Description"(Control 90)".

        modify(Status)
        {
            Editable = false;
        }
        addafter("Buy-from Vendor Name")
        {
            field("Directorate Code1"; Rec."Directorate Code1")
            {
                ApplicationArea = Basic;
                Caption = 'Department';
            }
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
                Caption = 'Sub-Department';
            }
        }
        // modify("Attached Documents")
        // {
        //     Visible = false;
        // }
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


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 142).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Added for control Business
        PVLines.RESET;
        PVLines.SETRANGE("Document No.","No.");
        IF PVLines.FIND('-') THEN BEGIN
           REPEAT
             PVLines.TESTFIELD("Gen. Prod. Posting Group");
             UNTIL PVLines.NEXT=0;
          END;
        //End Added for control Business
        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;


        //Unsupported feature: Code Modification on "Post(Action 68).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VerifyTotal;
        Post(CODEUNIT::"Purch.-Post (Yes/No)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Added for control Business
        // PVLines.RESET;
        // PVLines.SETRANGE("Document No.","No.");
        // IF PVLines.FIND('-') THEN BEGIN
        //   REPEAT
        //     PVLines.TESTFIELD("Job No.");
        //     PVLines.TESTFIELD("Job Task No.");
        //     UNTIL PVLines.NEXT=0;s
        //  END;
        // //End Added for control Business
        VerifyTotal;

        UserSetup.GET(USERID);
        IF UserSetup."Post Purchase Documents"=TRUE THEN BEGIN
        Post(CODEUNIT::"Purch.-Post (Yes/No)");
        END ELSE
        ERROR('You do not have permission to post this document, kindly contact system administrator');
        */
        //end;



        modify(SendApprovalRequest)
        {
            trigger OnBeforeAction()
            var
                PurchLine: Record "Purchase Line";
            begin
                // Loop through all invoice lines for the current header
                PurchLine.SetRange("Document Type", Rec."Document Type");
                PurchLine.SetRange("Document No.", Rec."No.");

                if PurchLine.FindSet() then
                    repeat
                        if (PurchLine."Job No." = '') or (PurchLine."Job Task No." = '') then
                            Error(
                                'Purchase Invoice %1 cannot be sent for approval because line %2 is missing Project No. or Project Task No.',
                                Rec."No.", PurchLine."Line No.");
                    until PurchLine.Next() = 0;
            end;
        }

        addafter(RemoveFromJobQueue)
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
            action("Archive Document")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Archi&ve Document';
                Image = Archive;
                ToolTip = 'Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.';

                trigger OnAction()
                begin
                    ArchiveManagement.ArchivePurchDocument(Rec);
                    CurrPage.Update(false);
                end;
            }
        }
        modify(Release)
        {
            Visible = true;
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

