page 95387 "WorkPlan Sub Activities"
{
    ApplicationArea = All;
    Caption = 'WorkPlan Sub Activities';
    PageType = List;
    SourceTable = "WorkPlan Sub Activities";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
