#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65071 "Research Investigators"
{
    ApplicationArea = Basic;
    CardPageID = "Project Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Research Team";
    SourceTableView = where("Primary Role"=const('PI'));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(JobNo;Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(ResearcherID;Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryRole;Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field(RoleDescription;Rec."Role Description")
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
