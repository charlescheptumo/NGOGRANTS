#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57067 "Receipt"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Receipts Header1";
    InsertAllowed = false;
    ApplicationArea = Basic;
    Editable = false;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        // Clear(ChangeExchangeRate);
                        // if Date <> 0D then
                        //     ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", Date)
                        // else
                        //     ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                        // if ChangeExchangeRate.RunModal = Action::OK then begin
                        //     Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                        CurrPage.Update;
                    end;
                    //Clear(ChangeExchangeRate);
                    //  end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(Control8; "Cash Recipt Lines")
            {
                Caption = 'Cash Receipt Lines';
                SubPageLink = "Receipt No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
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
        area(processing)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    /*
                    usersetup.GET(USERID);
                    IF usersetup."Post Receipts"=FALSE THEN
                    ERROR(Text0001);
                    usersetup.RESET;
                    IF usersetup."User ID"=Cashier THEN
                     ERROR('You cannot create and post the receipt, Alternative Cashier should post');
                     */
                    Rec.TestField("Received From");
                    Rec.TestField("On Behalf Of");
                    // Rec.TestField("Cheque No");
                    //  Rec.TestField("Cheque Date");


                    PaymentPost.PostReceipt(Rec);
                    CurrPage.Close;

                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
            action("Institution Receipt")
            {
                ApplicationArea = Basic;
                Caption = 'Institution Receipt';
                Ellipsis = true;
                Visible = false;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56005, true, true, Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;
                Visible = false;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    ApprovalDocType: Enum "Approval Document Type";
                begin
                    ApprovalDocType := ApprovalDocType::"Receipt Processing";
                    ApprovalEntries.SetRecordFilters(Database::Payments, ApprovalDocType, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
            // action("Import Student Details")
            // {
            //     ApplicationArea = Basic;
            //     Image = ImportExcel;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Visible = false;

            //     trigger OnAction()
            //     var
            //         InsitutionStudentImport: XmlPort "Insitution Student Import";
            //     begin
            //         Rec.SetRange("No.", Rec."No.");
            //         InsitutionStudentImport.GetVariables(Rec);
            //         InsitutionStudentImport.Run;
            //     end;
            // }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin

        DocType := DocType::"Receipt Processing";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    var
        PaymentPost: Codeunit "Payments-Post";
}
#pragma implicitwith restore
