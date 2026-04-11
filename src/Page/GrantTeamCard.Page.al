#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65156 "Grant Team Card"
{
    PageType = Card;
    SourceTable = "Grant Teams";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(TeamCode; Rec."Team Code")
                {
                    ApplicationArea = Basic;
                }
                field(TeamDescription; Rec."Team Description")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control5; "Grant Admin Team")
            {
                //  SubPageLink = "GFA No" = field("Team Code");
            }
        }
    }

    actions
    {
    }
}
