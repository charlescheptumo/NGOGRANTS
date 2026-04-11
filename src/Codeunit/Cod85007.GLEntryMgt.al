codeunit 85007 "GL Entry Mgt"
{
    procedure CreateCorrectionFromSelection(var GLEntry: Record "G/L Entry"; var DimensionCorrection: Record "Update GL Entries")
    var
        LastDimensionCorrection: Record "Update GL Entries";
        DimCorrectSelectionCriteria: Record "Dim Correct Selection Criteria";
        GLEntryRecordRef: RecordRef;
        NewEntryNo: Integer;
    begin
        NewEntryNo := 1;
        if LastDimensionCorrection.FindLast() then
            NewEntryNo := LastDimensionCorrection."Entry No." + 1;

        DimensionCorrection."Entry No." := NewEntryNo;
        DimensionCorrection.Insert(true);

        TransferSelectionFilterToRecordRef(GLEntry, GLEntryRecordRef);
        InsertNewDimCorrectSelectionCriteria(GLEntryRecordRef, DimCorrectSelectionCriteria."Filter Type"::Manual, DimCorrectSelectionCriteria, NewEntryNo);
        ReloadDimensionChangesTable(NewEntryNo);
    end;

    procedure VerifyCanModifyDraftEntry(DimensionCorrectionEntryNo: Integer)
    var
        DimensionCorrection: Record "Dimension Correction";
    begin
        if DimensionCorrectionEntryNo = 0 then
            Error(InsertDimensionCorrectionFirstErr);

        DimensionCorrection.Get(DimensionCorrectionEntryNo);
        if not (DimensionCorrection.Status in [DimensionCorrection.Status::Failed, DimensionCorrection.Status::Draft]) then
            Error(ModifyingDraftDimensionCorrectionNotAllowedErr, DimensionCorrection.Status);

        if DimensionCorrection."Started Correction" then
            Error(ModifyingDraftDimensionCorrectionNotAllowedReopenErr);
    end;

    procedure VerifyIfDimensionCanBeChanged(var DimCorrectionChange: Record "GL Entry Change")
    var
        DimCorrecitonBlocked: Record "Dim Correction Blocked Setup";
    begin
        if DimCorrecitonBlocked.Get(DimCorrectionChange."Project No.") then
            Error('CannotChangeDimensionCodeBlockedErr', DimCorrectionChange."Project No.");

        // OnAfterVerifyIfDimensionCanBeChanged(DimCorrectionChange);
    end;

    procedure InsertNewDimCorrectSelectionCriteria(var MainRecordRef: RecordRef; DimCorrectSelectionCriteriaFilterType: Option; var DimCorrectSelectionCriteria: Record "Dim Correct Selection Criteria"; DimensionCorrectionEntryNo: Integer)
    var
        DimensionCorrectionMgt: Codeunit "GL Entry Mgt";
        DimensionSetIds: List of [Integer];
    begin
        DimCorrectSelectionCriteria."Dimension Correction Entry No." := DimensionCorrectionEntryNo;
        DimCorrectSelectionCriteria."Filter Type" := DimCorrectSelectionCriteriaFilterType;
        DimCorrectSelectionCriteria.SetSelectionFilter(MainRecordRef);
        DimCorrectSelectionCriteria.Insert(true);
        // DimensionCorrectionMgt.CalculateDimensionSetIds(DimensionSetIds, DimCorrectSelectionCriteria);
        DimCorrectSelectionCriteria.SetDimensionSetIds(DimensionSetIds);
        DimCorrectSelectionCriteria.Modify(true);
    end;

    procedure ReloadDimensionChangesTable(DimCorrectionEntryNo: Integer)
    var
        DimCorrectSelectionCriteria: Record "Dim Correct Selection Criteria";
        DimCorrectionChange: Record "Dim Correction Change";
        DimensionCodeValue: Dictionary of [Code[20], List of [Integer]];
    begin
        DimCorrectionChange.SetRange("Dimension Correction Entry No.", DimCorrectionEntryNo);
        DimCorrectionChange.SetFilter("Change Type", '<>%1', DimCorrectionChange."Change Type"::"No Change");
        if not DimCorrectionChange.IsEmpty() then
            Message(ChangesWereResetMsg);

        DimCorrectionChange.SetRange("Change Type");
        DimCorrectionChange.DeleteAll(true);

        DimCorrectSelectionCriteria.SetRange("Dimension Correction Entry No.", DimCorrectionEntryNo);
        if not DimCorrectSelectionCriteria.FindSet() then
            exit;

        GetDimensionCodeValues(DimensionCodeValue, DimCorrectSelectionCriteria);
        UpdateDimCorrectionChanges(DimensionCodeValue, DimCorrectionEntryNo);
    end;

    procedure UpdateStatus(var DimensionCorrection: Record "Update GL Entries")
    var
        JobQueueEntry: Record "Job Queue Entry";
    begin
        if not (DimensionCorrection.Status in [DimensionCorrection.Status::"In Process", DimensionCorrection.Status::"Undo in Process", DimensionCorrection.Status::"Validaton in Process"]) then
            exit;

        if not JobQueueEntry.Get(DimensionCorrection."Last Job Queue Entry ID") then begin
            DimensionCorrection.Status := DimensionCorrection.Status::Failed;
            DimensionCorrection.Modify();
            exit;
        end;

        if JobQueueEntry.Status = JobQueueEntry.Status::Error then begin
            DimensionCorrection.Status := DimensionCorrection.Status::Failed;
            DimensionCorrection."Error Message" := JobQueueEntry."Error Message";
            DimensionCorrection.Modify();
            exit;
        end;

        if JobQueueEntry.Status = JobQueueEntry.Status::Finished then begin
            DimensionCorrection.Status := DimensionCorrection.Status::Completed;
            Clear(DimensionCorrection."Error Message");
            DimensionCorrection.Modify();
            exit;
        end;
    end;

    local procedure UpdateDimCorrectionChanges(var DimensionCodeValue: Dictionary of [Code[20], List of [Integer]]; DimensionCorrectionEntryNo: Integer): Boolean
    var
        DimCorrectionChange: Record "Dim Correction Change";
        DimensionSetEntry: Record "Dimension Set Entry";
        DimensionCode: Code[20];
        DimensionValues: List of [Integer];
        EntryExists: Boolean;
    begin
        if DimensionCodeValue.Keys().Count() = 0 then
            exit;

        foreach DimensionCode in DimensionCodeValue.Keys() do begin
            DimensionValues := DimensionCodeValue.Get(DimensionCode);

            Clear(DimCorrectionChange);
            EntryExists := DimCorrectionChange.Get(DimensionCorrectionEntryNo, DimensionCode);
            DimCorrectionChange."Dimension Correction Entry No." := DimensionCorrectionEntryNo;
            DimCorrectionChange."Dimension Code" := DimensionCode;
            DimCorrectionChange."Dimension Value Count" := DimensionValues.Count();
            DimCorrectionChange.SetDimensionValues(DimensionValues);
            if DimCorrectionChange."Dimension Value Count" = 1 then begin
                DimensionSetEntry.SetRange("Dimension Value ID", DimensionValues.Get(1));
                if DimensionSetEntry.FindFirst() then
                    DimCorrectionChange."Dimension Value" := DimensionSetEntry."Dimension Value Code"
                else
                    DimCorrectionChange."Dimension Value" := Format(DimensionValues.Get(1));
            end;

            if EntryExists then
                DimCorrectionChange.Modify(true)
            else
                DimCorrectionChange.Insert(true);
        end;
    end;

    procedure TransferSelectionFilterToRecordRef(var GLEntry: Record "G/L Entry"; var GLEntryRecordRef: RecordRef)
    var
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
        EntryNoFieldRef: FieldRef;
        FilteredText: Text;
    begin
        GLEntryRecordRef.GetTable(GLEntry);
        FilteredText := SelectionFilterManagement.GetSelectionFilter(GLEntryRecordRef, GLEntry.FieldNo("Entry No."));
        GLEntryRecordRef.ClearMarks();
        EntryNoFieldRef := GLEntryRecordRef.Field(GLEntry.FieldNo("Entry No."));
        EntryNoFieldRef.SetFilter(FilteredText);
    end;

    local procedure GetDimensionCodeValues(var DimensionCodeValue: Dictionary of [Code[20], List of [Integer]]; var DimCorrectSelectionCriteria: Record "Dim Correct Selection Criteria")
    var
        DimensionSetIdList: List of [Integer];
        DimensionSetId: Integer;
        ProcessedDimensionSetIds: List of [Integer];
    begin
        if not DimCorrectSelectionCriteria.FindSet() then
            exit;

        repeat
            DimCorrectSelectionCriteria.GetDimensionSetIds(DimensionSetIdList);

            foreach DimensionSetId in DimensionSetIdList do
                if not ProcessedDimensionSetIds.Contains(DimensionSetId) then begin
                    AddDimensionSetIDToDictionary(DimensionSetId, DimensionCodeValue);
                    ProcessedDimensionSetIds.Add(DimensionSetId);
                end;
        until DimCorrectSelectionCriteria.Next() = 0;
    end;

    local procedure AddDimensionSetIDToDictionary(DimensionsetId: Integer; var DimensionCodeValue: Dictionary of [Code[20], List of [Integer]])
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        DimensionValues: List of [Integer];
    begin
        DimensionSetEntry.SetRange("Dimension Set ID", DimensionSetId);
        if DimensionSetEntry.FindSet() then
            repeat
                Clear(DimensionValues);
                if not DimensionCodeValue.ContainsKey(DimensionSetEntry."Dimension Code") then
                    DimensionCodeValue.Add(DimensionSetEntry."Dimension Code", DimensionValues)
                else
                    DimensionCodeValue.Get(DimensionSetEntry."Dimension Code", DimensionValues);

                if not DimensionValues.Contains(DimensionSetEntry."Dimension Value ID") then
                    DimensionValues.Add(DimensionSetEntry."Dimension Value ID");
            until DimensionSetEntry.Next() = 0;
    end;

    var
        ModifyingDraftDimensionCorrectionNotAllowedReopenErr: Label 'You need to reopen the dimension correction to do changes. Alternatevelly you can schedule a new run.';

        ModifyingDraftDimensionCorrectionNotAllowedErr: Label 'You cannot change a dimension correction while it is in %1 state.', Comment = '%1 Name of the state';

        InsertDimensionCorrectionFirstErr: Label 'You must create Dimension Correction first, for example by entering description';

        ChangesWereResetMsg: Label 'Changes to the dimensions were reset because ledger entries were updated. We recommend that you change dimensions after selecting all ledger entries.';

}
