#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50050 "pageextension50050" extends "Bank Acc. Reconciliation"
{

    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';
    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Bank Acc. Reconciliation"(Page 379)".

    layout
    {

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter(StatementEndingBalance)
        {
            field("Un Reconciled Amount"; Rec."Un Reconciled Amount")
            {
                ApplicationArea = Basic;
                Caption = 'UnReceipted Deposits';
                Editable = false;
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }

        modify(StatementNo)
        {
            Editable = true;
        }
    }
    actions
    {

        //Unsupported feature: Property Insertion (Visible) on "ImportBankStatement(Action 3)".


        //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 17)".


        //Unsupported feature: Property Modification (PromotedCategory) on "PostAndPrint(Action 9)".



        //Unsupported feature: Code Modification on "SuggestLines(Action 16).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SuggestBankAccStatement.SetStmt(Rec);
        SuggestBankAccStatement.RUNMODAL;
        CLEAR(SuggestBankAccStatement);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ("Bank Account No."<>'BNK0007') THEN BEGIN
          SuggestBankAccStatement.SetStmt(Rec);
          SuggestBankAccStatement.RUNMODAL;
          CLEAR(SuggestBankAccStatement);
        END;
        IF ("Bank Account No."='BNK0007') THEN BEGIN
         KCBCustomBankRec.FnGenerateFutureStatementLines(Rec);
        END;
        */
        //end;
        addfirst("Ba&nk")
        {
            action("Import Bank Statement")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Config. Packages";
                RunPageLink = Code = const('001');
            }
        }
        addafter("P&osting")
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
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

                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
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
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);


                    end;
                }
                action("Suggest Reconciliation Items")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        TXT001: label 'Are you sure you want to populate the pending reconciliation items';
                    begin
                        if Confirm(TXT001) = true then begin
                            PaymentsPost.SuggestReconcilingItems(Rec);
                        end
                    end;
                }
                action("Populate Reconciliation Items")
                {
                    ApplicationArea = Basic;
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        TXT001: label 'Are you sure you want to update the pending reconciliation items';
                    begin
                        if Confirm(TXT001) = true then begin
                            PaymentsPost.PopulateReconcilingItems(Rec);
                        end
                    end;
                }
                action(MatchAutomaticallyKCB)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Match Automatically KCB';
                    Image = MapAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Automatically search for and match bank statement lines.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.SetRange("Statement Type", Rec."Statement Type");
                        Rec.SetRange("Bank Account No.", Rec."Bank Account No.");
                        Rec.SetRange("Statement No.", Rec."Statement No.");
                        Report.Run(Report::"Match Bank Entries", true, true, Rec);
                    end;
                }
                action("Test Function")
                {
                    ApplicationArea = Basic;
                    Image = ActivateDiscounts;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        KCBCustomBankRec.FnUpdateFutureStatements(Rec);
                    end;
                }
            }
        }

        modify(Post)
        {
            Visible = false;
        }
        modify(PostAndPrint)
        {
            Visible = false;
        }
    }

    var
        PaymentsPost: Codeunit "Payments-Post";
        KCBCustomBankRec: Codeunit "KCB Custom Bank Rec";
}

#pragma implicitwith restore

