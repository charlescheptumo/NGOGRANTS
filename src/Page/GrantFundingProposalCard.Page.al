#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 95046 "Grant Funding Proposal Card"
{
    PageType = Card;
    SourceTable = "Grant Funding Application";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ApplicationNo; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DocumentDate; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(FOAID; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Title';
                }
                field(FundingOpportunityTitleMaximumCharacters255; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Opportunity Title(Maximum Characters 255)';
                    Editable = true;
                }
                field(CallType; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(GrantType; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    MultiLine = true;
                }
                field(JustificationforApplication; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchCenter; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryResearchProgramID; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryResearchArea; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field(PrincipalInvestigator; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field(PrincipalInvestigatorName; Rec."Principal Investigator Name")
                {
                    ApplicationArea = Basic;
                }
                // field(GrantAdminTeamCode;Rec."Grant Admin Team Code")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                field(ApplicationStatus; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CreatedOn; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ClosedDate; Rec."Closed Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group("Award Info")
            {
                field(CurrencyCode; Rec."Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        //SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                }
                field(GrantProposalBudget; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Proposal Budget';
                }
                field(GrantProposalBudgetLCY; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Proposal Budget(LCY)';
                }
            }
            group(SubRecipientinformation)
            {
                Caption = 'Sub Recipient information ';
                Visible = false;
                field(NoticeofAwardno; Rec."Notice of Award no")
                {
                    ApplicationArea = Basic;
                }
                field(Subcontractno; Rec."Subcontract no")
                {
                    ApplicationArea = Basic;
                }
                field(InvoiceCode; Rec."Invoice Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Deadlines && Dates")
            {
                field(ApplicationDueDate; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationSubmittedDate; Rec."Application Submitted Date")
                {
                    ApplicationArea = Basic;
                }
                field(EstimatedAwardDate; Rec."Estimated Award Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group(SERUDetails)
            {
                Caption = 'SERU Details';
                Visible = false;
                field(SERUNo; Rec."SERU No.")
                {
                    ApplicationArea = Basic;
                }
                field(SERUApprovalDate; Rec."SERU Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field(SERUExpiryDate; Rec."SERU Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(SERUCRRDate; Rec."SERU CRR Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Funding Agency Information")
            {
                field(FundingAgencyNo; Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Agency No.';
                }
                field(FundingAgencyName; Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Agency Name';
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(MobilePhoneNo; Rec."Mobile Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(FAResearchContactID; Rec."Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Research Contact ID';
                }
                field(FAResearchReviewer; Rec."Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Research Reviewer';
                    Editable = false;
                }
                field(FAAdminContactID; Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Admin Contact ID';
                }
                field(FAAdminName; Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Admin Name';
                    Editable = false;
                }
                field(FAFinanceContactID; Rec."Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Finance Contact ID';
                }
                field(FAFinanceContact; Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Finance Contact';
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control46; Outlook)
            {
            }
            systempart(Control47; Notes)
            {
            }
            systempart(Control48; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Grant Research Objectives")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Grant Research Objectives List";
                RunPageLink = "Grant Application ID" = field("Application No");
            }
            action("Proposed Grant Budget")
            {
                ApplicationArea = Basic;
                Image = CopyBudget;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Grant Budget Summary List";
                RunPageLink = "Grant Application ID" = field("Application No");
            }
            separator(Action58)
            {
            }
            action("Research Teams")
            {
                ApplicationArea = Basic;
                Image = Task;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                // RunObject = Page "Grant Research Team list";
                // RunPageLink = "Grant Opportunity ID" = field("Application No");
                Visible = true;
            }
            action("Grant Admin Teams")
            {
                ApplicationArea = Basic;
                Image = Employee;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                // RunObject = Page "Application Grant Teams";
                // RunPageLink = "Application Code" = field("Application No");
                // Visible = true;
            }
            action("Administrative Tasks")
            {
                ApplicationArea = Basic;
                Enabled = true;
                Image = Task;
                Promoted = true;
                PromotedCategory = Category4;
                // RunObject = Page "Grant Admin Tasks List";
                // RunPageLink = "Source Document No." = field("Application No");
                // Visible = true;
            }
            action("Secondary  Programs")
            {
                ApplicationArea = Basic;
                Image = TeamSales;
                Promoted = true;
                PromotedCategory = Category5;
                // RunObject = Page "Secondary Research Programs";
                // RunPageLink = "GFA No" = field("Application No"),
                //               "Research Center" = field("Research Center");
            }
            separator(Action61)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::Open);//status must be open.
                    Rec.TestField(Rec."Created By", UserId); //control so that only the initiator of the document can send for approval
                    //  if ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) then
                    //   ApprovalsMgmt.OnSendGFAForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                    Rec.TestField(Rec."Created By", UserId); //control so that only the initiator of the document can send for approval
                    //ApprovalsMgmt.""(Rec);
                end;
            }
            separator(Action65)
            {
            }
            action("Research Approval Committees")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                // RunObject = Page "GFO Approval Comm Entry List";
                // RunPageLink = "Grant Funding Application Id" = field("Application No");
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            separator(Action57)
            {
            }
            action("Print Grant Proposal")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec."Application No", Rec."Application No");
                    Report.Run(65021, true, true, Rec)
                end;
            }
            action("Send Grant Proposal")
            {
                ApplicationArea = Basic;
                Image = SendAsPDF;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Message('Send Summary to research team');
                end;
            }
            action("Effort & Payroll Matrix list")
            {
                ApplicationArea = Basic;
                Caption = 'Payroll Effort & Payroll Matrix list';
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Effort & Payroll Matrix list";
                RunPageLink = "Project No" = field("No. Series");
                Visible = false;
            }
            action("Colaborators & Partners")
            {
                ApplicationArea = Basic;
                Image = BreakpointsList;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                // RunObject = Page "Collaborators & Partners";
                // RunPageLink = "GFA No." = field("Application No");
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    // DMSManagement.UploadGrantFundingProposalDocuments(Rec."Application No",'Grand Proposal',Rec.RecordId);
                end;
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}
