report 50012 "Employee Workplan"
{
    Caption = 'Employee Workplan';
    DefaultLayout = Word;
    WordLayout = './Layouts/Employee Workplan.docx';
    //RDLCLayout = './Layouts/Employee Workplan.rdl';
    ApplicationArea = Basic;
    dataset
    {
        dataitem(PerfomanceContractHeader; "Perfomance Contract Header")
        {
            column(EndDate; "End Date")
            {
            }
            column(Position; Position)
            {
            }
            column(ResponsibilityCenterName; "Responsibility Center Name")
            {
            }
            column(ResponsibleEmployeeNo; "Responsible Employee No.")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EmployeeName_PerfomanceContractHeader; "Employee Name")
            {
            }
            column(DirectorateName_PerfomanceContractHeader; "Directorate Name")
            {
            }
            column(RoleholdersComment_PerfomanceContractHeader; "Roleholders Comment")
            {
            }
            column(SupervisorComment_PerfomanceContractHeader; "Supervisor Comment")
            {
            }

            dataitem(Objectives; Objectives)
            {
                DataItemLinkReference = PerfomanceContractHeader;
                DataItemLink = "Workplan No" = field(No);

                column(Goalno_Objectives; "Goal no")
                {
                }
                column(Objective_Objectives; Objective)
                {
                }
                dataitem("Employee Workplan Activities"; "Employee Workplan Activities")
                {
                    DataItemLinkReference = Objectives;
                    DataItemLink = Goal = field("Goal no");
                    column(CommentsRML_EmployeeWorkplanActivities; "Comments RML")
                    {
                    }
                    column(CommentsSupervisor_EmployeeWorkplanActivities; "Comments Supervisor")
                    {
                    }
                    column(DurationNeeded_EmployeeWorkplanActivities; DurationNeeded)
                    {
                    }
                    column(ExtectedOutcome_EmployeeWorkplanActivities; "Extected Outcome")
                    {
                    }
                    column(Goal_EmployeeWorkplanActivities; Goal)
                    {
                    }
                    column(Indicators_EmployeeWorkplanActivities; Indicators)
                    {
                    }
                    column(KeyActivities_EmployeeWorkplanActivities; "Key Activities")
                    {
                    }
                    column(Notes_EmployeeWorkplanActivities; Notes)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                var
                    Year: Text[10];
                begin
                    Year := "Goal no";
                end;
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
    var
        ThirtyDays: Text;
        SixtyDays: Text;
        NinetyDays: Text;
}
