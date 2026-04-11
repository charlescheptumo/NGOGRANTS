#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65024 "Research Activities List"
{
    CardPageID = "Research Activities Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ResearchOutputID; Rec."Research Output ID")
                {
                    ApplicationArea = Basic;
                }
                field(ActivityID; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Rec.Priority)
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
