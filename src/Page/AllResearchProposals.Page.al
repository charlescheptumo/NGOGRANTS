#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65098 "All Research Proposals"
{
    CardPageID = "All Grant Funding App Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Grant Funding Application";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ApplicationNo; Rec."Application No")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(FOAID; Rec."FOA ID")
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
                field(RequestedGrantAmountLCY; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(AwardedGrantAmountLCY; Rec."Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                // field(GrantAdminTeamCode;Rec."Grant Admin Team Code")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}
