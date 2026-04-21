#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50034 "pageextension50034" extends "G/L Budget Names"
{
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

    layout
    {
        addafter(Description)
        {
            field("Budget Type"; Rec."Budget Type")
            {
                ApplicationArea = Basic;
            }
            field("Original Budget"; Rec."Original Budget")
            {
                ApplicationArea = Basic;
            }
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = Basic;
                Editable = true;
            }
        }
    }
    actions
    {
        addafter(ReportTrialBalance)
        {
            action("Original/Supplimentary")
            {
                ApplicationArea = Suite;
                Caption = 'Original/Supplimentary';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'View budget details in relation to the supplimentary budget.';

                trigger OnAction()
                begin
                    Rec.SetRange(Name, Rec.Name);
                    Report.Run(57008, true, false, Rec);
                end;
            }
            separator(Action20)
            {
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction()
                var
                    TEXT001: LABEL 'An Approval request has been sent.';
                begin
                    //if //ApprovalsMgmt.OnSendICTIssuanceForApproval(Rec) then
                    //ApprovalsMgmt.OnSendBudgetForApproval(Rec);
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    rec."Approval Status" := rec."Approval Status"::"Pending Approval";
                    Message(TEXT001);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction()
                var
                    TEXT002: LABEL 'An Approval request has been cancelled.';
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    rec."Approval Status" := rec."Approval Status"::Open;
                    Message(TEXT002);
                    //ApprovalsMgmt.CheckInspectionWorkflowEnabled(Rec);
                end;
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ApprovalEntries.SetRecordFilters(Database::"G/L Budget Name", 31, Rec.Name);
                    ApprovalEntries.Run;
                end;
            }
        }
    }

    var
        GLBudgetEntry: Record "G/L Budget Entry";
        GLAccount: Record "G/L Account";
        ApprovalEntries: Page "Approval Entries";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

