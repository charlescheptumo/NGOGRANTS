pageextension 50151 "Accounting Period Ext" extends "Accounting Periods"
{
    layout
    {
        modify(Closed)
        {
            Visible = true;
            Editable = true;


        }
        modify("Date Locked")
        {
            Visible = true;
            Editable = true;

        }

    }
}
