#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65029 "GFO Approval Comm Entry List"
{
    CardPageID = "GFO Approval Entry Card";
    Editable = false;
    PageType = List;
    SourceTable = "GFO Approval Committee Entry";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RACID; Rec."RAC ID")
                {
                    ApplicationArea = Basic;
                }
                field(GrantFundingApplicationId; Rec."Grant Funding Application Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Funding Application Id';
                    TableRelation = "Grant Funding Application"."Application No" where("Application No" = field("Grant Funding Application Id"));
                }
                field(FinalApprovalVerdict; Rec."Final Approval Verdict")
                {
                    ApplicationArea = Basic;
                }
                field(FinalApprovalDate; Rec."Final Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalDocumentNo; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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
