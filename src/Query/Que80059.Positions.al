query 80059 Positions
{
    Caption = 'Positions';

    elements
    {
        dataitem(Positions; Positions)
        {
            column(JobID; "Job ID")
            {
            }
            column(JobDescription; "Job Description")
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
            column(Remarks; Remarks)
            {
            }
            column(LevelCode; "Level Code")
            {
            }
            column(LevelDescription; "Level Description")
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
