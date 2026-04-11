query 50004 "Responsibility Center"
{
    Caption = 'Responsibility Center';

    elements
    {
        dataitem(ResponsibilityCenter; "Responsibility Center")
        {
            column("Code"; "Code")
            {
            }
            column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(City; City)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(FaxNo; "Fax No.")
            {
            }
            column(Name2; "Name 2")
            {
            }
            column(Contact; Contact)
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(County; County)
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(HomePage; "Home Page")
            {
            }
            column(ContractGainLossAmount; "Contract Gain/Loss Amount")
            {
            }
            column(NoofOngoingRProjects; "No. of Ongoing RProjects")
            {
            }
            column(NoofCompletedRProjects; "No. of Completed RProjects")
            {
            }
            column(NoofAssets; "No. of Assets")
            {
            }
            column(OperatingUnitType; "Operating Unit Type")
            {
            }
            column(DirectReportsTo; "Direct Reports To")
            {
            }
            column(IndirectReportsTo; "Indirect Reports To")
            {
            }
            column(HierarchicalLevelID; "Hierarchical  Level ID")
            {
            }
            column(HeadedByTitle; "Headed By (Title)")
            {
            }
            column(CurrentHead; "Current Head")
            {
            }
            column(Blocked; "Blocked?")
            {
            }
            column(Vision; Vision)
            {
            }
            column(Mission; Mission)
            {
            }
            column(Motto; Motto)
            {
            }
            column(ResearchCenter; "Research Center?")
            {
            }
            column(Region; "Region?")
            {
            }
            column(CurrentHeadName; "Current Head Name")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EndeDate; "Ende Date")
            {
            }
            column(Archive; Archive)
            {
            }
            column(OrganizationHeadType; "Organization Head Type")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
