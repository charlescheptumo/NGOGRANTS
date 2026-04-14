#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65011 "Research Project Area Card"
{
    PageType = Card;
    caption = 'Operations Project Area';
    SourceTable = "Research Project Area";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ProgramID; Rec."Research Program ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(ProgramName; Rec."Program Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProjectAreaDescription; Rec."Project Area Description")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup9)
            {
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                }
                action("Projects Profile")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Job List";
                    //  RunPageLink = "Research Project Area" = field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
