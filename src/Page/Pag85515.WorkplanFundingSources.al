page 85515 "Workplan Funding Sources"
{
    ApplicationArea = All;
    Caption = 'Workplan Funding Sources';
    PageType = List;
    SourceTable = "Workplan Funding Source";
    UsageCategory = Lists;
    InsertAllowed = true;
    
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
                }
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outcome Code field.';
                }
                field("Output Code"; Rec."Output Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Output Code field.';
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field("Sub Activity ID"; Rec."Sub Activity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Activity ID field.';
                }
                field("Implementing Partner"; Rec."Implementing Partner")
                {
                    ApplicationArea = All;
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
            }
        }
    }
}
