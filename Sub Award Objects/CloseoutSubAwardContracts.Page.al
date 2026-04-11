page 65198 "Closeout Sub Award Contracts"
{
    ApplicationArea = All;
    CardPageID = "Sub Award Contract Card";
    DeleteAllowed = false;
    Caption = 'Closeout Sub Award Contracts';
    PageType = List;
    SourceTable = "Sub Award";
    SourceTableView = where("Document Status" = filter(Closeout));
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("PFC No"; Rec."PFC No")
                {
                    Caption = 'Project Funding Contract';
                    ToolTip = 'Specifies the value of the PFC No field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Goal; Rec.Goal)
                {
                    ToolTip = 'Specifies the value of the Goal field.';
                }
                field("Sub Awardee No"; Rec."Sub Awardee No")
                {
                    ToolTip = 'Specifies the value of the Sub Awardee No field.';
                }
                field("Sub Awardee Name"; Rec."Sub Awardee Name")
                {
                    ToolTip = 'Specifies the value of the Sub Awardee Name field.';
                }
                field("Sub-award Start Date"; Rec."Sub-award Start Date")
                {
                    ToolTip = 'Specifies the value of the Sub-award Start Date field.';
                }
                field("Sub-award End Date"; Rec."Sub-award End Date")
                {
                    ToolTip = 'Specifies the value of the Sub-award End Date field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Approved Amount "; Rec."Approved Amount")
                {
                    ToolTip = 'Specifies the value of the Approved Amount  field.';
                }
                field("Approved Amount(LCY)"; Rec."Approved Amount(LCY)")
                {
                    ToolTip = 'Specifies the value of the Approved Amount(LCY) field.';
                }
                field("Main Award"; Rec."Main Award")
                {
                    ToolTip = 'Specifies the value of the Main Award field.';
                }
            }
        }
    }
}
