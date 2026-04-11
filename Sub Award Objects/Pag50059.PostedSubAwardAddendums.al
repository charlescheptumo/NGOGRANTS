page 50059 "Posted Sub Award Addendums"
{
    ApplicationArea = All;
    Caption = 'Posted Sub Award Addendums';
    PageType = List;
    SourceTable = "Sub Contract Extension Voucher";
    UsageCategory = Lists;
    CardPageId = "Posted Sub Award Addendum";
    SourceTableView = sorting("No.") order(descending) where(Status = const(Approved), Extended = const(true));
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Sub Award No"; Rec."Sub Award No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Award No field.';
                }
                field("Amendment No"; Rec."Amendment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amendment No field.';
                }
                field("Sub Award  Name"; Rec."Sub Award  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Award  Name field.';
                }
                field("Award No"; Rec."Award No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award No field.';
                }
                field("Sub Award Start Date"; Rec."Sub Award Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Award Start Date field.';
                }
                field("Sub Award End Date"; Rec."Sub Award End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Award End Date field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }
                field("Extend to Date"; Rec."Extend to Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extend to Date field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Budget field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
            }
        }
    }
}
