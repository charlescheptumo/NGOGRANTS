report 50017 "Performance Review"
{
    ApplicationArea = All;
    Caption = 'Performance Review';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(PerfomanceEvaluation; "Perfomance Evaluation")
        {
            column(AnnualReportingCode; "Annual Reporting Code")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(SupervisorName; "Supervisor Name")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
