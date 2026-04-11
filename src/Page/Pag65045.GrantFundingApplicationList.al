#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65045 "Grant Funding Application List"
{
    Caption = 'Grant Funding Applications';
    CardPageID = "Grant Funding Application Card";
    //Editable = false;
    PageType = List;
    SourceTable = Opportunity;
    //SourceTableView = where("Application Status" = const("Not Started"),
    //                        "Approval Status" = filter(Open | "Pending Approval"));
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }


                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }

                field("Requested Grant Amount(LCY)"; Rec."Estimated Value (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Requested Grant Amount (USD)';
                    ToolTip = 'Specifies the value of the Requested Grant Amount(LCY) field.';
                }
                /*  field("Awarded Grant Amount (LCY)"; Rec."Awarded Grant Amount (LCY)")
                 {
                     ApplicationArea = Basic;
                     Caption = 'Awarded Grant Amount (USD)';
                     ToolTip = 'Specifies the value of the Awarded Grant Amount (LCY) field.';
                 } */
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }

            }
        }
    }

    actions
    {
        area(creation)
        {

            group(Dataverse)
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
        }
    }
    trigger OnOpenPage()
    begin
        DataverseIntegrationEnabled := CRMIntegrationManagement.IsCDSIntegrationEnabled();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if DataverseIntegrationEnabled then
            DataverseIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
        DataverseIntegrationEnabled: Boolean;
        DataverseIsCoupledToRecord: Boolean;
        ChangeExchangeRate: Page "Change Exchange Rate";


}

#pragma implicitwith restore

