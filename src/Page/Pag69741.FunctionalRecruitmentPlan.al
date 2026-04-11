#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69741 "Functional Recruitment Plan"
{
    PageType = Card;
    SourceTable = "Recruitment Plan";
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate';

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
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    visible = false;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Annual Recruitment Plan No."; Rec."Annual Recruitment Plan No.")
                {
                    ApplicationArea = Basic;
                    //Visible = VarEditable;
                    ToolTip = 'Specifies the value of the Annual Recruitment Plan No. field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field("Approved Staff Establishment"; Rec."Approved Staff Establishment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Approved Staff Establishment field.';
                }
                field("Functional Planned Hires"; Rec."Functional Planned Hires")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    ToolTip = 'Specifies the value of the Functional Planned Hires field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division Code';
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created BY"; Rec."Created BY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created BY field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control26; "Functional Planning Line")
            {
                SubPageLink = "Recruitment Plan ID" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
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
                PromotedIsBig = true;
                // Visible = false;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69612, true, false, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                Visible = false;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
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
                Visible = false;
                ToolTip = 'Executes the Approvals action.';
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
                Visible = false;
                PromotedCategory = Category7;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Message('Approval Request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Approved;
                    Rec.Modify(true);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                Visible = false;
                PromotedCategory = Category7;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Message('Approval Request has been cancelled');
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }

            action("Post To Annual Plan")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post To Annual Plan action.';
                trigger OnAction()
                begin
                    //Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Recruitment.PostFuncPlanToAnnual(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Recruitment Plan Type" := Rec."recruitment plan type"::"Functional Plan";
        Rec."Document Date" := Today;
        Rec."Approval Status" := Rec."Approval Status"::Approved;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" = Rec."approval status"::Approved then begin
            Visible := false;
            VarEditable := true;
        end
    end;

    var
        Recruitment: Codeunit Recruitment;
        Visible: Boolean;
        VarEditable: Boolean;
}

#pragma implicitwith restore

