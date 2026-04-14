#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65046 "Grant Funding Application Card"
{
    PageType = Card;
    SourceTable = Opportunity;
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments';
    // Editable=false;
    // InsertAllowed=false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No"; Rec."No.")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Opportunity Number"; Rec."Opportunity Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Opportunity No field.';
                }
                /* field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                } */
                /* field("FOA ID"; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FOA ID field.';
                    Visible = false;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                } */
                field("Opportunity  Title"; Rec.Description)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    Caption = 'Opportunity Title';
                    ToolTip = 'Specifies the value of the Opportunity  Title field.';
                }

                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Grant Type field.';
                }

                field("Application Status"; Rec.StatusCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Closed Date"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Closed Date field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Project Focus"; Rec."Project Focus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the project focus of the Grant.';
                }
                field("Primary Objective"; Rec."Primary Objective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the primary objective of the Grant.';
                }
            }
            group("Award Info")
            {

                /* field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        //SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                } */
                /* field("Requested Grant Amount"; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Grant Amount field.';
                } */
                field("Requested Grant Amount(LCY)"; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested Grant Amount(USD)';
                    ToolTip = 'Specifies the value of the Requested Grant Amount(LCY) field.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contact Name';
                }
                field("Contact Company Name"; Rec."Contact Company Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                }
                field("Donor Type"; Rec."Donor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Mechanism"; Rec."Grant Mechanism")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Allocation to APHF"; Rec."Percentage Allocation to APHF")
                {
                    ApplicationArea = Basic;
                }
                field("Allocation to APHF"; Rec."Allocation to APHF")
                {
                    ApplicationArea = Basic;
                }
            }

            group("Grantor Information")
            {
                /* field("Grantor No."; Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor No. field.';
                }
                field("Grantor Name"; Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grantor Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No field.';
                } */

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
            systempart(Control46; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control47; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control48; MyNotes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            // group(Test)
            // {
            //     Caption = 'Test';

            //     action(Testing)
            //     {
            //         Caption = 'Testing Auto Dataverse';

            //         trigger onAction()
            //         var 
            //             Dataverse: Record Opportunity;
            //         begin
            //         if  Rec."No." <> xRec."No." then begin
            //              if Dataverse.StatusCode = 'Won' then begin
            //                 end 
            //             end;
            //         end;
            //     }
            // }

            group(ActionGroupDataverse)
            {
                Caption = 'Dataverse';
                Visible = DataverseIntegrationEnabled;

                action(DataverseGotoWorker)
                {
                    Caption = 'Worker';
                    Image = CoupledCustomer;
                    ToolTip = 'Open the coupled Dataverse worker.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(DataverseSynchronizeNow)
                {
                    Caption = 'Synchronize';
                    ApplicationArea = All;
                    Visible = true;
                    Image = Refresh;
                    Enabled = DataverseIsCoupledToRecord;
                    ToolTip = 'Send or get updated data to or from Microsoft Dataverse.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(Rec.RecordId);
                    end;
                }
                action(ShowLog)
                {
                    Caption = 'Synchronization Log';
                    ApplicationArea = All;
                    Visible = true;
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the customer table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(Rec.RecordId);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Microsoft Dataverse row.';

                    action(ManageDataverseCoupling)
                    {
                        Caption = 'Set Up Coupling';
                        ApplicationArea = All;
                        Visible = true;
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Microsoft Dataverse Worker.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteDataverseCoupling)
                    {
                        Caption = 'Delete Coupling';
                        ApplicationArea = All;
                        Visible = true;
                        Image = UnLinkAccount;
                        Enabled = DataverseIsCoupledToRecord;
                        ToolTip = 'Delete the coupling to a Microsoft Dataverse Worker.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
            }

            action("Proposed Grant Budget")
            {
                ApplicationArea = Basic;
                Image = CopyBudget;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Budget Summary List";
                RunPageLink = "Grant Application ID" = field("No.");
                ToolTip = 'Executes the Proposed Grant Budget action.';
            }
            // action("Administrative Tasks")
            // {
            //     ApplicationArea = Basic;
            //     Image = Task;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Grant Admin Tasks List";
            //     RunPageLink = "Sourec Document No." = field("No.");
            //     ToolTip = 'Executes the Administrative Tasks action.';
            // }

            separator(Action61)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                var
                //ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);//status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                                                         //if //ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) then
                                                         //ApprovalsMgmt.OnSendGFAForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                    //ApprovalsMgmt.""(Rec);
                end;
            }

        }
    }
    trigger OnOpenPage()
    begin
        DataverseIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled();
    end;

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        if DataverseIntegrationEnabled then
            DataverseIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);

        DocType := DocType::"Grant Funding Application";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        DataverseIntegrationEnabled: Boolean;
        DataverseIsCoupledToRecord: Boolean;
        ChangeExchangeRate: Page "Change Exchange Rate";

}

#pragma implicitwith restore

