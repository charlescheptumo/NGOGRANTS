query 80054 "HR Leave Ledger Entries"
{
    Caption = 'HR Leave Ledger Entries';
    elements
    {
        dataitem(HRLeaveLedgerEntries; "HR Leave Ledger Entries")
        {
            column(EntryNo; "Entry No.")
            {
            }
            column(LeavePeriod; "Leave Period")
            {
            }
            column(Closed; Closed)
            {
            }
            column(StaffNo; "Staff No.")
            {
            }
            column(StaffName; "Staff Name")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(LeaveEntryType; "Leave Entry Type")
            {
            }
            column(LeaveApprovalDate; "Leave Approval Date")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(JobID; "Job ID")
            {
            }
            column(JobGroup; "Job Group")
            {
            }
            column(ContractType; "Contract Type")
            {
            }
            column(Noofdays; "No. of days")
            {
            }
            column(LeaveStartDate; "Leave Start Date")
            {
            }
            column(LeavePostingDescription; "Leave Posting Description")
            {
            }
            column(LeaveEndDate; "Leave End Date")
            {
            }
            column(LeaveReturnDate; "Leave Return Date")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(UserID; "User ID")
            {
            }
            column(SourceCode; "Source Code")
            {
            }
            column(JournalBatchName; "Journal Batch Name")
            {
            }
            column(ReasonCode; "Reason Code")
            {
            }
            column(IndexEntry; "Index Entry")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(LeaveRecalledNo; "Leave Recalled No.")
            {
            }
            column(LeaveType; "Leave Type")
            {
            }
            column(BalanceBroughtFoward; "Balance Brought Foward")
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(LeavePostingType; "Leave Posting Type")
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
