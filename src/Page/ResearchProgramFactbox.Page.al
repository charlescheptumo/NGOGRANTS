#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65069 "Research Program Factbox"
{
    PageType = CardPart;
    SourceTable = "Research Program";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Code"; Rec.Code)
            {
                ApplicationArea = Basic;
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = Basic;
            }
            field(NoofProjectAreas; Rec."No. of Project Areas")
            {
                ApplicationArea = Basic;
            }
            field(NoofAwardedGrants; Rec."No. of Awarded GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Awarded Grants';
                Style = AttentionAccent;
                StyleExpr = true;
            }
            field(NoofLostGrantGrants; Rec."No. of Lost Grant GFO")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Lost Grant Grants';
            }
            field(NoofOngoingProjects; Rec."No. of Ongoing RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Ongoing Projects';
            }
            field(NoofCompletedProjects; Rec."No. of Completed RProjects")
            {
                ApplicationArea = Basic;
                Caption = 'No. of Completed Projects';
            }
            field(TotalAmountAwardedLCY; Rec."Total Amount Awarded(LCY)")
            {
                ApplicationArea = Basic;
                Style = AttentionAccent;
                StyleExpr = true;
            }
        }
    }

    actions
    {
    }
}
