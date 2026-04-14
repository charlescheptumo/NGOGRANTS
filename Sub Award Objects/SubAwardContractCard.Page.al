page 65166 "Sub Award Contract Card"
{
    ApplicationArea = All;
    Caption = 'Sub Award Contract Card';
    PageType = Card;
    SourceTable = "Sub Award";
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                    Caption = 'Sub Award No';
                }
                field("PFC No"; Rec."PFC No")
                {
                    Caption = 'Project Funding Contract';
                    ToolTip = 'Specifies the value of the PFC No field.';
                }
                field("Implementing No"; Rec."Sub Awardee No")
                {
                    ToolTip = 'Specifies the value of the Sub Awardee No field.';
                }
                field("Implementing Name"; Rec."Sub Awardee Name")
                {
                    ToolTip = 'Specifies the value of the Sub Awardee Name field.';
                }
                field("Sub-award Start Date"; Rec."Sub-award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub-award Start Date field.';
                }
                field("Sub-award End Date"; Rec."Sub-award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub-award End Date field.';
                }
                field("Project Title"; Rec."Project Title")
                {
                    ToolTip = 'Specifies the value of the Project Title field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Approved Amount "; Rec."Approved Amount")
                {
                    ToolTip = 'Specifies the value of the Approved Amount  field.';
                }
                field("Approved Amount(LCY)"; Rec."Approved Amount(LCY)")
                {
                    visible = false;
                    ToolTip = 'Specifies the value of the Approved Amount(LCY) field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("DeObligated Funds"; Rec."DeObligated Funds")
                {
                    ToolTip = 'Specifies the value of the DeObligated Funds field.';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field(Goal; Rec.Goal)
                {
                    ToolTip = 'Specifies the value of the Goal field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ToolTip = 'Specifies the value of the Physical Address field.';
                }

                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ToolTip = 'Specifies the value of the Approved By field.';
                    Visible = false;
                }
                field("Approved On"; Rec."Approved On")
                {
                    ToolTip = 'Specifies the value of the Approved On field.';
                    Visible = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                    editable = false;
                    Visible = false;
                }
                field("Created by"; Rec."Created by")
                {
                    ToolTip = 'Specifies the value of the Created by field.';
                    Editable = false;
                    Visible = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Under Contracting Status"; rec."Under Contracting Status")
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                group(Addendum)
                {

                    field("Original Sub Award Contract"; Rec."Original Sub Award Contract")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Original Lease field.';
                    }
                    field("Renewed Sub Award Contract No"; Rec."Renewed Sub Award Contract No")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Renewed Lease No field.';
                    }
                    field("Addendum Counter"; Rec."Addendum Counter")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Renewal Counter field.';
                    }
                }


            }
            group("Main Award Detais")
            {
                Visible = false;
                field(GFA; Rec.GFA)
                {
                    Caption = 'Grant Funding Application';
                    ToolTip = 'Specifies the value of the GFA field.';
                }
                field("Main Award"; Rec."Main Award")
                {
                    ToolTip = 'Specifies the value of the Main Award field.';
                }
                field("Main Award Start Date"; Rec."Main Award Start Date")
                {
                    ToolTip = 'Specifies the value of the Main Award Start Date field.';
                }
                field("Main Award Objective"; Rec."Main Award Objective")
                {
                    ToolTip = 'Specifies the value of the Main Award Objective field.';
                }
                field("Main Award Program"; Rec."Main Award Program")
                {
                    ToolTip = 'Specifies the value of the Main Award Program field.';
                }
                field("Main Award End Date"; Rec."Main Award End Date")
                {
                    ToolTip = 'Specifies the value of the Main Award End Date field.';
                }
            }
            part(Control1000000021; "Sub Award Objectives")
            {
                SubPageLink = "Sub Award No" = field("No");
                ApplicationArea = Basic;
            }
            part(Control1000000022; "Sub Award Services Provided")
            {
                SubPageLink = "Sub Award No" = field("No");
                ApplicationArea = Basic;
            }
            part(Control1000000023; "Sub Ward Budget Summary")
            {
                SubPageLink = "Sub Award No" = field("No");
                ApplicationArea = Basic;
            }
            part(Control1000000024; "Sub Award Milestones")
            {
                SubPageLink = "Sub Award No" = field("No");
                ApplicationArea = Basic;
            }
            part(Control1000000025; "Sub Award Mornitoring Schedule")
            {
                SubPageLink = "Sub Award No" = field("No");
                ApplicationArea = Basic;
            }
            part(Control1000000026; "Sub Award Reporting Schedule")
            {
                SubPageLink = "Sub Award No" = field("No");
                ApplicationArea = Basic;
                Caption = 'Reporting Schedule';
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(No);
                Caption = 'Attachments';
            }

        }
    }

    /////////////////////////////////////////////// Area Functions//////////////////////////////////////
    actions
    {
        area(navigation)
        {
            group("Sub Award")
            {
                Caption = 'Sub Award';
                Image = "Order";
                action("Co&mments")
                {

                }
                action(Dimensions)
                {

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        // ApprovalEntries.SetRecordFilters(Database::Payments, 8, Rec."No.");
                        // ApprovalEntries.Run;
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
                    //  Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';
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

                    }
                    action("&Reporting")
                    {
                        ApplicationArea = Basic;
                        Caption = '&Implementing Partner Reporting Notification';
                        Ellipsis = true;
                        Image = Print;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Report "Sub Award Report Schedule";
                        ToolTip = 'Executes the &Implementing Partner Reporting Notification action.';

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
                            ToolTip = 'Executes the Re&lease action.';
                            trigger OnAction()
                            var
                            //ReleasePurchDoc: Codeunit "Release Purchase Document";
                            // ReleasePurchDoc: Codeunit Payments;
                            begin
                                // ReleasePurchDoc.PerformManualRelease(Rec)
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
                            PromotedCategory = Process;
                            PromotedIsBig = true;
                            ShortCutKey = 'F9';
                            Visible = false;
                            ToolTip = 'Executes the P&ost action.';
                            trigger OnAction()
                            begin
                                //Post(CODEUNIT::"Sales-Post (Yes/No)");

                                //PVPost."Post Payment Voucher"(Rec);
                                //  PaymentsPost."Post Payment Voucher"(Rec);
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
                            PromotedCategory = Process;
                            PromotedIsBig = true;
                            PromotedOnly = true;
                            Visible = false;
                            ToolTip = 'Approve the requested changes.';
                            // Visible = OpenApprovalEntriesExistForCurrUser;

                            trigger OnAction()
                            var
                            // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            begin
                                // ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                            end;
                        }
                        action(Reject)
                        {
                            ApplicationArea = Suite;
                            Caption = 'Reject';
                            Image = Reject;
                            Promoted = true;
                            PromotedCategory = Process;
                            PromotedIsBig = true;
                            PromotedOnly = true;
                            Visible = false;
                            ToolTip = 'Reject the requested changes.';
                            // Visible = OpenApprovalEntriesExistForCurrUser;

                            trigger OnAction()
                            var
                            // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            begin
                                // ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                            end;
                        }
                        action(Delegate)
                        {
                            ApplicationArea = Suite;
                            Caption = 'Delegate';
                            Image = Delegate;
                            Promoted = true;
                            PromotedCategory = Process;
                            PromotedOnly = true;
                            ToolTip = 'Delegate the requested changes to the substitute approver.';
                            // Visible = OpenApprovalEntriesExistForCurrUser;
                            Visible = false;

                            trigger OnAction()
                            var
                            // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            begin
                                // ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
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
                            // Visible = not OpenApprovalEntriesExist;
                            Visible = false;

                            trigger OnAction()
                            var
                            // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                            begin
                                // ApprovalsMgmt.GetApprovalComment(Rec);
                            end;
                        }
                        action(Addemdums)
                        {
                            Caption = 'Addemdums';
                            ApplicationArea = Basic;
                            Promoted = true;
                            PromotedCategory = Process;
                            Image = ReOpen;
                            Visible = false;
                            trigger OnAction()
                            var
                                New: Record "Sub Award";
                            begin
                                New.TransferFields(Rec);
                                New.No := '';
                                New."Document Status" := New."Document Status"::Ongoing;
                                // New.Expired := false;
                                // New."Under Contracting Status" := New."Under Contracting Status"::Completion;
                                New."Created By" := UserId;
                                // New."Created On" := CurrentDateTime;
                                New."Addendum Counter" := Rec."Addendum Counter" + 1;
                                if Rec."Addendum Counter" = 0 then
                                    New."Original Sub Award Contract" := Rec.No;
                                New."Renewed Sub Award Contract No" := Rec.No;
                                // if Rec."Document Status"::Ongoing then
                                //     New."Sub-award Start Date" := Today
                                // else
                                //     New."Sub-award Start Date" := Rec."Sub-award End Date" + 1;
                                // New.Validate(Period);

                                New.Insert(true);
                                Message('The lease has been renewed. The renewing lease number is %1', New.No);
                                Page.Run(Page::"Sub Award Contract Card", New);
                            end;
                        }
                        action(Agreement)
                        {
                            ApplicationArea = All;
                            Caption = 'Sub Grant Agreement';
                            Image = ContractPayment;
                            Promoted = true;
                            PromotedCategory = Process;
                            PromotedOnly = true;
                            trigger OnAction()
                            begin
                                Rec.SetRange(No, Rec.No);
                                Report.Run(Report::"Sub Grant Agreement", true, false, Rec);
                            end;
                        }
                        action(Closeout)
                        {
                            ApplicationArea = All;
                            Caption = 'Closeout Report';
                            Image = Close;
                            Promoted = true;
                            PromotedCategory = Process;
                            PromotedOnly = true;
                            Visible = Closeout;
                            trigger OnAction()
                            begin
                                Rec.SetRange(No, Rec.No);
                                Report.Run(Report::"Grant Closeout Report", true, false, Rec);
                            end;
                        }

                    }
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        // SetControlAppearance;

        DocType := DocType::"Sub Award Contract";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec.No);
        Rec.CalcPayment();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF USERID<>pvheader."Created By" THEN
          ERROR('%1',text0002);*///Machira

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    var

        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The Implementing Partner Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record Payments;
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CashMgt: Record "Cash Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
        PaymentEntries: Record "Payment Entries";
        Text003: label 'The PV No.:%1 has already attached this invoice No.: %2.';
        PVLines1: Record "PV Lines";
        DMSManagement: Codeunit "DMS Management";
        Closeout: Boolean;


    procedure SetControlAppearance()
    begin
        if Rec."Document Status" = Rec."Document Status"::Closeout then
            Closeout := true
        else
            Closeout := false;
    end;


}

#pragma implicitwith restore

