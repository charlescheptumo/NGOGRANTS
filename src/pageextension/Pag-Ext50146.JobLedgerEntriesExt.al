pageextension 50146 "Job Ledger Entries Ext" extends "Job Ledger Entries"
{
    Caption = 'Project Ledger Entries';

    layout
    {
        modify("Job No.")
        {
            Caption = 'Project No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Project Activity No.';
        }
        modify("Work Type Code")
        {
            Visible = false;
        }
        modify("Unit Cost (LCY)")
        {
            Caption = 'Unit Cost (USD)';
        }
        modify("Total Cost (LCY)")
        {
            Caption = 'Total Cost (USD)';
        }
        modify("Unit Price")
        {
            Visible = false;
        }
        modify("Line Amount")
        {
            Visible = false;
        }
        modify("Line Discount %")
        {
            Visible = false;
        }
        modify("Line Discount Amount")
        {
            Visible = false;
        }
    }
}
