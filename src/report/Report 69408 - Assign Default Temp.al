report 69408 "Assign Default Temp"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Assign Default Temp.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("Temporary Employee"; "Temporary Employee")
        {

            trigger OnAfterGetRecord()
            begin
                //IF CONFIRM(Text000,FALSE) THEN
                PayrollRun.DefaultAssignment("Temporary Employee");
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
        PayrollRun: Report "Payroll Run Temp";
}

