#pragma implicitwith disable
page 75448 "Prequalification Category Ent"
{
    Caption = 'Prequalified Category';
    PageType = List;
    SourceTable = "Vendor Prequalification Entry";
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Category Code"; Rec."Procurement Category Code")
                {
                    Caption = 'Category Code';
                }
                field(Description; Rec.Description)
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
            }
            systempart(Control10; Notes)
            {
            }
            systempart(Control11; MyNotes)
            {
            }
            systempart(Control12; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

