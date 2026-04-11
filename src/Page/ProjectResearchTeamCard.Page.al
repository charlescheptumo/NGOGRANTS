#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65039 "Project Research Team Card"
{
    CardPageID = "Project Research Team List";
    PageType = Card;
    SourceTable = "Project Research Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(JobNo; Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResearcherID; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PrimaryRole; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field(RoleDescription; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(StartDate; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(NoofMonths; Rec."No of Months")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(DefaultPaymentMentod; Rec."Default Payment Mentod")
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
