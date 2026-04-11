page 95373 "Grant Payment Schedule"
{
    ApplicationArea = All;
    Caption = 'Grant Payment Schedule';
    PageType = ListPart;
    SourceTable = "Grant Payment Schedule";

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
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ToolTip = 'Specifies the value of the Milestone Code field.';
                }
                field("Milestone Description"; Rec."Milestone Description")
                {
                    ToolTip = 'Specifies the value of the Milestone Description field.';
                }
                field("Notification Period"; Rec."Notification Period")
                {
                    ToolTip = 'Specifies the value of the Notification Period field.';
                }
                field("Milestone Start Date"; Rec."Milestone Start Date")
                {
                    ToolTip = 'Specifies the value of the Milestone Start Date field.';
                }
                field("Milestone End Date"; Rec."Milestone End Date")
                {
                    ToolTip = 'Specifies the value of the Milestone End Date field.';
                }
                field("Milestone Status"; Rec."Milestone Status")
                {
                    ToolTip = 'Specifies the value of the Milestone Status field.';
                }
                field(Disbursement; Rec.Disbursement)
                {

                }
                field("Payment tranche"; Rec."Payment tranche")
                {

                }
            }
        }
    }
}
