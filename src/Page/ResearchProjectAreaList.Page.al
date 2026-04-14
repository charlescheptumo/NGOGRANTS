#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65012 "Research Project Area List"
{
    CardPageID = "Research Project Area Card";
    Editable = false;
    caption = 'Operations Project Area List';
    PageType = List;
    SourceTable = "Research Project Area";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(ResearchProgramID; Rec."Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field(ProgramName; Rec."Program Name")
                {
                    ApplicationArea = Basic;
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
    }
}
