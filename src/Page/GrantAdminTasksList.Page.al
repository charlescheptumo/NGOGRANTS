#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65047 "Grant Admin Tasks List"
{
    CardPageID = "Grant Admin Tasks Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type" = const("Grant Application"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SourceDocumentType; Rec."Source Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SourceDocumentNo; Rec."Source Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(GrantAdminTeamCode; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field(TeamName; Rec."Team Name")
                {
                    ApplicationArea = Basic;
                }
                field(ResearcherNo; Rec."Researcher No")
                {
                    ApplicationArea = Basic;
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
                field(NoSeries; Rec."No. Series")
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
            }
        }
    }

    actions
    {
    }
}
