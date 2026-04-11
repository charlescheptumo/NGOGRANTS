query 80058 "HR Positions"
{
    Caption = 'HR Positions';

    elements
    {
        dataitem(HRPositions; "HR Positions")
        {
            column(PositionID; "Position ID")
            {
            }
            column(PositionDescription; "Position Description")
            {
            }
            column(NoofPosts; "No of Posts")
            {
            }
            column(OccupiedPositions; "Occupied Positions")
            {
            }
            column(VacantPositions; "Vacant Positions")
            {
            }
            column(UserID; UserID)
            {
            }
            column(Status; Status)
            {
            }
            column(DateCreated; "Date Created")
            {
            }
            column(PositionReportingTo; "Position Reporting To")
            {
            }
            column(ReportingToTitle; "Reporting To Title")
            {
            }
            column(Active; Active)
            {
            }
            column(JobGrade; "Job Grade")
            {
            }
            column(DomainArea; "Domain Area")
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
