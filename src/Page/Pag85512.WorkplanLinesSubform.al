page 85512 "Workplan Lines Subform"
{
    Caption = 'Workplan Lines Subform';
    PageType = ListPart;
    SourceTable = "Workplan Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Work Plan No"; Rec."Work Plan No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work Plan No field.';
                    // editable=false;
                }
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Code field.';
                    // editable=false;
                }

                field("Outcome Description"; Rec."Outcome Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Description field.';
                }
                field("Output Code"; Rec."Output Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Output Code field.';
                    // editable=false;
                }
                field("Output Description"; Rec."Output Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Description field.';
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity ID field.';

                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                    editable = false;
                }
                field("Sub Activity ID"; Rec."Sub Activity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Activity ID field.';
                }
                field("Sub Activity Description"; Rec."Sub Activity Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Implementing Partner"; Rec."Implementing Partner")
                {
                    ApplicationArea = All;
                }
                field("Implementing Partner Name"; Rec."Implementing Partner Name")
                {
                    ApplicationArea = All;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Annual Reporting Code field.';
                }
                field("Quarterly Period Code"; Rec."Quarterly Period Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quarterly Period Code field.';
                }
                field("Reporting Code Type"; Rec."Reporting Code Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reporting Code Type field.';
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
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field("Utilized Funds"; Rec."Utilized Funds")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Utilized Funds field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance  field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comments field.';
                }

            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Funding Sources")
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                ToolTip = 'Executes the Workplan Outputs.';
                RunObject = Page "Workplan Funding Sources";
                RunPageLink = "Work Plan No" = field("Work Plan No");

                // trigger OnAction()
                // begin
                //     Rec.Reset;
                //     Rec.SetRange("Work Plan No", Rec."Work Plan No");
                //     // Page.Run(85514, true, true, Rec);
                //     Page.Run(85514, Rec);

                // end;
            }

        }
    }
}
