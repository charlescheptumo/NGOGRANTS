report 70059 "Procurement categories"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Procurement categories.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("Procurement Category"; "Procurement Category")
        {
            column(Code_ProcurementCategory; "Procurement Category".Code)
            {
            }
            column(Description_ProcurementCategory; "Procurement Category".Description)
            {
            }
            column(COMPANY; CompanyInf.Name)
            {
            }
            column(LOGO; CompanyInf.Picture)
            {
            }
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

    trigger OnPreReport()
    begin
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
    end;

    var
        CompanyInf: Record "Company Information";
}

