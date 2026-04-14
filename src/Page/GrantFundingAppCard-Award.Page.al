#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65063 "Grant Funding App Card-Award"
{
    DeleteAllowed = false;
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(OpportunityTitle; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                }
                field(CallType; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                field(GrantType; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field(JustificationforApplication; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field(OperationCenter; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryOperationProgramID; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryOperationArea; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field(PrincipalInvestigator; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                // field(GrantAdminTeamCode;Rec."Grant Admin Team Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field(ApplicationStatus; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ApprovalStatus; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
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
                }
            }
            group("Award Info")
            {
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
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
                field(RequestedGrantAmount; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field(RequestedGrantAmountLCY; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedGrantAmount; Rec."Awarded Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedGrantAmountLCY; Rec."Awarded Grant Amount (LCY)")
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
            group("Grantor Information")
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
                    Caption = 'FA  Research Reviewer';
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
                    Caption = 'FA  Finance Contact ID';
                }
                field(FAFinanceContact; Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                    Caption = 'FA  Finance Contact';
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
            action("Research Approval Committees")
            {
                ApplicationArea = Basic;
            }
            action("Grant Operation Objectives")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Research Objectives List";
                RunPageLink = "Grant Application ID" = field("Application No");
            }
            action("Proposed Grant Budget")
            {
                ApplicationArea = Basic;
                Image = CopyBudget;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Budget Summary List";
                RunPageLink = "Grant Application ID" = field("Application No");
            }
            separator(Action69)
            {
            }
            // action("Administrative Tasks")
            // {
            //     ApplicationArea = Basic;
            //     Image = Task;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Grant Admin Tasks List";
            //     RunPageLink = "Source Document No." = field("Application No");
            // }
            // action("Secondary  Programs")
            // {
            //     ApplicationArea = Basic;
            //     Image = TeamSales;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Secondary Research Programs";
            //     RunPageLink = "GFA No" = field("Application No"),
            //                   "Research Center" = field("Research Center");
            // }
            separator(Action64)
            {
            }
            separator(Action60)
            {
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Visible = false;

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
            separator(Action58)
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
                PromotedCategory = Process;
                RunObject = Page "Effort & Payroll Matrix list";
                RunPageLink = "Project No" = field("No. Series");
            }
            separator(Action59)
            {
            }
            action("Research Teams")
            {
                ApplicationArea = Basic;
                Image = Task;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Grant Research Team list";
                RunPageLink = "Grant Opportunity ID" = field("Application No");
                Visible = true;
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
                    //   DMSManagement.UploadGrantFundingApplicationDocuments(Rec."Application No",'Grand Application',Rec.RecordId);
                end;
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}
