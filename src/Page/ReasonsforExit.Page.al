#pragma implicitwith disable
page 69835 "Reasons for Exit"
{
    PageType = List;
    SourceTable = "Reasons for Exit";
    ApplicationArea = all;

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

