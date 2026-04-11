page 95380 "Workplan Outputs"
{
    ApplicationArea = All;
    Caption = 'Workplan Outputs';
    PageType = List;
    SourceTable = "Workplan Outcome Setup";
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
                    ToolTip = 'Specifies the value of the Outcome Code field.';
                }
                field("Outcome Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outcome Description field.';
                }
                field("Output Code"; Rec."Output Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Code field.';
                }
                field("Output Decription"; Rec."Output Decription")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Decription field.';
                }
                // field("Activity ID"; Rec."Activity ID")
                // {
                //     ToolTip = 'Specifies the value of the Activity ID field.';
                // }
                // field("Activity Description"; Rec."Activity Description")
                // {
                //     ToolTip = 'Specifies the value of the Activity Description field.';
                // }
            }
        }
    }
}
