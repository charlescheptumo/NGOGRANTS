#pragma implicitwith disable
page 69833 "Exit Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Exit Plan Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                }
                field("Primary Directorate Name"; Rec."Primary Directorate Name")
                {
                }
                field("Primary Department"; Rec."Primary Department")
                {
                }
                field("Primary Department Name"; Rec."Primary Department Name")
                {
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                }
                field("Planned Date"; Rec."Planned Date")
                {
                }
                field("Actual Date"; Rec."Actual Date")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("cleared By"; Rec."cleared By")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

