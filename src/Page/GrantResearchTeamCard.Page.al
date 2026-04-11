#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65037 "Grant Research Team Card"
{
    PageType = Card;
    SourceTable = "Grant Research Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(GrantOpportunityID; Rec."Grant Opportunity ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GrantName; Rec."Grant Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ResearcherID; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PrimaryRole; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field(LeadRole; Rec."Lead Role")
                {
                    ApplicationArea = Basic;
                }
                field(RoleDescription; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Grantor; Rec.Grantor)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(FundingDecision; Rec."Funding Decision")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RequestedAmountLCY; Rec."Requested Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AwardedAmountLCY; Rec."Awarded Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}
