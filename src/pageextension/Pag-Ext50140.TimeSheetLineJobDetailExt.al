pageextension 50140 "Time Sheet Line Job Detail Ext" extends "Time Sheet Line Job Detail"
{
    Caption = 'Time Sheet Line Project Detail';
    layout
    {
        modify("Job No.")
        {
            Caption = 'Project No';
        }
        modify("Job Task No.")
        {
            Caption = 'Project Task No';
        }
    }
}
