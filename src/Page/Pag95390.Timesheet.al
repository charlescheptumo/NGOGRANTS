page 95390 Timesheet
{
    ApplicationArea = All;
    Caption = 'Timesheet';
    PageType = Card;
    SourceTable = "Employee Timesheet";
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                // field("Document Date"; Rec."Document Date")
                // {
                //     ToolTip = 'Specifies the value of the Document Date field.';
                // }
                // field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                // {
                //     ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                // }
                // field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                // {
                //     ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                // }
                // field("Project"; Rec.Project)
                // {
                //     ToolTip = 'Specifies the value of the Project field.';
                // }
                // field("Project Description"; Rec."Project Description")
                // {
                //     ToolTip = 'Specifies the value of the Project Description field.';
                // }
                // field("Job Task No."; Rec."Job Task No.")
                // {
                //     ToolTip = 'Specifies the value of the Job Task No. field.';
                // }
                // field("No. Series"; Rec."No. Series")
                // {
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the No. Series field.';
                // }
                field("Timesheet Month"; Rec."Timesheet Month")
                {
                    ToolTip = 'Specifies the value of the Timesheet Month field.';
                    Editable = false;
                }
                // field("Current Year"; Rec."Current Year")
                // {
                //     ToolTip = 'Specifies the value of the Current Year field.';
                //     Editable = false;
                // }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                // field("Date of Join"; Rec."Date of Join")
                // {
                //     ToolTip = 'Specifies the value of the Date of Join field.';
                // }
                // field("Created By"; Rec."Created By")
                // {
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Created By field.';
                // }
                field("Created On"; Rec."Created On")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                // field(Posted; Rec.Posted)
                // {
                //     ToolTip = 'Specifies the value of the Posted field.';
                // }
                // field(SystemCreatedAt; Rec.SystemCreatedAt)
                // {
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                // }
                // field(SystemCreatedBy; Rec.SystemCreatedBy)
                // {
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                // }
                // field(SystemId; Rec.SystemId)
                // {
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the SystemId field.';
                // }
                // field(SystemModifiedAt; Rec.SystemModifiedAt)
                // {
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                // }
                // field(SystemModifiedBy; Rec.SystemModifiedBy)
                // {
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                // }
                field(Status; Rec.Status)
                {

                }
            }
            part(Control1000000021; "Timesheet Lines")
            {
                // Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Timesheet Header No" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Document No.");
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
                Enabled = Rec."Document No." <> '';
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
                Visible = false;

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
                    // Rec.TestField("Received From");
                    // Rec.TestField("On Behalf Of");
                    // Rec.TestField("Cheque No");
                    // Rec.TestField("Cheque Date");


                    // PaymentPost.PostReceipt(Rec);
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
                Visible = false;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    // Report.Run(56003, true, true, Rec);
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
                    ApprovalDocType: Enum "Approval Document Type";
                begin
                    // ApprovalDocType := ApprovalDocType::"Employee Timesheets";
                    ApprovalEntries.SetRecordFilters(Database::"Employee Timesheet", ApprovalDocType, Rec."Document No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    if Confirm('Are you sure you want to send an approval request', true) = false then exit;
                    //if ApprovalsMgmt.IsICTIssuanceApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendICTIssuanceForApproval(Rec);
                    VarVariant := Rec;
                    If CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;

                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action("Re-Open")
            {
                ApplicationArea = Basic;
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                end;
            }
        }

    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin

        // DocType := DocType::"Employee Timesheets";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."Document No.");

    end;

}
