#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57026 "Imprest Surrender"
{
    // DeleteAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    Caption = 'Advance Request Surrender';
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Open | "Pending Approval"));
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Deadline';
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field("Imprest Memo Surrender No"; Rec."Imprest Memo Surrender No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    Caption = 'Advance Surrender No';
                    ToolTip = 'Specifies the value of the Imprest Memo Surrender No field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    // Editable = not OpenApprovalEntriesExist;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Issue Doc. No';
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }

                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Sub Department';
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project';
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                    ToolTip = 'Specifies the value of the Donor  Name field.';
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
                    ToolTip = 'Specifies the value of the Actual Amount Spent field.';
                }
                field("DSA Actual Amount Spent USD"; Rec."DSA Actual Amount Spent LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DSA Actual Amount Spent USD field.';
                }
                field("Conf Actual Amount Spent USD"; Rec."Conf Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Conf Actual Amount Spent USD field.';
                }
                field("AirFares Actual Amount Spent USD"; Rec."AirFares Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AirFares Actual Amount Spent USD field.';
                }
                field("Comms Actual Amount Spent USD"; Rec."Comms Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comms Actual Amount Spent USD field.';
                }
                field("Total Actual Amount Spent USD"; Rec."Total Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Actual Amount Spent USD field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                    Visible = false;
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
                    Caption = 'Remaining AirFares Amount';
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
                    Caption = 'Remaining Communication Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Total Amount"; Rec."Remaining Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Total Remaining Amount';
                    ToolTip = 'Specifies the value of the Total Remaining Amount field.';
                }
            }
            part(Control1000000017; "Imprest Surrender Lines")
            {
                Editable = not OpenApprovalEntriesExist;
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
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
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
                    ToolTip = 'Executes the Approvals action.';
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        //TESTFIELD(Project);
                        //TESTFIELD("Job Task No.");
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        //TESTFIELD("Shortcut Dimension 3 Code");

                        ImprestLines.Reset;
                        ImprestLines.SetRange(No, Rec."No.");
                        ImprestLines.CalcSums("Actual Spent");
                        // if ImprestLines."Actual Spent" <= 0 then
                        //     Error('Actual Spent must have a value');


                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     ApprovalsMgmt.OnSendPaymentsForApproval(Rec);

                        /*IF ImprestHeader.GET("Imprest Issue Doc. No") THEN BEGIN
                        ImprestHeader.Selected:=TRUE;
                        ImprestHeader.MODIFY;
                        END;*/

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
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        // if UserSetup.Get(UserId) then begin
                        //     if UserSetup."User ID" <> Rec."Created By" then
                        //         Error(Text0001, Rec."No.");
                        // end;
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        // IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        // Rec.Status := Rec.Status::Open;
                        // Message('The approval request has been cancelled');
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        // if ImprestHeader.Get(Rec."Imprest Issue Doc. No") then begin
                        //     ImprestHeader.Selected := false;
                        //     ImprestHeader.Modify;
                        // end;
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
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57005, true, true, Rec)
                    end;
                }
                action("Portal Documents")
                {
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Opens attached documents from the portal.';
                    RunObject = Page "Portal Documents";
                    RunPageLink = ApplicationNo = field("No.");
                }
            }
            /* action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category5;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Visible = false;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            } */
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    Visible = false;
                    Enabled = false;
                    ToolTip = 'Executes the Re&lease action.';
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
                    ToolTip = 'Executes the Re&open action.';
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
                    ToolTip = 'Executes the P&ost action.';
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
                    Visible = false;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        DMSManagement.FnUploadImptestSurrenderDocs(Rec."No.", 'Imprest Surrender', Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;

        DocType := DocType::"Advance Surrender";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenSurrEntries(Rec);
        SetControlAppearance;

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

        Rec.CalcFields("DSA Actual Amount Spent LCY");
        Rec.CalcFields("Conf Actual Amount Spent USD");
        Rec.CalcFields("AirFares Actual Amount Spent USD");
        Rec.CalcFields("Comms Actual Amount Spent USD");
        Rec."Total Actual Amount Spent USD" := Rec."DSA Actual Amount Spent LCY" + Rec."Conf Actual Amount Spent USD" + Rec."AirFares Actual Amount Spent USD" + Rec."Comms Actual Amount Spent USD";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Surrender;
        // Rec."Account Type" := Rec."account type"::Employee;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Document Type" := Rec."document type"::Surrender;
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenSurrEntries(Rec);
        SetControlAppearance;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";

        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;

        UserSetup: Record "User Setup";
        Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';
        ImprestHeader: Record Payments;
        ImprestLines: Record "Imprest Lines";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}

#pragma implicitwith restore

