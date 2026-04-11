page 65171 "Sub Award Mornitoring Schedule"
{
    ApplicationArea = All;
    Caption = 'Sub Award Monitoring Schedule';
    PageType = ListPart;
    SourceTable = "Sub Award Mornitoring Schedule";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Visit Code"; Rec."Visit Code")
                {
                    ToolTip = 'Specifies the value of the Visit Code field.';
                }
                field("Visiting Date"; Rec."Visiting Date")
                {
                    ToolTip = 'Specifies the value of the Visiting Date field.';
                }
                field("Focus Area"; Rec."Focus Area")
                {
                    ToolTip = 'Specifies the value of the Focus Area field.';
                }
                field("Report to Sub-grantee"; Rec."Report to Sub-grantee")
                {
                    ToolTip = 'Specifies the value of the Report to Sub-grantee field.';
                }
                field("Report to Donor"; Rec."Report to Donor")
                {
                    ToolTip = 'Specifies the value of the Report to Donor field.';
                }
            }
        }
    }
}
