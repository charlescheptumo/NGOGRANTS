page 95402 "Approved Award Addendum"
{
    ApplicationArea = All;
    Caption = 'Approved Award Addendum';
    PageType = Card;
    SourceTable = "Award Extension";
    SourceTableView = where(Status = const(Approved));
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Award No"; Rec."Award No")
                {
                    ToolTip = 'Specifies the value of the Sub Award No field.';
                }
                field("Donor Name"; Rec."Donor Name")
                {
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field("Award Description"; Rec."Award Description")
                {
                    ToolTip = 'Specifies the value of the Award Description field.';
                }
                field("Award Start Date"; Rec."Award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award Start Date field.';
                }
                field("Award End Date"; Rec."Award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award End Date field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }
                field("Extend to Date"; Rec."Extend to Date")
                {
                    ToolTip = 'Specifies the value of the Extend to Date field.';
                }
                field("Extended By"; Rec."Extended By")
                {
                    ToolTip = 'Specifies the value of the Extended By field.';
                }
                field("Extented On"; Rec."Extented On")
                {
                    ToolTip = 'Specifies the value of the Extented On field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ToolTip = 'Specifies the value of the Additional Budget field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
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
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalDocType: Enum "Approval Document Type";
                    begin

                        ApprovalDocType := ApprovalDocType::"Sub Contract Extension";
                        ApprovalEntries.SetRecordFilters(Database::"Award Extension", ApprovalDocType, Rec."No.");
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
                        Rec.TestField("Award No");
                        // Rec.TestField("Award No");
                        Rec.TestField("Extension Type");
                        Rec.TestField("Extended By");
                        Rec.TestField("Extend to Date");

                        if Rec."Extension Type" = Rec."Extension Type"::"With Additional Budget" then
                            rec.TestField("Additional Budget");

                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;


                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    //Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                                                                              //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                              //ApprovalsMgmt.OnCancelSubContractExtensionVoucherApprovalRequest(Rec);
                                                                              // IF ApprovalsMgmt.CheckSubContractExtensionVoucherApprovalsWorkflowEnabled(Rec)
                                                                              // then
                                                                              //     approvalsMgmt.OnCancelSubContractExtensionVoucherApprovalRequest(Rec);
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
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
                    group("Extend")
                    {
                        Caption = 'Extend';
                        Image = Post;
                        action(Post)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Addend';
                            Image = PostOrder;
                            Promoted = true;
                            PromotedCategory = Process;
                            PromotedIsBig = true;
                            Visible = false;
                            ShortCutKey = 'F9';
                            ToolTip = 'Executes the Addend action.';
                            trigger OnAction()
                            var
                                New: Record "Project Contract Header";
                                NewContractFundingLines: Record "Contract Funding Lines";
                            begin

                                Rec.TestField(Status, Rec.Status::Approved);

                                if Rec."Extension Type" = Rec."Extension Type"::"With Additional Budget" then
                                    rec.TestField("Additional Budget");

                                ProjectContractHeader.Reset();
                                ProjectContractHeader.SetRange("Project Contract No", rec."Award No");
                                IF ProjectContractHeader.FindSet() then begin
                                    // Subaward."Document Status" := Subaward."Document Status"::Extension;
                                    // subaward."Contract End Date" := Rec."Extend to Date";
                                    // Subaward."Budget Ceiling" := Subaward."Budget Ceiling" + Rec."Additional Budget";                                    Subaward.Modify();

                                    New.TransferFields(ProjectContractHeader);
                                    NewContractFundingLines.TransferFields(AwardContractLines);
                                    NewContractFundingLines.TransferFields(GrantReportingSchedule);
                                    NewContractFundingLines.TransferFields(GrantPaymentSchedule);
                                    New."Project Contract No" := '';
                                    // New."Document Status" := New."Document Status"::Extension;
                                    New."Contract End Date" := Rec."Extend to Date";
                                    NewContractFundingLines."Approved Funding Limit" := NewContractFundingLines."Approved Funding Limit" + Rec."Additional Budget";
                                    New."Addendum Counter" := ProjectContractHeader."Addendum Counter" + 1;
                                    if ProjectContractHeader."Addendum Counter" = 0 then begin
                                        New."Original Award Contract" := Rec."Award No";
                                        ProjectContractHeader."Addendum Counter" := ProjectContractHeader."Addendum Counter" + 1;
                                        ProjectContractHeader."Renewed Award Contract No" := Rec."No.";
                                    end;
                                    New."Renewed Award Contract No" := Rec."No.";
                                    New."Contract Start Date" := Rec."Award End Date" + 1;
                                    New.Insert(true);
                                    Message('The Award Contract has been renewed. The renewed Award Contract number is %1', New."Project Contract No");
                                    Page.Run(Page::"Project Contract Card", New);
                                    // New.Modify();

                                    Rec."Extented On" := Today;
                                    Rec."Extended By" := UserId;
                                    Rec.Extended := True;
                                end;
                                message('Award Contract extended successfully');

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
                            Visible = false;
                            PromotedCategory = Category5;
                            PromotedIsBig = true;
                            ToolTip = 'Executes the Attach Documents action.';
                            trigger OnAction()
                            begin
                                //DMSManagement.FnUploadPaymentVoucherDocs(Rec."No.", 'Payment Voucher', Rec.RecordId);
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

        DocType := DocType::"Award Addendum";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin

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

    end;

    var
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The Donor Account Number Must have a value. Cannot be empty.';
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
        Subaward: Record "Project Contract Header";
        ProjectContractHeader: Record "Project Contract Header";
        AwardContractLines: Record "Contract Funding Lines";
        GrantPaymentSchedule: Record "Grant Payment Schedule";
        GrantReportingSchedule: Record "Grant Reporting Schedule";
}
