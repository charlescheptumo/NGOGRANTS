page 65167 "Sub Award Objectives"
{
    ApplicationArea = All;
    Caption = 'Sub Award Objectives';
    PageType = ListPart;
    SourceTable = "Sub Award Objectives";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
            }
        }
    }
}
