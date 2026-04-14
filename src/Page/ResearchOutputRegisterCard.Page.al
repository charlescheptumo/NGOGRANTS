#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65017 "Research Output Register Card"
{
    PageType = Card;
    CAPTION = 'Operations Output Register List';
    SourceTable = "Research Output Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DocumentDate; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResearchProjectId; Rec."Research Project Id")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchProgramId; Rec."Research Program Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PrincipleInvestigator; Rec."Principle Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Operations Output Category"; Rec."Research Output Category")
                {
                    ApplicationArea = Basic;
                }
                field("Operations Output SubCategory"; Rec."Research Output SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field(ResearchOutputTitle; Rec."Research Output Title")
                {
                    ApplicationArea = Basic;
                }
                field(Abstract; Rec.Abstract)
                {
                    ApplicationArea = Basic;
                }
                group("Comments Info")
                {
                    Caption = 'Comments Info';
                    field(Comments; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Comments';
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field(PublicationStatus; Rec."Publication Status")
                {
                    ApplicationArea = Basic;
                }
                field(VisibiltyCategory; Rec."Visibilty Category")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup18)
            {
                action(Authors)
                {
                    ApplicationArea = Basic;
                    Image = User;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Authorship List";
                    RunPageLink = "Research Output Id" = field(No);
                }
                action("Collaborations/Affiliations")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Collaboration List";
                    RunPageLink = "Research Output ID" = field(No);
                }
                action("Events && Activities")
                {
                    ApplicationArea = Basic;
                    Image = "Event";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Research Activities List";
                    RunPageLink = "Research Output ID" = field(No);
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //  DMSManagement.UploadResearchOutputRegisterDocuments(Rec.No,'Research',Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        WorkDescription: Text;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}
