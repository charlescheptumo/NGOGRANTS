#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69621 "Recruitment Plan"
{
    PageType = Card;
    SourceTable = "Recruitment Plan";
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approved Staff Establishment"; Rec."Approved Staff Establishment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("No. of Planned New Hires"; Rec."No. of Planned New Hires")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Recruitment Requisition"; Rec."No. of Recruitment Requisition")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Recruitment Budget (LCY)"; Rec."Total Recruitment Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created BY"; Rec."Created BY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Created By';
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control26; "Recruitment Plan Position")
            {
                SubPageLink = "Recruitment Plan ID" = field("Document No.");
                ApplicationArea = Basic;
            }
            part(Control27; "Recruitment Planning Line")
            {
                SubPageLink = "Recruitment Plan ID" = field("Document No."), "Recruitment Plan Type" = const("Annual HR Plan");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control30; "Plan Factbox")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                // Visible = false;
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69603, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                Visible = false;
                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.SetRecordFilters(DATABASE::"Purchase Header","Document Type","No.");
                    ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Document No.");
                    ApprovalEntries.Run;
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    // ApprovalsMgmt: Codeunit "Approval Mgmt Ext";
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    // if ApprovalsMgmt.CheckRecruitmentPlanApprovalsWorkflowEnabled(Rec) then
                    //     ApprovalsMgmt.OnSendRecruitmentPlanForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approval Mgmt Ext";
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    // if ApprovalsMgmt.CheckRecruitmentPlanApprovalsWorkflowEnabled(Rec) then
                    //     ApprovalsMgmt.OnSendRecruitmentPlanForApproval(Rec);
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = AgreementQuote;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                Visible = false;
                RunObject = Page "Hr Guiding Principle";
                RunPageLink = "HR Process" = filter("Recruitment & Selection");
            }
        }
    }
}

#pragma implicitwith restore

