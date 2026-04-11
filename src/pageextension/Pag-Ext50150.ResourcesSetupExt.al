pageextension 50150 "Resources Setup Ext" extends "Resources Setup"
{
    layout
    {
        addlast(Numbering)
        {

            field("Daily Workhours"; Rec."Daily Workhours")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Daily Workhours field.';
            }
        }
    }
}
