#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65043 "Funding Opportunity List"
{
    ApplicationArea = Basic;
    Caption = 'Funding Opportunity Announcement List';
    CardPageID = "Funding Opportunity Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Funding Opportunity";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CallNo;Rec."Call No.")
                {
                    ApplicationArea = Basic;
                }
                field(FundingAgency;Rec."Organization ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Agency';
                }
                field(IssuingOrganization;Rec."Issuing Organization")
                {
                    ApplicationArea = Basic;
                }
                field(CallType;Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                field(OpportunityAmount;Rec."Opportunity Amount")
                {
                    ApplicationArea = Basic;
                }
                field(OpportunityAmountLCY;Rec."Opportunity Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(ExternalAnnouncementNo;Rec."External Announcement No")
                {
                    ApplicationArea = Basic;
                }
                field(ReleaseDate;Rec."Release Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDueDate;Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Applicationdate;Rec."Application date")
                {
                    ApplicationArea = Basic;
                }
                field(ExpirationDate;Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field(HomePage;Rec."Home Page")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Published;Rec.Published)
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
