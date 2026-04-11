page 50008 "Per Diem Rates International"
{
    ApplicationArea = All;
    Caption = 'Per Diem Rates International';
    PageType = List;
    SourceTable = "Per Diem Rates International";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Country Code"; Rec."Country Code")
                {
                    ToolTip = 'Specifies the value of the Country Code field.';
                }
                field("Area Code"; Rec."Area Code")
                {
                    ToolTip = 'Specifies the value of the Area Code field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("First 60 Days Amount"; Rec."First 60 Days Amount")
                {
                    ToolTip = 'Specifies the value of the First 60 Days Amount field.';
                }
                field("First 60 Days Amount (LCY)"; Rec."First 60 Days Amount (LCY)")
                {
                    ToolTip = 'Specifies the value of the First 60 Days Amount (LCY) field.';
                }
                field("More than 60 Days Amount"; Rec."More than 60 Days Amount")
                {
                    ToolTip = 'Specifies the value of the More than 60 Days Amount field.';
                }
                field("More than 60 Days Amount (LCY)"; Rec."More than 60 Days Amount (LCY)")
                {
                    ToolTip = 'Specifies the value of the > 60 Days (USD) field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Room as Percent of DSA"; Rec."Room as Percent of DSA")
                {
                    ToolTip = 'Specifies the value of the Room as Percent of DSA field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
            }
        }
    }
}
