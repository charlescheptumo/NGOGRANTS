report 69630 "Updating Employee Dates"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Updating Employee Dates.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem(Employee; Employee)
        {

            trigger OnAfterGetRecord()
            begin
                Employee.Validate("Birth Date");
                Employee.Modify;
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
}

