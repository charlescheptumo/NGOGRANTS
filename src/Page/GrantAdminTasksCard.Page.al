#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65048 "Grant Admin Tasks Card"
{
    PageType = Card;
    SourceTable = "Grant Admin Tasks";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(GrantAdminTeamCode; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TeamName; Rec."Team Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResearcherNo; Rec."Researcher No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResearchCenter; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
                field(ContactNo; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field(TaskType; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                }
                field(ResearchProgram; Rec."Research Program")
                {
                    ApplicationArea = Basic;
                }
                field(ContactName; Rec."Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                }
                field(DateClosed; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                }
                field(ResearchCenterDescription; Rec."Research Center Description")
                {
                    ApplicationArea = Basic;
                }
                field(ProgramDescription; Rec."Program Description")
                {
                    ApplicationArea = Basic;
                }
                field(ContactCompanyNo; Rec."Contact Company No")
                {
                    ApplicationArea = Basic;
                }
                field(ContactCompanyName; Rec."Contact Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(Recurring; Rec.Recurring)
                {
                    ApplicationArea = Basic;
                }
                field(RecurringDateInterval; Rec."Recurring Date Interval")
                {
                    ApplicationArea = Basic;
                }
                field(CalcDueDateFrom; Rec."Calc. Due Date From")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationTitle; Rec."Application Title")
                {
                    ApplicationArea = Basic;
                }
                field(StartTime; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(LastTimeModified; Rec."Last Time Modified")
                {
                    ApplicationArea = Basic;
                }
                field(AllDayEvent; Rec."All Day Event")
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field(UnitCostLCY; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(CompletedBy; Rec."Completed By")
                {
                    ApplicationArea = Basic;
                }
                field(EndingDate; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReminderDueDateFormular; Rec."Reminder Due Date Formular")
                {
                    ApplicationArea = Basic;
                }
                field(ReminderDueDate; Rec."Reminder Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42; Outlook)
            {
            }
            systempart(Control43; Notes)
            {
            }
            systempart(Control44; MyNotes)
            {
            }
            systempart(Control45; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Source Document Type" := Rec."source document type"::"Grant Application";
    end;

    trigger OnOpenPage()
    begin
        Rec."Source Document Type" := Rec."source document type"::"Grant Application";
    end;
}
