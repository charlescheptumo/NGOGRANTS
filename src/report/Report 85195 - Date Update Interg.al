report 85195 "Date Update Interg"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Date Update Interg.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("MPESA Integration Table"; "MPESA Integration Table")
        {
            column(MPESATXND_MPESAIntegrationTable; "MPESA Integration Table".MPESA_TXN_D)
            {
            }

            trigger OnAfterGetRecord()
            begin
                NewDate := DT2Date("MPESA Integration Table".MPESA_TXN_DATE);
                "MPESA Integration Table".MPESA_TXN_D := NewDate;
                "MPESA Integration Table".Modify(true);
            end;
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

    var
        NewDate: Date;
}

