page 50100 Objectives
{
    ApplicationArea = All;
    Caption = 'Objectives';
    PageType = ListPart;
    SourceTable = Objectives;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Goal no"; Rec."Goal no")
                {
                    ToolTip = 'Specifies the value of the Goal no field.';
                }
                field(Objective; Rec.Objective)
                {

                }

            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := GlobalDocType;

    end;

    var
        GlobalDocType: Enum "PMObjectives Document Type";

    procedure getDocType(Doctype: Enum "PMObjectives Document Type")
    var

    begin
        GlobalDocType := Doctype;
        CurrPage.Update(false);
    end;
}
