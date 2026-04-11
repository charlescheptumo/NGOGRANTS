page 95379 "Workplan Activities"
{
    ApplicationArea = All;
    Caption = 'Workplan Activities';
    PageType = List;
    SourceTable = "Workplan Activites";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Workplan No."; Rec."Workplan No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Outcome Code"; Rec."Outcome Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Code field.';
                }
                field("Outcome Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Output Code"; Rec."Output Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Output Code field.';
                }
                field("Output Decription"; Rec."Output Decription")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Output Decription field.';
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
                }
                field("Sub Activity ID"; Rec."Sub Activity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field("Sub Activity Description"; Rec."Sub Activity Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
            }
        }
    }
}
