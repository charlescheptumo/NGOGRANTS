#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65022 "Research Authorship Card"
{
    PageType = Card;
    SourceTable = "Research Output Authorship";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ResearchOutputId; Rec."Research Output Id")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorNo; Rec."Author No")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorName; Rec."Author Name")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorContribution; Rec."Author Contribution(%)")
                {
                    ApplicationArea = Basic;
                }
                field(AuthorCategory; Rec."Author Category")
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
