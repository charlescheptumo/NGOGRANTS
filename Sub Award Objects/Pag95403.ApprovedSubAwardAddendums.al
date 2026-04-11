page 95403 "Approved Sub Award Addendums"
{
    ApplicationArea = All;
    Caption = 'Approved Sub Award Addendums';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Sub Contract Extension Voucher";
    CardPageId = "Approved Sub Award Addendum";
    SourceTableView = sorting("No.") order(descending) where(Status = const(Approved), Extended = const(false));


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Sub Award No"; Rec."Sub Award No")
                {
                    ToolTip = 'Specifies the value of the Sub Award No field.';
                }
                field("Sub Award  Name"; Rec."Sub Award  Name")
                {
                    ToolTip = 'Specifies the value of the Sub Award  Name field.';
                }
                field("Award No"; Rec."Award No")
                {
                    ToolTip = 'Specifies the value of the Award No field.';
                }
                field("Sub Award Start Date"; Rec."Sub Award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award Start Date field.';
                }
                field("Sub Award End Date"; Rec."Sub Award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award End Date field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }
                field("Extend to Date"; Rec."Extend to Date")
                {
                    ToolTip = 'Specifies the value of the Extend to Date field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ToolTip = 'Specifies the value of the Additional Budget field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
