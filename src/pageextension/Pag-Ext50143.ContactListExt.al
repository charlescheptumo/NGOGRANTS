pageextension 50143 "Contact List Ext" extends "Contact List"
{
    layout
    {
        modify("Business Relation")
        {
            Caption = 'Organization Relation';
        }
        modify("Company Name")
        {
            Caption = 'Organization Name';
        }

        modify(Control128)
        {
            Visible = false;
        }
    }
    actions
    {
        modify("Sales Cycle Analysis")
        {
            Visible = false;
        }
        modify(NewSalesQuote)
        {
            Visible = false;
        }
        modify("Open Oppo&rtunities")
        {
            Visible = false;
        }
        modify("Closed Oppo&rtunities")
        {
            Visible = false;
        }
        modify("Create Opportunity")
        {
            Visible = false;
        }
    }
}
