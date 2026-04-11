query 80053 "Employee Ledger EntriesX"
{
    Caption = 'Employee Ledger EntriesX';
    elements
    {
        dataitem(EmployeeLedgerEntryX; "Employee Ledger EntryX")
        {
            column(Loan; Loan)
            {
            }
            column(Employee; Employee)
            {
            }
            column(RepaymentDate; "Repayment Date")
            {
            }
            column(Amount; Amount)
            {
            }
            column(PrincipalAmount; "Principal Amount")
            {
            }
            column(OutstandingAmount; "Outstanding Amount")
            {
            }
            column("Type"; "Type")
            {
            }
            column(Description; Description)
            {
            }
            column(BasicPay; "Basic Pay")
            {
            }
            column(IncomeTax; "Income Tax")
            {
            }
            column(PayrollPeriod; "Payroll Period")
            {
            }
            column(NetPay; "Net Pay")
            {
            }
            column(Quarters; Quarters)
            {
            }
            column(BfMpr; BfMpr)
            {
            }
            column(PostingGroup; "Posting Group")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
