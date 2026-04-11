#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57106 "Staff Claim"
{
    // DeleteAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
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
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    // Enabled = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Surrender  Doc. No"; Rec."Surrender  Doc. No")
                {
                    ApplicationArea = Basic;
                }
                field("Surrender Due Date"; Rec."Surrender Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                }
                field("Project Name"; Rec."Project Name")
                {
                    ToolTip = 'Specifies the value of the Unit Name field.';
                    Caption = 'Program Name';
                }

                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                    // Visible = false;
                }

                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    Caption = 'Department Name';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Department Name';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Total Amount USD';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    // ShowMandatory = true;
                    Caption = 'Project Code';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Task No';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Project Name';
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project Task Budget';
                    Visible = false;
                }
                field("Commitments."; Rec."Commitments.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    Caption = 'Project Task Remaining Amount';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type of Expense';
                    Editable = true;
                }
            }
            part(Control1000000021; "Staff Claim Lines")
            {
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
            systempart(Control1000000022; Links)
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
                Caption = 'Additional Actions';
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
                action("Resource Costs")
                {
                    ApplicationArea = Basic;
                    Image = ResourceCosts;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        Resource.Reset;
                        Resource.SetRange("No.", Rec."Account No.");
                        if Resource.FindSet then begin
                            ResourceNo := Resource."Resource Group No.";
                            ResourceCost.SetCurrentkey(Code);
                            ResourceCost.SetRange(Code, ResourceNo);
                            ResourceCard.SetTableview(ResourceCost);
                            ResourceCard.Run;
                        end
                    end;
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
                        DocType: Enum "Approval Document Type";
                    begin

                        DocType := DocType::"Staff Claims";
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
                        Rec.TestField("Account No.");
                        Rec.TestField("Account Name");
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."User ID" <> Rec."Created By" then
                                Error(Text0001, Rec."No.");
                        end;
                        // Rec.TestField(Job);
                        // Rec.TestField("Job Task No");
                        // Rec.TestField("Surrender  Doc. No");
                        /*TESTFIELD(Job);
                        TESTFIELD("Job Task No");*/

                        Rec.CalcFields("Total Amount LCY");
                        Rec.TestField("Total Amount LCY");

                        TotalImprestAmount := Rec."Total Amount LCY";
                        /*IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                           ERROR('Applied Staff Claim of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");
                        */
                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     ApprovalsMgmt.OnSendPaymentsForApproval(Rec);

                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    // Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                        Report.Run(57011, true, true, Rec)
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
                        ReleasePurchDoc: Codeunit Payments;
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
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
                separator(Action1000000036)
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
                    Visible = false;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost.PostStaffClaimsNew(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        DMSManagement.FnUploadStaffClaimDocs(Rec."No.", 'Advance Naration', Rec.RecordId);
                    end;
                }
                action("Portal Documents")
                {
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Opens attached documents from the portal.';
                    RunObject = Page "Portal Documents";
                    RunPageLink = ApplicationNo = field("No.");
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;

        DocType := DocType::"Staff Claims";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Staff Claim";
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Document Type" := Rec."document type"::"Staff Claims";
        //
        // Rec."Account Type" := Rec."account type"::Employee;
        //
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // IF UserSetup.FINDSET THEN BEGIN
        // "Account No.":=UserSetup."Employee No.";
        //  VALIDATE("Account No.");
        // END
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        TotalImprestAmount: Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        UserSetup: Record "User Setup";
        ResourceCost: Record "Resource Cost";
        ResourceCard: Page "Resource Costs";
        Resource: Record Resource;
        ResourceNo: Code[30];
        DMSManagement: Codeunit "DMS Management";
        Text0001: label 'You cannot Send document No. %1 for approval. Documents can only be Send for Approval by initiators ';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmts: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmts.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmts.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}

#pragma implicitwith restore

