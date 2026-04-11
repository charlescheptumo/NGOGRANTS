#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57056 "Posted Imprest Requisition"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    Caption = 'Posted Advance Request';
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Approved));
    ApplicationArea = Basic;

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
                    Editable = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Code Name';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Advance Amount';
                    Caption = 'DSA/Accomodation & Meals Amount';
                    ToolTip = 'Specifies the value of the DSA/Accomodation & Meals Amount field.';
                }
                field("Imprest Conf Amount"; Rec."Imprest Conf Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Conference Registration Amount';
                    ToolTip = 'Specifies the value of the Conference Registration Amount field.';
                }
                field("Imprest AirFares Amount"; Rec."Imprest AirFares Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'AirFares Amount';
                    ToolTip = 'Specifies the value of the AirFares Amount field.';
                }
                field("Imprest Comms Amount"; Rec."Imprest Comms Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Communication and Others Amount';
                    ToolTip = 'Specifies the value of the Communication and Others Amount field.';
                }
                field("Imprest Total Amount"; Rec."Imprest Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount';
                    ToolTip = 'Specifies the value of the Total Advance Amount field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Deadline';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Task No';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                }
            }
            part(Control1000000017; "Imprest Lines")
            {
                Editable = false;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'DSA/Accomodation & Meals';
            }
            part(Control1000000018; "Imprest Lines Conf")
            {
                Editable = false;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'Conference Registration';
            }
            part(Control1000000019; "Imprest Lines AirFares")
            {
                Editable = false;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'AirFares';
            }
            part(Control1000000020; "Imprest Lines Comms")
            {
                Editable = false;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'Communication and Others';
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
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocType: Enum "Approval Document Type";
                    begin

                        DocType := DocType::Advance;
                        ApprovalEntries.SetRecordFilters(Database::Payments, DocType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                separator(Action1000000033)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
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
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57004, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Visible = false;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Visible = false;

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000020)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        //PaymentsPost.PostPettyCash(Rec);
                        //Committment.ImprestCommittment(Rec);
                        PaymentPost."Post Imprest"(Rec);
                    end;
                }
            }
            action("&Navigate")
            {
                ApplicationArea = Basic;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;

                trigger OnAction()
                var
                    Navigate: Page Navigate;
                    UserSetup: Record "User Setup";
                    GL: Record "G/L Entry";
                begin
                    Navigate.SetDoc(Rec.Date, Rec."No.");
                    Navigate.Run;
                end;
            }
            action("General Ledger Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerBook;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "General Ledger Entries";
                RunPageLink = "Document No." = field("No."),
                              "Posting Date" = field("Cheque Date");
            }
            action(ReverseTransaction)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reverse Transaction';
                Ellipsis = true;
                Image = ReverseRegister;
                Scope = Repeater;
                ToolTip = 'Reverse a posted general ledger entry.';

                trigger OnAction()
                var
                    ReversalEntry: Record "Reversal Entry";
                    GL: Record "G/L Entry";
                begin
                    //check if receipt is allocated


                    Clear(ReversalEntry);
                    Rec.CalcFields(Reversed);
                    GL.Reset;
                    GL.SetRange("Document No.", Rec."No.");
                    if GL.FindSet then begin
                        if Rec.Reversed then
                            ReversalEntry.AlreadyReversedEntry(Rec.TableCaption, GL."Entry No.");
                        /*IF GL."Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;*/
                        GL.TestField("Transaction No.");
                        ReversalEntry.ReverseTransaction(GL."Transaction No.")
                    end;

                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        // SetControlAppearance;

        DocType := DocType::Advance;
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");


        Rec.CalcFields("Imprest Amount");
        Rec.CalcFields("Imprest AirFares Amount");
        Rec.CalcFields("Imprest Conf Amount");
        Rec.CalcFields("Imprest Comms Amount");
        Rec."Imprest Total Amount" := Rec."Imprest Amount" + Rec."Imprest AirFares Amount" + Rec."Imprest Comms Amount" + Rec."Imprest Conf Amount";

    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    var
        PaymentPost: Codeunit "Payments-Post";

        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Text0001: label 'Are you sure you want to generate a surender for imprest No. %1?';
        imprestLines: Record "Imprest Lines";
        imprestHeader: Record Payments;
        surrenderLines: Record "Imprest Lines";
        SurrenderHeader: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        NoSeriesMgt: Codeunit "No. Series";
}

#pragma implicitwith restore

