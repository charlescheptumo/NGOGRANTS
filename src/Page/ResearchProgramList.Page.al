#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65010 "Research Program List"
{
    ApplicationArea = Basic;
    Caption = 'Research Programs';
    CardPageID = "Research Program Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Program";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(City;Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode;Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo;Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(Contact;Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field(LocationCode;Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Rec.Blocked)
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
