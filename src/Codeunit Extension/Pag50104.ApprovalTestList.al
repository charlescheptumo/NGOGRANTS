page 90000 "Approval Test List"
{
    ApplicationArea = All;
    Caption = 'Approval Test List';
    PageType = List;
    SourceTable = "Approval Test";
    UsageCategory = Lists;
    CardPageId = "Approval Test Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Approval status"; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Approval status field.';
                }
            }
        }
    }
}
