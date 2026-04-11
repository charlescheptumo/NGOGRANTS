#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65186 "Sub Recepient Surrender"
{
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest Surrender"),
                            Posted = const(false));
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    //Editable = true;
                    Visible = false;
                }
                field("Sub award No"; Rec."Sub award No")
                {
                    ToolTip = 'Specifies the value of the Sub award No field.';
                }
                Field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Caption = 'Funds Request Issue Doc. No';
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
                    Caption = 'Budget';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Caption = 'Budget Line';
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

                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        Approvaltype: Enum "Approval Document Type";
                    begin
                        Approvaltype := Approvaltype::"Sub Award Funds Request Surrender";
                        ApprovalEntries.SetRecordFilters(Database::Payments, Approvaltype, Rec."No.");
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
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin


                        // Rec.TestField(Job);
                        // Rec.TestField("Job Task No");
                        Rec.TestField("Paying Bank Account");
                        Rec.TestField(Date);
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        Rec.TestField("Shortcut Dimension 3 Code");
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        // ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000043)
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
                        Report.Run(59098, true, true, Rec)
                    end;
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
                    Visible = Rec.Status = Rec.Status::Approved;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        Rec.TestField("Paying Bank Account");
                        if (Rec.Status = Rec.Status::Approved) then begin
                            PaymentsPost.PostStandingImprestSurrenderNew(Rec);
                        end else
                            Error('This document must be approved first');
                    end;
                }
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

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;

        DocType := DocType::"Sub Award Funds Request Surrender";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Standing Imprest Surrender";
        Rec."Document Type" := Rec."document type"::"Standing Imprest Surrender";
        Rec."Account Type" := Rec."Account Type"::Vendor;
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

#pragma implicitwith restore

