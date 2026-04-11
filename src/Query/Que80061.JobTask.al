query 80061 "Job Task"
{
    Caption = 'Project Activity';

    elements
    {
        dataitem(JobTask; "Job Task")
        {
            column(JobNo; "Job No.")
            {
            }
            column(JobTaskNo; "Job Task No.")
            {
            }
            column(Description; Description)
            {
            }
            column(JobTaskType; "Job Task Type")
            {
            }
            column(WIPTotal; "WIP-Total")
            {
            }
            column(JobPostingGroup; "Job Posting Group")
            {
            }
            column(WIPMethod; "WIP Method")
            {
            }
            column(ScheduleTotalCost; "Schedule (Total Cost)")
            {
            }
            column(ScheduleTotalPrice; "Schedule (Total Price)")
            {
            }
            column(UsageTotalCost; "Usage (Total Cost)")
            {
            }
            column(UsageTotalPrice; "Usage (Total Price)")
            {
            }
            column(ContractTotalCost; "Contract (Total Cost)")
            {
            }
            column(ContractTotalPrice; "Contract (Total Price)")
            {
            }
            column(ContractInvoicedPrice; "Contract (Invoiced Price)")
            {
            }
            column(ContractInvoicedCost; "Contract (Invoiced Cost)")
            {
            }
            column(Totaling; Totaling)
            {
            }
            column(NewPage; "New Page")
            {
            }
            column(NoofBlankLines; "No. of Blank Lines")
            {
            }
            column(Indentation; Indentation)
            {
            }
            column(RecognizedSalesAmount; "Recognized Sales Amount")
            {
            }
            column(RecognizedCostsAmount; "Recognized Costs Amount")
            {
            }
            column(RecognizedSalesGLAmount; "Recognized Sales G/L Amount")
            {
            }
            column(RecognizedCostsGLAmount; "Recognized Costs G/L Amount")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(OutstandingOrders; "Outstanding Orders")
            {
            }
            column(AmtRcdNotInvoiced; "Amt. Rcd. Not Invoiced")
            {
            }
            column(RemainingTotalCost; "Remaining (Total Cost)")
            {
            }
            column(RemainingTotalPrice; "Remaining (Total Price)")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(LPOCommitments; "LPO Commitments")
            {
            }
            column(PRNCommitments; "PRN Commitments")
            {
            }
            column(TransactionCodes; "Transaction Codes")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(Division; Division)
            {
            }
            column(Commitments; Commitments)
            {
            }
            column(StartPointKm; "Start Point(Km)")
            {
            }
            column(EndPointKm; "End Point(Km)")
            {
            }
            column(FundingSource; "Funding Source")
            {
            }
            column(ProcurementMethod; "Procurement Method")
            {
            }
            column(SurfaceTypes; "Surface Types")
            {
            }
            column(RoadCondition; "Road Condition")
            {
            }
            column(CompletedLengthKm; "Completed Length(Km)")
            {
            }
            column(ExaminationType; "Examination Type")
            {
            }
            column(LineNo; "Line No")
            {
            }
            column(Blocked; Blocked)
            {
            }
            column(StartingDate; "Starting Date")
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
