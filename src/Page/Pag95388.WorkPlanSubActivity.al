page 95388 "WorkPlan Sub Activity"
{
    ApplicationArea = All;
    Caption = 'WorkPlan Sub Activity';
    PageType = Card;
    SourceTable = "WorkPlan Sub Activities";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Sub Activity ID"; Rec."Sub Activity ID")
                {
                    ToolTip = 'Specifies the value of the Sub Activity ID field.';
                }
                field("Sub Activity Description"; Rec."Sub Activity Description")
                {
                    ToolTip = 'Specifies the value of the Sub Activity Description field.';
                }
            }
        }
    }
}
