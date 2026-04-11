page 65196 "Budget Categories"
{
    ApplicationArea = All;
    Caption = 'Budget Categories';
    PageType = List;
    SourceTable = "Budget Category";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Class Category"; Rec."Class Category")
                {
                    ToolTip = 'Specifies the value of the Class Category field.';
                }
            }
        }
    }
}
