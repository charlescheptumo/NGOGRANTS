page 50106 "Contract Amendment"
{
    ApplicationArea = All;
    Caption = 'Contract Amendment Vouchers';
    PageType = List;
    SourceTable = "Award Extension";
    UsageCategory = Lists;
    CardPageId = "Award Addendum Card";
    SourceTableView = sorting("No.") order(descending) where(Status = filter(Open | "Pending approval"));

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
                field("Amendment No"; Rec."Amendment No")
                {
                    ToolTip = 'Specifies the value of the Amendment No field.';
                }
                field("Award No"; Rec."Award No")
                {
                    ToolTip = 'Specifies the value of the Sub Award No field.';
                }
                field("Donor Name"; Rec."Donor Name")
                {
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field("Award Description"; Rec."Award Description")
                {
                    ToolTip = 'Specifies the value of the Award Description field.';
                }
                field("Award Start Date"; Rec."Award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award Start Date field.';
                }
                field("Sub Award End Date"; Rec."Award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }
                field("Extended By"; Rec."Extended By")
                {
                    ToolTip = 'Specifies the value of the Extended By field.';
                }
                field("Extented On"; Rec."Extented On")
                {
                    ToolTip = 'Specifies the value of the Extented On field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ToolTip = 'Specifies the value of the Additional Budget field.';
                }
                field("Extend to Date"; Rec."Extend to Date")
                {
                    ToolTip = 'Specifies the value of the Extend to Date field.';
                }
            }
        }
    }
}
