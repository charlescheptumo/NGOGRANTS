#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65057 "Won Grants Opportunities"
{
    ApplicationArea = Basic;
    Caption = 'Won Grants Opportunities';
    CardPageID = "Closed Application Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Grant Funding Application";
    SourceTableView = where("Application Status"=const(Won));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ApplicationNo;Rec."Application No")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate;Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(FOAID;Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo;Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(OpportunityTitle;Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                }
                field(CallType;Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                field(GrantType;Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field(JustificationforApplication;Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchCenter;Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryResearchProgramID;Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryResearchArea;Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(PrincipalInvestigator;Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(RequestedGrantAmount;Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field(RequestedGrantAmountLCY;Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedGrantAmount;Rec."Awarded Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedGrantAmountLCY;Rec."Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationStatus;Rec."Application Status")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus;Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                // field(GrantAdminTeamCode;Rec."Grant Admin Team Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(ClosedDate;Rec."Closed Date")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorNo;Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorName;Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2;Rec.Address2)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;Rec."Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(MobilePhoneNo;Rec."Mobile Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorResearchContactID;Rec."Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorResearchReviewer;Rec."Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorAdminContactID;Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorAdminName;Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorFinanceContactID;Rec."Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantorFinanceContact;Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDueDate;Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationSubmittedDate;Rec."Application Submitted Date")
                {
                    ApplicationArea = Basic;
                }
                field(EstimatedAwardDate;Rec."Estimated Award Date")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyFactor;Rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
