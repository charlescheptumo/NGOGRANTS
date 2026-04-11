page 95399 "GL Correction Changes"
{
    ApplicationArea = All;
    Caption = 'GL Correction Changes';
    PageType = ListPart;
    SourceTable = "GL Entry Change";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(DimensionCode; Rec."Project No.")
                {
                    ApplicationArea = All;
                    Caption = 'Project No.';
                    StyleExpr = FieldStyle;
                    ToolTip = 'Specifies the Project No.';
                }

                field(DimensionValueCode; DimensionValueText)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Dimension Value Code';
                    StyleExpr = FieldStyle;
                    ToolTip = 'Specifies the current Dimension Value Code.';

                    trigger OnDrillDown()
                    var
                        DimensionValue: Record "Dimension Value";
                        DimensionValueIDFilter: Text;
                    begin
                        DimensionValueIDFilter := Rec.GetDimensionValues();
                        if DimensionValueIDFilter = '' then
                            exit;

                        DimensionValue.SetFilter("Dimension Value Id", DimensionValueIDFilter);
                        Page.RunModal(Page::"Dim Corr Values Overview", DimensionValue);
                    end;
                }

                field(NewValue; NewValueText)
                {
                    ApplicationArea = All;
                    TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project No."));
                    Caption = 'New Dimension Value Code';
                    ToolTip = 'Specifies the new value for the dimension';
                    StyleExpr = FieldStyle;
                    Editable = NewValueEditable;

                    trigger OnValidate()
                    begin
                        Rec.Validate("New Value Task", NewValueText);
                        Rec.Modify();
                        UpdateRow();
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RevertAll)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Undo;
                Caption = 'Revert All Changes';
                ToolTip = 'Revert all changes made to the dimensions.';

                trigger OnAction()
                begin
                    VerifyCanChangePart();
                    Rec.SetRange("Change Type", Rec."Change Type"::Add);
                    Rec.DeleteAll();
                    Rec.SetRange("Change Type");
                    Rec.ModifyAll(Rec."Change Type", Rec."Change Type"::"No Change", true);
                    CurrPage.Update(false);
                end;
            }

            action(DeleteRow)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Scope = Repeater;
                Image = Delete;
                Caption = 'Remove Dimension';
                ToolTip = 'Remove the dimension.';

                trigger OnAction()
                begin
                    VerifyCanChangePart();
                    Rec.Validate("Change Type", Rec."Change Type"::Remove);
                    Rec.Modify();
                    UpdateRow();
                end;
            }

            action(RevertRow)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Scope = Repeater;
                Image = Undo;
                Caption = 'Revert Change';
                ToolTip = 'Revert the selected dimension change.';

                trigger OnAction()
                begin
                    VerifyCanChangePart();
                    Rec.Validate("Change Type", Rec."Change Type"::"No Change");
                    Rec.Modify();
                    UpdateRow();
                end;
            }


        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateRow();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateRow();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Change Type" := Rec."Change Type"::Add;
        Clear(Rec."Project No.");
    end;

    local procedure UpdateRow()
    begin
        SetNewValueDisplayText();
        SetDimensionValueDisplayText();
        SetStyleAndEditableControls();
    end;

    local procedure VerifyCanChangePart()
    var
        DimensionCorrectionMgt: Codeunit "GL Entry Mgt";
    begin
        DimensionCorrectionMgt.VerifyCanModifyDraftEntry(Rec."GL Correction Entry No.");
    end;

    local procedure SetNewValueDisplayText()
    begin
        NewValueText := Format(Rec."Change Type");
        if Rec."Change Type" in [Rec."Change Type"::Add, Rec."Change Type"::Change] then begin
            if Rec."Change Type" = Rec."Change Type"::Add then
                //Check on this
                if Rec."New Value Task" = '' then begin
                    NewValueText := '';
                    // else
                    //  Rec."New Value Project" = '' then begin
                    //     NewValueText := '';
                    // end;
                    exit;
                end;
            NewValueText := StrSubstNo(NewValueDisplayTextPlaceHolderLbl, NewValueText, Rec."New Value task")
        end;
    end;

    local procedure SetDimensionValueDisplayText()
    begin
        DimensionValueText := '';

        if Rec."Change Type" = Rec."Change Type"::Add then
            exit;

        if Rec."Dimension Value Count" > 1 then
            DimensionValueText := StrSubstNo(DimensionValueDisplayTxt, Rec."Dimension Value Count");

        // if Rec."Project Code" <> '' then
        //     DimensionValueText := Rec."Dimension Values";
    end;

    local procedure SetStyleAndEditableControls()
    begin
        if Rec."Change Type" = Rec."Change Type"::"No Change" then
            FieldStyle := 'Standard'
        else
            FieldStyle := 'Strong';

        NewValueEditable := Rec."Change Type" in [Rec."Change Type"::Add, Rec."Change Type"::Change, Rec."Change Type"::"No Change"];
    end;

    var
        FieldStyle: Text;
        NewValueEditable: Boolean;
        DimensionValueText: Text;
        NewValueText: Text;
        NewValueDisplayTextPlaceHolderLbl: Label '%1 - %2', Locked = true, Comment = '%1 Change type, %2 New value';
        DimensionValueDisplayTxt: Label 'Multiple - Number of different values (%1)', Comment = '%1 Number of different GL values';
}
