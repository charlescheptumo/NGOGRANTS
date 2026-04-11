page 50049 "Posted Recepient Surrender"
{
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest Surrender"),
                            Posted = const(true));
    Editable = false;
    DeleteAllowed = false;
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
                    Editable = true;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Issue Doc. No';

                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    // Visible = false;
                }
                Field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Caption = 'Implementing Partner';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Account';
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Surrender Narrations';
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Code Name';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Caption = 'Project';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Caption = 'Project Task No';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project Name';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    // Visible = false;
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }

                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(Control1000000021; "Standing Surrender Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
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
                    begin

                        ApprovalEntries.SetRecordFilters(Database::Payments, 8, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
        area(processing)
        {
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
                        Report.Run(59098, true, true, Rec)
                    end;
                }
                action("&Navigate")
                {
                    ApplicationArea = Basic;
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;


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

            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;

                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Image = Delegate;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Standing Imprest Surrender";
        Rec."Document Type" := Rec."document type"::"Standing Imprest Surrender";
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var

        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";

    local procedure SetControlAppearance()
    var

    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}
