page 95401 "Approved Award Addendums"
{
    ApplicationArea = All;
    Caption = 'Approved Award Addendums';
    PageType = List;
    SourceTable = "Award Extension";
    CardPageId = "Approved Award Addendum";
    SourceTableView = sorting("No.") order(descending) where(Status = const(Approved), Extended = const(false));
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

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
                field("Award No"; Rec."Award No")
                {
                    ToolTip = 'Specifies the value of the Sub Award No field.';
                }
                field("Award Start Date"; Rec."Award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award Start Date field.';
                }
                field("Award End Date"; Rec."Award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub Award End Date field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }
                field("Extended By"; Rec."Extended By")
                {
                    ToolTip = 'Specifies the value of the Extended By field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ToolTip = 'Specifies the value of the Additional Budget field.';
                }
            }
        }

    }
}
