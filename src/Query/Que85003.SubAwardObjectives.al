query 85003 "Sub Award Objectives"
{
    Caption = 'Sub Award Objectives';
    
    elements
    {
        dataitem(SubAwardMornitoringSchedule; "Sub Award Mornitoring Schedule")
        {
            column(SubAwardNo; "Sub Award No")
            {
            }
            column(LineNo; "Line No")
            {
            }
            column(VisitCode; "Visit Code")
            {
            }
            column(VisitingDate; "Visiting Date")
            {
            }
            column(FocusArea; "Focus Area")
            {
            }
            column(ReporttoSubgrantee; "Report to Sub-grantee")
            {
            }
            column(ReporttoDonor; "Report to Donor")
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
