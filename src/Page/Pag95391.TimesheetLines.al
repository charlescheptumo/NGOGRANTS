page 95391 "Timesheet Lines"
{
    ApplicationArea = All;
    Caption = 'Timesheet Lines';
    PageType = ListPart;
    SourceTable = "Timesheet Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Timesheet Header No"; Rec."Timesheet Header No")
                {
                    ToolTip = 'Specifies the value of the Timesheet Header No field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(job; Rec.Project)
                {
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the Customer.';
                    Caption = 'Donor';
                }
                field("Directorate"; Rec."Directorate")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field("Department"; Rec."Department")
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    ToolTip = 'Specifies the value of the Responsible Employee field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Day; Rec.Day)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Day field.';
                }
                field("Day Option"; Rec."Day Option")
                {
                    ToolTip = 'Specifies the value of the Day field.';
                    Visible = false;
                }
                field("Non-working"; Rec."Non-working")
                {
                    ToolTip = 'Specifies the value of the Non-working field.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date Description"; Rec."Date Description")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Total Hours"; Rec."Total Hours")
                {
                    ToolTip = 'Specifies the value of the Total Hours field.';
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
