page 95386 "Plan Activity"
{
    ApplicationArea = All;
    Caption = 'Plan Activity';
    PageType = Card;
    SourceTable = "Plan Activities";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                // field("Work Plan No."; Rec."Work Plan No.")
                // {
                //     ToolTip = 'Specifies the value of the Work Plan No field.';
                // }
                // field("Outcome No"; Rec."Outcome No")
                // {
                //     ToolTip = 'Specifies the value of the Outcome No field.';
                // }
                //  field("Outcome Description"; Rec."Outcome Description")
                // {
                //     ToolTip = 'Specifies the value of the Outcome Description field.';
                // }
                // field("Output No"; Rec."Output No")
                // {
                //     ToolTip = 'Specifies the value of the Output No field.';
                // }
                // field("Output Description"; Rec."Output Description")
                // {
                //     ToolTip = 'Specifies the value of the Output Description field.';
                // }
                
                field("Activity ID"; Rec."Activity ID")
                {
                    ToolTip = 'Specifies the value of the Activity ID field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                // field("Sub Activity ID"; Rec."Sub Activity ID")
                // {
                //     ToolTip = 'Specifies the value of the Sub Activity ID field.';
                // }                
                // field("Sub Activity Description"; Rec."Sub Activity Description")
                // {
                //     ToolTip = 'Specifies the value of the Sub Activity Description field.';
                // }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
