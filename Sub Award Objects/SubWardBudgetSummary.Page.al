page 65169 "Sub Ward Budget Summary"
{
    ApplicationArea = All;
    Caption = 'Sub Award Budget Summary';
    PageType = ListPart;
    SourceTable = "Sub Award Budget Summary";

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
                field("Budget Category"; Rec."Budget Category")
                {
                    ToolTip = 'Specifies the value of the Budget Category field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ToolTip = 'Specifies the value of the Amount LCY field.';
                }
            }
        }
    }
}
