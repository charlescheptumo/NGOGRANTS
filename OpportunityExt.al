tableextension 50143 "CRM Opportunity Ext" extends "CRM Opportunity"
{
    Description = 'Potential revenue-generating event to an account, which needs to be tracked through an opportunity process to completion.';

    fields
    {
        field(50000; EmailAddress; Text[100])
        {
            ExternalName = 'emailaddress';
            ExternalType = 'String';
            
            Description = 'The primary email address for the entity.';
            Caption = 'Email Address';
        }
        field(50001; OnHoldTime; Integer)
        {
            ExternalName = 'onholdtime';
            ExternalType = 'Integer';
            ExternalAccess = Read;
            Description = 'Shows the duration in minutes for which the opportunity was on hold.';
            Caption = 'On Hold Time (Minutes)';
        }
        field(50002; LastOnHoldTime; Datetime)
        {
            ExternalName = 'lastonholdtime';
            ExternalType = 'DateTime';
            Description = 'Contains the date time stamp of the last on hold time.';
            Caption = 'Last On Hold Time';
        }
        field(50003; TimeSpentByMeOnEmailAndMeetings; Text[1250])
        {
            ExternalName = 'timespentbymeonemailandmeetings';
            ExternalType = 'String';
            ExternalAccess = Read;
            Description = 'Total time spent for emails (read and write) and meetings by me in relation to the opportunity record.';
            Caption = 'Time Spent by me';
        }
        field(50004; TeamsFollowed; Integer)
        {
            ExternalName = 'teamsfollowed';
            ExternalType = 'Integer';
            Description = 'Number of users or conversations followed the record';
            Caption = 'TeamsFollowed';
        }
        field(50005; SkipPriceCalculation; Option)
        {
            ExternalName = 'skippricecalculation';
            ExternalType = 'Picklist';
            Description = 'Skip Price Calculation (For Internal Use)';
            Caption = 'Skip Price Calculation';
            InitValue = DoPriceCalcAlways;
            OptionMembers = DoPriceCalcAlways,SkipPriceCalcOnRetrieve;
            OptionOrdinalValues = 0, 1;
        }
        field(50006; msdyn_forecastcategory; Option)
        {
            ExternalName = 'msdyn_forecastcategory';
            ExternalType = 'Picklist';
            Description = 'Categories used for forecasting.';
            Caption = 'Forecast category';
            InitValue = Pipeline;
            OptionMembers = Pipeline,BestCase,Committed,Omitted,Won,Lost;
            OptionOrdinalValues = 100000001, 100000002, 100000003, 100000004, 100000005, 100000006;
        }
        field(50007; msdyn_similaropportunities; BLOB)
        {
            ExternalName = 'msdyn_similaropportunities';
            ExternalType = 'Memo';
            Description = '';
            Caption = 'msdyn_similaropportunities';
            Subtype = Memo;
        }
        field(50008; msdyn_OpportunityScore; Integer)
        {
            ExternalName = 'msdyn_opportunityscore';
            ExternalType = 'Integer';
            Description = '';
            Caption = '(Deprecated) Opportunity Score';
        }
        field(50009; msdyn_OpportunityGrade; Option)
        {
            ExternalName = 'msdyn_opportunitygrade';
            ExternalType = 'Picklist';
            Description = '';
            Caption = '(Deprecated) Opportunity Grade';
            InitValue = " ";
            OptionMembers = " ",GradeA,GradeB,GradeC,GradeD;
            OptionOrdinalValues = -1, 0, 1, 2, 3;
        }
        field(50010; msdyn_ScoreReasons; BLOB)
        {
            ExternalName = 'msdyn_scorereasons';
            ExternalType = 'Memo';
            Description = '';
            Caption = '(Deprecated) Score Reasons';
            Subtype = Memo;
        }
        field(50011; msdyn_ScoreHistory; BLOB)
        {
            ExternalName = 'msdyn_scorehistory';
            ExternalType = 'Memo';
            Description = '';
            Caption = '(Deprecated) Score History';
            Subtype = Memo;
        }
        field(50012; msdyn_OpportunityScoreTrend; Option)
        {
            ExternalName = 'msdyn_opportunityscoretrend';
            ExternalType = 'Picklist';
            Description = '';
            Caption = '(Deprecated) Opportunity Score Trend';
            InitValue = " ";
            OptionMembers = " ",Improving,Steady,Declining,NotEnoughInfo;
            OptionOrdinalValues = -1, 0, 1, 2, 3;
        }
        field(50013; msdyn_gdproptout; Boolean)
        {
            ExternalName = 'msdyn_gdproptout';
            ExternalType = 'Boolean';
            Description = 'Describes whether opportunity is opted out or not';
            Caption = 'GDPR Optout';
        }
        field(50014; msnfp_amountallocated; Decimal)
        {
            ExternalName = 'msnfp_amountallocated';
            ExternalType = 'Money';
            Description = 'The currency amount that has been allocated to related Designation Plans against this opportunity.';
            Caption = 'Actual Ask Amount';
        }
        field(50015; msnfp_amountallocated_Base; Decimal)
        {
            ExternalName = 'msnfp_amountallocated_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Actual Ask Amount in base currency.';
            Caption = 'Actual Ask Amount (Base)';
        }
        field(50016; msnfp_amountrealized; Decimal)
        {
            ExternalName = 'msnfp_amountrealized';
            ExternalType = 'Money';
            Description = 'The amount of realized designation credits that have been paid against the designation plan created. The designation credit represents the payment created as a result of a transaction';
            Caption = 'Realized';
        }
        field(50017; msnfp_amountrealized_Base; Decimal)
        {
            ExternalName = 'msnfp_amountrealized_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Realized in base currency.';
            Caption = 'Realized (Base)';
        }
        field(50018; msnfp_currentstage; Text[100])
        {
            ExternalName = 'msnfp_currentstage';
            ExternalType = 'String';
            Description = 'The current stage of the opportunity';
            Caption = 'Current Stage';
        }
        field(50019; msnfp_expectedamount; Decimal)
        {
            ExternalName = 'msnfp_expectedamount';
            ExternalType = 'Money';
            Description = 'The sum of all related parent Designation Plans for this opportunity.';
            Caption = 'Expected Amount';
        }
        field(50020; msnfp_expectedamount_Base; Decimal)
        {
            ExternalName = 'msnfp_expectedamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Expected Amount in base currency.';
            Caption = 'Expected Amount (Base)';
        }
        field(50021; msnfp_ExpectedGivingAmount; Decimal)
        {
            ExternalName = 'msnfp_expectedgivingamount';
            ExternalType = 'Money';
            Description = 'Populated by trigger, displays the sum of all Expected Giving Amounts.';
            Caption = 'Expected Giving Amount';
        }
        field(50022; msnfp_expectedgivingamount_Base; Decimal)
        {
            ExternalName = 'msnfp_expectedgivingamount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Expected Giving Amount in base currency.';
            Caption = 'Expected Giving Amount (Base)';
        }
        field(50023; msnfp_firstreport; Date)
        {
            ExternalName = 'msnfp_firstreport';
            ExternalType = 'DateTime';
            Description = 'The date of the first report for this opportunity.';
            Caption = 'First Report';
        }
        field(50024; msnfp_lastreport; Date)
        {
            ExternalName = 'msnfp_lastreport';
            ExternalType = 'DateTime';
            Description = 'The date of the last report for this opportunity.';
            Caption = 'Last Report';
        }
        field(50025; msnfp_numberofreports; Integer)
        {
            ExternalName = 'msnfp_numberofreports';
            ExternalType = 'Integer';
            Description = 'The number of reports for this opportunity.';
            Caption = 'No. Reports';
        }
        field(50026; msnfp_OpportunityManagerId; GUID)
        {
            ExternalName = 'msnfp_opportunitymanagerid';
            ExternalType = 'Lookup';
            Description = 'The related opportunity manager assigned to this solicitation, this is a user of the system and is different than the solicitor';
            Caption = 'Opportunity Manager';
            TableRelation = "CRM Systemuser".SystemUserId;
        }
        field(50027; msnfp_pledgecreated; Boolean)
        {
            ExternalName = 'msnfp_pledgecreated';
            ExternalType = 'Boolean';
            Description = 'A marker that indicates the related donor commitment has been created by the process. This prevents the button form appearing when the process has already completed.';
            Caption = 'Pledge Created';
        }
        field(50028; msnfp_pledgecreateddate; Date)
        {
            ExternalName = 'msnfp_pledgecreateddate';
            ExternalType = 'DateTime';
            Description = 'The date the related donor commitment has been created from the process';
            Caption = 'Pledge Created Date';
        }
        field(50029; msnfp_primaryformid; Text[50])
        {
            ExternalName = 'msnfp_primaryformid';
            ExternalType = 'String';
            Description = 'The stored GUID of the form used to load the opportunity. If a value exists, the form will ensure that record loads with the Form Identifier specified in this field.';
            Caption = 'Primary Form Id';
        }
        field(50030; msnfp_ProspectiveGiftType; Option)
        {
            ExternalName = 'msnfp_prospectivegifttype';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Prospective Gift Type';
            InitValue = " ";
            OptionMembers = " ",Cash,Stock,"In-kind";
            OptionOrdinalValues = -1, 100000000, 100000001, 100000002;
        }
        field(50031; msnfp_setcommitted; Boolean)
        {
            ExternalName = 'msnfp_setcommitted';
            ExternalType = 'Boolean';
            Description = 'The field that marks this opportunity has been set as ''Set Committed" which indicates the donor commitment can be created from this opportunity';
            Caption = 'Set Committed';
        }
        field(50032; msnfp_setcommitteddate; Date)
        {
            ExternalName = 'msnfp_setcommitteddate';
            ExternalType = 'DateTime';
            Description = 'The date the opportunity has been marked as ''Set Committed" which indicative the donor commitment can be created from this opportunity';
            Caption = 'Set Committed Date';
        }
        field(50033; msnfp_SolicitationType; Option)
        {
            ExternalName = 'msnfp_solicitationtype';
            ExternalType = 'Picklist';
            Description = 'Giving Type being solicited (Renewal, Additional, etc) or communication medium to donor (TV, Radio, Raffle, etc). This value is copied from associated Campaign at gift creation, and can be manually changed if necessary.';
            Caption = 'Solicitation Type';
            InitValue = " ";
            OptionMembers = " ",Renewal,Additional;
            OptionOrdinalValues = -1, 100000000, 100000001;
        }
        field(50034; msnfp_SolicitorId; GUID)
        {
            ExternalName = 'msnfp_solicitorid';
            ExternalType = 'Lookup';
            Description = 'The related solicitor that has been assigned to the related customer or contact';
            Caption = 'Solicitor';
            TableRelation = "CRM Contact".ContactId;
        }
        field(50035; msnfp_sum_transaction_amount; Decimal)
        {
            ExternalName = 'msnfp_sum_transaction_amount';
            ExternalType = 'Money';
            Description = 'Transaction Amount Allocated to this Opportunity';
            Caption = 'Allocated';
        }
        field(50036; msnfp_sum_transaction_amount_Base; Decimal)
        {
            ExternalName = 'msnfp_sum_transaction_amount_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Allocated in base currency.';
            Caption = 'Allocated (Base)';
        }
        field(50037; msnfp_totalcommitted; Decimal)
        {
            ExternalName = 'msnfp_totalcommitted';
            ExternalType = 'Money';
            Description = 'The total committed from any related ‘Donor Commitments’';
            Caption = 'Total Committed';
        }
        field(50038; msnfp_totalcommitted_Base; Decimal)
        {
            ExternalName = 'msnfp_totalcommitted_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Total Committed in base currency.';
            Caption = 'Total Committed (Base)';
        }
        field(50039; new_DonorType; Option)
        {
            ExternalName = 'new_donortype';
            ExternalType = 'Picklist';
            Description = 'This describes the Donor Type';
            Caption = 'Donor Type';
            InitValue = " ";
            OptionMembers = " ",Foundation,PrivateSector,DevelopmentPartner,HNWI,ImplementingPartner;
            OptionOrdinalValues = -1, 100000000, 100000001, 100000002, 100000003, 100000004;
        }
        field(50040; cr908_GrantMechanism; Option)
        {
            ExternalName = 'cr908_grantmechanism';
            ExternalType = 'Picklist';
            Description = 'Highlights the Grants Mechanism used.';
            Caption = 'Grant Mechanism';
            InitValue = " ";
            OptionMembers = " ",FullGrantManagement,PooledFund,APHFOperatingCosts;
            OptionOrdinalValues = -1, 575430000, 575430001, 575430002;
        }
        field(50041; new_OpportunityWonorLost; Boolean)
        {
            ExternalName = 'new_opportunitywonorlost';
            ExternalType = 'Boolean';
            Description = 'Details if the Opportunity was Won or Lost.';
            Caption = 'Opportunity Won or Lost';
        }
        field(50042; new_AllocationtoAPHF; Decimal)
        {
            ExternalName = 'new_allocationtoaphf';
            ExternalType = 'Decimal';
            ExternalAccess = Read;
            Description = '';
            Caption = 'Allocation to APHF';
        }
        field(50043; new_PercentAllocation; Option)
        {
            ExternalName = 'new_percentallocation';
            ExternalType = 'Picklist';
            ExternalAccess = Read;
            Description = '';
            Caption = 'Percent Allocation';
            InitValue = " ";
            OptionMembers = " ";
            OptionOrdinalValues = -1;
        }
        field(50044; new_PercentAllocationtoAPHF; Decimal)
        {
            ExternalName = 'new_percentallocationtoaphf';
            ExternalType = 'Decimal';
            Description = 'Type the Percentage Allocation that will be allocated to APHF.';
            Caption = 'Percentage Allocation to APHF';
        }
        field(50045; new_estimatedgrantstartdate; DateTime)
        {
            ExternalName = 'new_estimatedgrantstartdate';
            ExternalType = 'DateTime';
            Description = 'Highlights the Expected Start Date of the Grant.';
            Caption = 'Estimated Grant Start Date';
        }
        field(50046; new_grantcontractstartdate; DateTime)
        {
            ExternalName = 'new_grantcontractstartdate';
            ExternalType = 'DateTime';
            Description = 'Highlights the Start Date of the Grant Contract.';
            Caption = 'Grant Contract Start Date';
        }
        field(50047; new_grantcontractenddate; DateTime)
        {
            ExternalName = 'new_grantcontractenddate';
            ExternalType = 'DateTime';
            Description = 'Highlights the End Date of the Grant Contract.';
            Caption = 'Grant Contract Start Date';
        }
        field(50048; new_opportunitynumber; Text[30])
        {
            ExternalName = 'new_opportunitynumber';
            ExternalType = 'Text';
            Description = 'Highlights the Opportunity Number.';
            Caption = 'Opportunity Number';
        }
        field(50049; new_primaryobjective; Text[50])
        {
            ExternalName = 'new_primaryobjective';
            ExternalType = 'Text';
            Description = 'Highlights the Primary Objective of the Grant.';
            Caption = 'Primary Objective';
        }
        field(50050; campaignid; Integer)
        {
            ExternalName = 'campaignid';
            ExternalType = 'Lookup';
            Description = 'Highlights the Project Focus of the Grant.';
            Caption = 'Project Focus';
        }
    }
}