#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65038 "Grant Research Team list"
{
    CardPageID = "Grant Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Research Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(GrantOpportunityID; Rec."Grant Opportunity ID")
                {
                    ApplicationArea = Basic;
                }
                field(ResearcherID; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryRole; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field(RoleDescription; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                }
                field(GrantName; Rec."Grant Name")
                {
                    ApplicationArea = Basic;
                }
                field(Grantor; Rec.Grantor)
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
