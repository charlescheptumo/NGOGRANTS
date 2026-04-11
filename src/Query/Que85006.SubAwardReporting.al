query 85006 "Sub Award Reporting"
{
    Caption = 'Sub Award Reporting';

    elements
    {
        dataitem(SubAwardReportingSchedule; "Sub Award Reporting Schedule")
        {
            column(SubAwardNo; "Sub Award No")
            {
            }
            column(LineNo; "Line No")
            {
            }
            column(ReportingDuration; "Reporting Duration")
            {
            }
            column(FromDate; "From Date")
            {
            }
            column(ToDate; "To Date")
            {
            }
            column(DurationDuetoReport; "Duration Due to Report")
            {
            }
            column(DueDatetoReport; "Due Date to Report")
            {
            }
            column("Type"; "Type")
            {
            }
            column(ReportTypeDetailed; "Report Type Detailed")
            {
            }
            column(ReportingPeriod; "Reporting Period")
            {
            }
            column(ReportDueDateNarration; "Report Due Date Narration")
            {
            }
            column(ReportStatus; "Report Status")
            {
            }
            column(ReportSubmittedOn; "Report Submitted On")
            {
            }
            column(Filename; "File name")
            {
            }
            column(ReSubmissionComment; "Re-Submission Comment")
            {
            }
            column(ReportingType; "Reporting Type")
            {
            }
            column(SubmittedBy; "Submitted By")
            {
            }
            column(SubmittedByName; "Submitted By Name")
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
