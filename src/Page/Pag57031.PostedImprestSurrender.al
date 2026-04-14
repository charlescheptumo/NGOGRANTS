#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57031 "Posted Imprest Surrender"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = Payments;
    Caption = 'Posted Advance Surrender';
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Approved),
                            Posted = const(true));
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

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
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Deadline';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Advance Issue Doc. No';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
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
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
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
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project Task No.';
                    Visible = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Project Task Name';
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

                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Department Name field.';
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
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
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Location Name';
                    Visible = false;
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
                field("Imprest Surr Amount"; Rec."Imprest Surr Amount")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Advance Amount';
                    Caption = 'DSA/Accomodation & Meals Surr Amount';
                    ToolTip = 'Specifies the value of the DSA/Accomodation & Meals Amount field.';
                }
                field("Imprest Surr Conf Amount"; Rec."Imprest Surr Conf Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Conference Registration Surr Amount';
                    ToolTip = 'Specifies the value of the Conference Registration Amount field.';
                }
                field("Imprest Surr AirFares Amount"; Rec."Imprest Surr AirFares Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'AirFares Surr Amount';
                    ToolTip = 'Specifies the value of the AirFares Amount field.';
                }
                field("Imprest Surr Comms Amount"; Rec."Imprest Surr Comms Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Communication and Others Surr Amount';
                    ToolTip = 'Specifies the value of the Communication and Others Amount field.';
                }
                field("Imprest Surr Total Amount"; Rec."Imprest Surr Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Surr Amount';
                    ToolTip = 'Specifies the value of the Total Advance Amount field.';
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining DSA Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining AirFares Amount"; Rec."Remaining AirFares Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining Conference Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Conf Amount"; Rec."Remaining Conf Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining Conference Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Comms Amount"; Rec."Remaining Comms Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining Conference Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Total Amount"; Rec."Remaining Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Total Remaining Amount';
                    ToolTip = 'Specifies the value of the Total Remaining Amount field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
            part(Control1000000017; "Imprest Surrender Lines")
            {
                Editable = false;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'DSA/Accomodation & Meals';
            }
            part(Control1000000018; "Imprest Surrender Lines Conf")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'Conference Registration';
            }
            part(Control1000000019; "Imprest Surrender Lines AirFa")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'AirFares';
            }
            part(Control1000000020; "Imprest Surrender Lines Coms")
            {
                Editable = not OpenApprovalEntriesExist;
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
                    PromotedCategory = Process;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocType: Enum "Approval Document Type";
                    begin

                        DocType := DocType::"Advance Surrender";
                        ApprovalEntries.SetRecordFilters(Database::Payments, DocType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                // Reopen Surrenderz
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    var
                        Committment: Codeunit "Procurement Processing";
                        G_LEntries: Record "G/L Entry";
                        PaymentsRec: Record Payments;
                    begin
                        // usersetup.Get(UserId);
                        // if usersetup."post surrender" = false then
                        //     Error('You do not have sufficient rights to Post An Advance Surrender! Please! contact System Administrator for Assistance.');
                        // PaymentPost."Post ImprestSurrender"(Rec);
                        // Committment.ImprestUnCommittment(Rec);
                        G_LEntries.Reset();
                        G_LEntries.SetRange("Document No.", Rec."No.");
                        G_LEntries.SetRange(Reversed, false);
                        if not G_LEntries.FindSet Then begin
                            PaymentsRec.Reset();
                            PaymentsRec.SetRange("No.", Rec."No.");
                            if PaymentsRec.FindSet then begin
                                PaymentsRec.Posted := false;
                                PaymentsRec.Modify();
                                Message('Record reopened succesfully');
                            end;
                        end else
                            Error('You must reverse this entry before reopening');
                    end;
                }
            }
        }
        area(processing)
        {
            action("Attach from Imprest Memo")
            {
                ApplicationArea = Basic;
                Enabled = ShowAttach;
                Image = Import;
                Visible = false;
                Promoted = true;
                Caption = 'Attach from Advance Request';
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.AttachLines(Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = false;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = false;
                    Image = Cancel;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000037)
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
                        Report.Run(57005, true, true, Rec)
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
                    Enabled = false;
                    Visible = false;
                    Image = ReleaseDoc;
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
                    Enabled = false;
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
                separator(Action1000000031)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                // action(Post)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'P&ost';
                //     Enabled = false;
                //     Image = PostOrder;
                //     Promoted = true;
                //     Visible = false;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ShortCutKey = 'F9';

                //     trigger OnAction()
                //     begin
                //         //Post(CODEUNIT::"Sales-Post (Yes/No)");

                //         //PVPost."Post Payment Voucher"(Rec);
                //         //PaymentsPost.PostPettyCash(Rec);
                //         //Committment.ImprestCommittment(Rec);
                //     end;
                // }
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
            action("Initiate Staff Claim")
            {
                ApplicationArea = Basic;
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'You do not have sufficient rights to Initiate  a staff claim! Please! contact System Administrator for Assistance.';
                    TXT002: label 'Initiate staff claim for the staff %1';
                    TXT003: label 'The employee %1 is not due for a refund';
                begin
                    if Confirm(TXT002, true, Rec."Account Name") = true then begin
                        usersetup.Get(UserId);
                        if usersetup."post surrender" = false then
                            Error(TXT001);
                        if Rec."Remaining Amount" < 0 then
                            PaymentPost.CreateStaffClaim(Rec) else
                            Error(TXT003, Rec."Account Name");
                    end
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        // SetControlAppearance;

        DocType := DocType::"Advance Surrender";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);

        Rec.CalcFields("Imprest Amount");
        Rec.CalcFields("Imprest AirFares Amount");
        Rec.CalcFields("Imprest Conf Amount");
        Rec.CalcFields("Imprest Comms Amount");
        Rec."Imprest Total Amount" := Rec."Imprest Amount" + Rec."Imprest AirFares Amount" + Rec."Imprest Comms Amount" + Rec."Imprest Conf Amount";

        Rec.CalcFields("Imprest Surr Amount");
        Rec.CalcFields("Imprest Surr AirFares Amount");
        Rec.CalcFields("Imprest Surr Conf Amount");
        Rec.CalcFields("Imprest Surr Comms Amount");
        Rec."Imprest Surr Total Amount" := Rec."Imprest Surr Amount" + Rec."Imprest Surr AirFares Amount" + Rec."Imprest Surr Comms Amount" + Rec."Imprest Surr Conf Amount";

        Rec.CalcFields("Remaining Amount");
        Rec.CalcFields("Remaining AirFares Amount");
        Rec.CalcFields("Remaining Conf Amount");
        Rec.CalcFields("Remaining Comms Amount");
        Rec."Remaining Total Amount" := Rec."Remaining Amount" + Rec."Remaining AirFares Amount" + Rec."Remaining Comms Amount" + Rec."Remaining Conf Amount";
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
        usersetup: Record "User Setup";
}

#pragma implicitwith restore

