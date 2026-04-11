#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65099 "All Grant Funding App Card"
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
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(OpportunityTitle; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CallType; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GrantType; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
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
                field(GrantorNo; Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorName; Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
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
                field(GrantorResearchContactID; Rec."Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorResearchReviewer; Rec."Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GrantorAdminContactID; Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorAdminName; Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GrantorFinanceContactID; Rec."Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorFinanceContact; Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
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
        }
    }

    var
        ChangeExchangeRate: Page 511;
}
