codeunit 85008 "GLEntries Management"
{
    procedure CheckDim(DimCode: Code[100]): Boolean
    var
        Dim: Record Job;
        IsHandled: Boolean;
        Result: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckDim(DimCode, Result, IsHandled, Dim);
        if IsHandled then
            EXIT(Result);

        if Dim.Get(DimCode) then begin
            if Dim.Status <> Dim.Status::Open then begin
                LogError(
                  Dim.RecordId, Dim.FieldNo(Blocked), StrSubstNo(Text014, Dim.TableCaption(), DimCode), '');
                exit(false);
            end;
        end else begin
            LogError(
              Database::Job, 0, StrSubstNo(Text015, Dim.TableCaption(), DimCode), '');
            exit(false);
        end;
        exit(true);
    end;

    procedure CheckDimValue(DimCode: Code[100]; DimValCode: Code[100]) Result: Boolean
    var
        DimVal: Record "Job Task";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckDimValue(DimCode, DimValCode, Result, IsHandled, DimVal);
        if not IsHandled then begin
            if (DimCode <> '') and (DimValCode <> '') then
                if DimVal.Get(DimCode, DimValCode) then begin
                    if DimVal.Blocked then begin
                        LogError(
                          DimVal.RecordId, DimVal.FieldNo(Blocked),
                          StrSubstNo(DimValueBlockedErr, DimVal.TableCaption(), DimCode, DimValCode), '');
                        exit(false);
                    end;
                    if not CheckDimValueAllowed(DimVal) then
                        exit(false);
                end else begin
                    LogError(
                      Database::"Job Task", 0,
                      StrSubstNo(DimValueMissingErr, DimVal.TableCaption(), DimCode, DimValCode), '');
                    exit(false);
                end;
            Result := true;
        end;
        OnAfterCheckDimValue(DimCode, DimValCode, Result);
    end;

    procedure GetDimErr() ErrorMessage: Text[250]
    begin
        FindLastErrorMessage(ErrorMessage);
    end;

    local procedure FindLastErrorMessage(var Message: Text[250])
    begin
        if ErrorMessageMgt.IsActive() then
            ErrorMessageMgt.GetLastError(Message)
        else
            Message := CopyStr(LastErrorMessage."Message", 1, MaxStrLen(Message));
    end;

    local procedure OnBeforeCheckDim(DimCode: Code[20]; var Result: Boolean; var IsHandled: Boolean; var Dimension: Record Job)
    begin
    end;

    local procedure OnBeforeCheckDimValue(DimCode: Code[20]; DimValCode: Code[20]; var Result: Boolean; var IsHandled: Boolean; var DimVal: Record "Job Task");
    begin
    end;

    procedure LogError(SourceRecVariant: Variant; SourceFieldNo: Integer; Message: Text; HelpArticleCode: Code[30]) IsLogged: Boolean
    var
        ForwardLinkMgt: Codeunit "Forward Link Mgt.";
    begin
        if ErrorMessageMgt.IsActive() then begin
            if HelpArticleCode = '' then
                HelpArticleCode := ForwardLinkMgt.GetHelpCodeForWorkingWithDimensions();
            ErrorMessageMgt.LogContextFieldError(0, Message, SourceRecVariant, SourceFieldNo, HelpArticleCode);
            IsLogged := true;
        end else begin
            LastErrorMessage.Init();
            LastErrorMessage.ID += 1;
            LastErrorMessage."Message" := CopyStr(Message, 1, MaxStrLen(LastErrorMessage."Message"));
            IsLogged := false;
        end;
    end;

    local procedure OnAfterCheckDimValue(DimCode: Code[20]; DimValCode: Code[20]; var Result: Boolean)
    begin
    end;

    local procedure CheckDimValueAllowed(DimVal: Record "Job Task") Result: Boolean
    var
        DimValueAllowed: Boolean;
        DimErr: Text[250];
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckDimValueAllowed(DimVal, IsHandled, Result);
        if IsHandled then
            exit(Result);

        DimValueAllowed :=
        //   (DimVal."Job Task Type" in [DimVal."Job Task Type"::Standard, DimVal."Job Task Type"::"Begin-Total"]);
                  (DimVal."Job Task Type" in [DimVal."Job Task Type"::"Begin-Total"]);

        if not DimValueAllowed then
            DimErr :=
              StrSubstNo(
                DimValueMustNotBeErr, DimVal.TableCaption(), DimVal."Job No.", DimVal."Job Task No.", Format(DimVal."Job Task Type"))
        else
            OnCheckDimValueAllowed(DimVal, DimValueAllowed, DimErr);

        if not DimValueAllowed then
            LogError(DimVal.RecordId, DimVal.FieldNo("Job Task Type"), DimErr, '');
        exit(DimValueAllowed);
    end;

    local procedure OnBeforeCheckDimValueAllowed(var DimensionValue: Record "Job Task"; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;

    local procedure OnCheckDimValueAllowed(DimVal: Record "Job Task"; var DimValueAllowed: Boolean; var DimErr: Text[250])
    begin
    end;

    var
        ErrorMessageMgt: Codeunit "Error Message Management";
        LastErrorMessage: Record "Error Message";
        Text014: Label '%1 %2 is blocked.';
        Text015: Label '%1 %2 can''t be found.';
        DimValueMissingErr: Label '%1 %2 - %3 is missing.', Comment = '%1 = Dimension Value table caption, %2 = Dim Code, %3 = Dim Value';

        DimValueMustNotBeErr: Label 'Job Task Type for %1 %2 - %3 must not be %4.', Comment = '%1 = Dimension Value table caption, %2 = Dim Code, %3 = Dim Value, %4 = Dimension Value Type value';
        DimValueBlockedErr: Label '%1 %2 - %3 is blocked.', Comment = '%1 = Dimension Value table caption, %2 = Dim Code, %3 = Dim Value';


}
