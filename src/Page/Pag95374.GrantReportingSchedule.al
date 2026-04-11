page 95374 "Grant Reporting Schedule"
{
    ApplicationArea = All;
    Caption = 'Grant Reporting Schedule';
    PageType = ListPart;
    SourceTable = "Grant Reporting Schedule";

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
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Report Type Detailed"; Rec."Report Type Detailed")
                {

                }
                field("Reporting Period"; Rec."Reporting Period")
                {

                }

                field("Reporting Duration"; Rec."Reporting Duration")
                {
                    ToolTip = 'Specifies the value of the Reporting Duration field.';
                }
                field("Duration Due to Report"; Rec."Duration Due to Report")
                {
                    ToolTip = 'Specifies the value of the Duration Due to Report field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Due Date to Report"; Rec."Due Date to Report")
                {
                    ToolTip = 'Specifies the value of the Due Date to Report field.';
                }
                field("Report Due Date Narration"; Rec."Report Due Date Narration")
                {

                }
            }
        }
    }
}
