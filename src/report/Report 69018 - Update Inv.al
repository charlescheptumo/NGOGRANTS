report 69018 "Update Inv"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Inv.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("Purchase Line"; "Purchase Line")
        {
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

