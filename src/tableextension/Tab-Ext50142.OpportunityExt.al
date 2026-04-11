tableextension 50142 "Opportunity Ext" extends Opportunity
{
    fields
    {
        field(50000; "Approval Status"; Enum "Purchase Document Status")
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Grant Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Types";
        }
        field(50002; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Contract Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Contract End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; OpportunityId; Guid)
        {
            Caption = 'Opportunity';
            Description = 'Unique identifier of the opportunity.';
        }
        field(50006; StatusCode; Option)
        {
            Caption = 'Status Reason';
            Description = 'Select the opportunity''s status.';
            OptionCaption = ' ,In Progress,On Hold,Won,Canceled,Out-Sold';
            OptionMembers = " ",InProgress,OnHold,Won,Canceled,"Out-Sold";
        }
        field(50007; "Donor Type"; Option)
        {
            Description = 'Select the Donor Type.';
            OptionCaption = ' ,Foundation,Private Sector,Development Partner,HNWI,Implementing Partner';
            OptionMembers = " ", Foundation, PrivateSector, DevelopmentPartner, HNWI, ImplementingPartner;
        }
        field(50008; "Grant Mechanism"; Option)
        {
            Description = 'Select the Grant Mechanism.';
            OptionCaption = ' ,Full Grant Management,Pooled Fund,APHF Operating Costs';
            OptionMembers = " ", FullGrantManagement, PooledFund, APHFOperatingCosts;
        }
        field(50009; "Percentage Allocation to APHF"; Decimal)
        {
            Description = 'This is the Percentage Allocation that will go to APHF.';
        }
        field(50010; "Allocation to APHF"; Decimal)
        {
            Caption = 'Allocation Amount to APHF';
            Description = 'This is the Allocation Amount that will go to APHF.';
        }
        field(50011; "Requested Grant Amount"; Decimal)
        {
            Caption = 'Requested Grant Amount';
            // Description = 'This is the Allocation Amount that will go to APHF.';
        }
        field(50012;"Parent Name"; Text[30])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Customer.Get("Contact Company Name") then begin
                    // "Grantor Name" := Customer.Name;
                    "Contact Company No." := Customer."No.";
                    // Address := Customer.Address;
                    // Address2 := Customer."Address 2";
                    // "Post Code" := Customer."Post Code";
                    // City := Customer.City;
                    // "Phone No" := Customer."Phone No.";
                    // "Mobile Phone No" := Customer."Mobile Phone No.";

                end;
            end;
        }
        field(50013; "Opportunity Number"; Text[30])
        {
            Caption = 'Opportunity Number';
            // Description = 'This is the defining number for an opportunity.';
        }
        field(50014; "Primary Objective"; Text[50])
        {
            Caption = 'Primary Objective';
            // Description = 'This is the defining Primary Objective for an opportunity.';
        }
        field(50015; "Project Focus"; Integer)
        {
            Caption = 'Project Focus';
            // Description = 'This is the defining Project Focus for an opportunity.';
        }
        
    }
    trigger OnInsert()
    begin
        "Created By" := UserId;
    end;

    var
        Customer: Record Customer;
}
