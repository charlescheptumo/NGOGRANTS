#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65018 "Research Output Register List"
{
    ApplicationArea = Basic;
    CardPageID = "Research Output Register Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Output Register";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate;Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchProjectId;Rec."Research Project Id")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchProgramId;Rec."Research Program Id")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchOutputCategory;Rec."Research Output Category")
                {
                    ApplicationArea = Basic;
                }
                field(PrincipleInvestigator;Rec."Principle Investigator")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchOutputSubCategory;Rec."Research Output SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchOutputTitle;Rec."Research Output Title")
                {
                    ApplicationArea = Basic;
                }
                field(Abstract;Rec.Abstract)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field(PublicationStatus;Rec."Publication Status")
                {
                    ApplicationArea = Basic;
                }
                field(VisibiltyCategory;Rec."Visibilty Category")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus;Rec."Approval Status")
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
