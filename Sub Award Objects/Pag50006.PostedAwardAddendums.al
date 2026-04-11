page 50006 "Posted Award Addendums"
{
    ApplicationArea = All;
    Caption = 'Posted Award Addendums';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Award Extension";
    CardPageId = "Posted Award Addendum";
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
                field("Amendment No"; Rec."Amendment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amendment No field.';
                }
                field("Award No"; Rec."Award No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award No field.';
                }
                field("Donor Name"; Rec."Donor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field("Award Description"; Rec."Award Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Description field.';
                }
                field("Award Start Date"; Rec."Award Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award Start Date field.';
                }
                field("Award End Date"; Rec."Award End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award End Date field.';
                }
                field("Extension Type"; Rec."Extension Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extension Type field.';
                }

                field("Extended By"; Rec."Extended By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extended By field.';
                }
                field("Extend to Date"; Rec."Extend to Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extend to Date field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Additional Budget"; Rec."Additional Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Budget field.';
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
