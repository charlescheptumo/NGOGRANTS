page 95384 "Output Setup"
{
    ApplicationArea = All;
    Caption = 'Output Setup';
    PageType = Card;
    SourceTable = "Output Setup";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Output Code"; Rec."Output Code")
                {
                    ToolTip = 'Specifies the value of the Output Code field.';
                }
                field("Output Description"; Rec."Output Description")
                {
                    ToolTip = 'Specifies the value of the Output Description field.';
                }
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
