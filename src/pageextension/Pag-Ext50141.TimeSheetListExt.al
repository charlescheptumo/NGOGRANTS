pageextension 50141 "Time Sheet List Ext" extends "Time Sheet List"
{
    actions
    {
        modify("Create Time Sheets")
        {
            Visible = false;
        }
        addafter("Create Time Sheets")
        {
            action("Create Timesheets 2")
            {
                ApplicationArea = All;
                Caption = 'Create Timesheets';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Report "Create Timesheets";
                Image = Timesheet;
            }
        }
    }
}

