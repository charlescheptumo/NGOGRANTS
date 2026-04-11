page 65173 "Sub Award Services Provided"
{
    ApplicationArea = All;
    Caption = 'Sub Award Services Provided';
    PageType = ListPart;
    SourceTable = "Sub Award Services";

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
                field("Services Description"; Rec."Services Description")
                {
                    ToolTip = 'Specifies the value of the Services Description field.';
                }
            }
        }
    }
}
