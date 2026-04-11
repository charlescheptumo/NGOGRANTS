#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 65023 "Payroll FTE Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll FTE Report.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Effort & Payroll Matrix"; "Effort & Payroll Matrix")
        {
            RequestFilterFields = "Project No", "Starting Pay Period";
            column(ReportForNavId_1; 1)
            {
            }
            column(ProjectNo_EffortPayrollMatrix; "Effort & Payroll Matrix"."Project No")
            {
            }
            column(ResourceID_EffortPayrollMatrix; "Effort & Payroll Matrix"."Resource ID")
            {
            }
            column(EmployeeNo_EffortPayrollMatrix; "Effort & Payroll Matrix"."Employee No")
            {
            }
            column(EmployeeName_EffortPayrollMatrix; "Effort & Payroll Matrix"."Employee Name")
            {
            }
            column(ProjectPosition_EffortPayrollMatrix; "Effort & Payroll Matrix"."Project Position")
            {
            }
            column(FTEEffort_EffortPayrollMatrix; "Effort & Payroll Matrix"."FTE Effort (%)")
            {
            }
            column(PayrollEarningCode_EffortPayrollMatrix; "Effort & Payroll Matrix"."Payroll Earning Code")
            {
            }
            column(EarningDescription_EffortPayrollMatrix; "Effort & Payroll Matrix"."Earning Description")
            {
            }
            column(FTEAnnualEarningAmount_EffortPayrollMatrix; "Effort & Payroll Matrix"."FTE Annual Earning Amount")
            {
            }
            column(MonthlyEarnedAmount_EffortPayrollMatrix; "Effort & Payroll Matrix"."Monthly Earned Amount")
            {
            }
            column(StartingPayPeriod_EffortPayrollMatrix; "Effort & Payroll Matrix"."Starting Pay Period")
            {
            }
            column(EndingPayPeriod_EffortPayrollMatrix; "Effort & Payroll Matrix"."Ending Pay Period")
            {
            }
            column(LastPayrollRunPeriod_EffortPayrollMatrix; "Effort & Payroll Matrix"."Last Payroll Run Period")
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

    var
        StartDate: Date;
        EndDate: Date;
        JobOpeningBalance: Decimal;
        Projects: Record Job;
        Receipt: Record "Receipts Header1";
        JobLedgerEntry: Record "Job Ledger Entry";
        JobPlanningLine: Record "Job Planning Line";
        Commitment: Record "Commitment Entries1";
        BudgetedAmount: Decimal;
        ActualAmount: Decimal;
        CommitmentAmount: Decimal;
        ReceiptsH: Record "Receipts Header1";
        ReceiptAmount: Decimal;
        ReceiptsPlusBalance: Decimal;
}
