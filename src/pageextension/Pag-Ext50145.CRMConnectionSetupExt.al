pageextension 50145 "CRM Connection Setup Ext" extends "CRM Connection Setup"
{
    layout
    {
        modify("User Name")
        {
            Visible = true;
        }
        modify("Auto Create Sales Orders")
        {
            Visible = false;
        }
        modify("Is S.Order Integration Enabled")
        {
            Visible = false;
        }
        modify("Auto Process Sales Quotes")
        {
            Visible = false;
        }
        modify("Bidirectional Sales Order Int.")
        {
            Visible = false;
        }
        modify("Server Address")
        {
            Caption = 'Dynamics Resource Mobilization URL';
        }
        modify(NAVToCRM)
        {
            Caption = 'Connection from Dynamics 365 Business Central to Dynamics Resource Mobilization';
        }
        modify(CRMSettings)
        {
            Caption = 'Dynamics Resource Mobilization Settings';
        }
    }
    actions
    {
        modify(CoupleUsers)
        {
            Caption = 'Couple Users';
        }
    }
}
