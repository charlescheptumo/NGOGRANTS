codeunit 50024 "Resource Mobilization Integrat"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", OnGetCDSTableNo, '', false, false)]
    local procedure OnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean);
    begin
        if BCTableNo = Database::Opportunity then begin
            CDSTableNo := Database::"CRM Opportunity";
            handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Lookup CRM Tables", OnLookupCRMTables, '', false, false)]
    local procedure OnLookupCRMTables(CRMTableID: Integer; NAVTableId: Integer; SavedCRMId: Guid; var CRMId: Guid; IntTableFilter: Text; var Handled: Boolean);
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", OnAddEntityTableMapping, '', false, false)]
    local procedure OnAddEntityTableMapping(var TempNameValueBuffer: Record "Name/Value Buffer" temporary);
    begin
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Integration Mgt.", 'OnHasCompanyIdField', '', false, false)]
    local procedure HandleOnHasCompanyIdField(TableId: Integer; var HasField: Boolean)
    begin
        if TableId = Database::"CRM Opportunity" then
            HasField := true;
    end;

    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::Bidirectional, 'Dataverse', Codeunit::"CRM Integration Table Synch.", Codeunit::"CDS Int. Table Uncouple");
        // IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::FromIntegrationTable, 'CDS');

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetConfiguration, '', false, false)]
    local procedure OnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup");
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        DataverseOpportunity: Record "CRM Opportunity";
        Opportunity: Record Opportunity;
    begin
        InsertIntegrationTableMapping(
           IntegrationTableMapping, 'OPPORTUNITY',
           Database::Opportunity, Database::"CRM Opportunity",
           DataverseOpportunity.FieldNo(OpportunityId), DataverseOpportunity.FieldNo(ModifiedOn),
           '', '', true);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo(OpportunityId), DataverseOpportunity.FieldNo(OpportunityId), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo(Description), DataverseOpportunity.FieldNo(Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo(StatusCode), DataverseOpportunity.FieldNo(StatusCode), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Date Closed"), DataverseOpportunity.FieldNo(ActualCloseDate), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Allocation to APHF"), DataverseOpportunity.FieldNo(new_AllocationtoAPHF), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Contact Company Name"), DataverseOpportunity.FieldNo(AccountIdName), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Contact Name"), DataverseOpportunity.FieldNo(ParentContactIdName), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Donor Type"), DataverseOpportunity.FieldNo(new_DonorType), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Grant Mechanism"), DataverseOpportunity.FieldNo(cr908_GrantMechanism), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Percentage Allocation to APHF"), DataverseOpportunity.FieldNo(new_PercentAllocationtoAPHF), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Requested Grant Amount"), DataverseOpportunity.FieldNo(EstimatedValue), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Donor Type"), DataverseOpportunity.FieldNo(new_DonorType), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Contract Start Date"), DataverseOpportunity.FieldNo(new_grantcontractstartdate), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Contract End Date"), DataverseOpportunity.FieldNo(new_grantcontractenddate), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Opportunity Number"), DataverseOpportunity.FieldNo(new_opportunitynumber), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Primary Objective"), DataverseOpportunity.FieldNo(new_primaryobjective), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Project Focus"), DataverseOpportunity.FieldNo(campaignid), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo(""), DataverseOpportunity.FieldNo(), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
        // InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Estimated Value (LCY)"), DataverseOpportunity.FieldNo(ParentAccountIdName), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

        // RecreateJobQueueEntryFromIntTableMapping(IntegrationTableMapping, 30, EnqueueJobQueEntry);


    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetConfiguration, '', false, false)]
    // local procedure OnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup");
    // var
    //     IntegrationTableMapping: Record "Integration Table Mapping";
    //     IntegrationFieldMapping: Record "Integration Field Mapping";
    //     DataverseGrantOj: Record obj;
    //     GrantObj: Record "Grant Research Objectives";
    // begin
    //     InsertIntegrationTableMapping(
    //        IntegrationTableMapping, 'CAMPAIGN',
    //        Database::"Grant Research Objectives", Database::"CRM Opportunity",
    //        DataverseGrantOj.FieldNo("No."), DataverseCampaign.FieldNo("Last Date Modified"),
    //        '', '', true);
    //     InsertIntegrationFieldMapping('GRANTOBJ', GrantObj.FieldNo(OpportunityId), DataverseGrantOj.FieldNo("No."), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    //     InsertIntegrationFieldMapping('GRANTOBJ', GrantObj.FieldNo(), DataverseGrantOj.FieldNo(Name), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    //     // InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo(""), DataverseOpportunity.FieldNo(), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);
    //     // InsertIntegrationFieldMapping('OPPORTUNITY', Opportunity.FieldNo("Estimated Value (LCY)"), DataverseOpportunity.FieldNo(ParentAccountIdName), IntegrationFieldMapping.Direction::Bidirectional, '', true, false);

    // end;


    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", 'OnBeforeInsertRecord', '', false, false)]
    local procedure HandleOnBeforeInsertRecord(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef)
    var
        CDSIntegrationMgt: Codeunit "CDS Integration Mgt.";
    begin
        if DestinationRecordRef.Number() = Database::"CRM Opportunity" then
            CDSIntegrationMgt.SetCompanyId(DestinationRecordRef);
    end; */



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Rec. Synch. Invoke", OnBeforeInsertRecord, '', false, false)]
    local procedure OnBeforeInsertRecord(IntegrationTableMapping: Record "Integration Table Mapping"; SourceRecordRef: RecordRef; var DestinationRecordRef: RecordRef);
    begin
    end;

}

