page 95389 Timesheets
{
    ApplicationArea = All;
    Caption = 'Timesheets';
    PageType = List;
    SourceTable = "Employee Timesheet";
    CardPageId = "Timesheet";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Timesheet Month"; Rec."Timesheet Month")
                {
                    ToolTip = 'Specifies the value of the Timesheet Month field.';
                }
                field("Current Year"; Rec."Current Year")
                {
                    ToolTip = 'Specifies the value of the Curent Year field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Date of Join"; Rec."Date of Join")
                {
                    ToolTip = 'Specifies the value of the Date of Join field.';
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
