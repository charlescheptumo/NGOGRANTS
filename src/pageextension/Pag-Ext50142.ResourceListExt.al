pageextension 50142 "Resource List Ext" extends "Resource List"
{
    actions
    {
        
        addafter("Create Time Sheets")
        {
            action("Create Timesheets 2")
            {
                ApplicationArea = All;
                Caption = 'Create Timesheets';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible=false;
                RunObject = Report "Create Time Sheets 2";
                Image = Timesheet;
            }
        }
    }
}
