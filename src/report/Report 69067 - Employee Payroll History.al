report 69067 "Employee Payroll History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Payroll History.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
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
}

