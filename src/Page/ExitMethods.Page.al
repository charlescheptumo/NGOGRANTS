#pragma implicitwith disable
page 69834 "Exit Methods"
{
    PageType = List;
    SourceTable = "Exit Methods";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

