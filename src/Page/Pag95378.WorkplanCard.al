page 95378 "Workplan Card"
{
    Caption = 'Workplan Card';
    PageType = Card;
    SourceTable = "Workplan Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Workplan Year"; Rec."Workplan Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan Year field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }

                field("Global Dimension Dim 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension Dim 1 Code field.';
                }
                field("Global Dimension  Dim 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension  Dim 2 Code field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }

            }
            part(Control24; "Workplan Lines Subform")
            {
                SubPageLink = "Work Plan No" = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Workplan Outputs")
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Workplan Outputs.';
                RunObject = Page "Workplan Outputs";
                RunPageLink = "Workplan No." = field("Document No.");
            }
            action("Workplan Activities")
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Workplan Activities.';
                RunObject = Page "Workplan Activities";
                RunPageLink = "Workplan No." = field("Document No.");
            }
            // action("Workplan Sub Activities")
            // {
            //     ApplicationArea = Basic;
            //     Image = Dimensions;
            //     ToolTip = 'Executes the Workplan Sub Activities.';
            //     RunObject = Page "WorkPlan Sub Activities";
            //     RunPageLink = "Workplan No."=field("Document No.");
            // }
        }
    }
}
