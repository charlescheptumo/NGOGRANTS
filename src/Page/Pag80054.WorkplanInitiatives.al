#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80054 "Workplan Initiatives"
{
    Caption = 'Intiatives & Performance Indicators';
    PageType = ListPart;
    SourceTable = "Employee Workplan Activities";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No."; Rec."Workplan No.")
                {
                    ToolTip = 'Specifies the value of the Workplan No. field.';
                }
                field(Goal; Rec.Goal)
                {
                    ToolTip = 'Specifies the value of the Goal field.';
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }

                field("Key Activities"; Rec."Key Activities")
                {
                    ToolTip = 'Specifies the value of the Key Activities field.';
                }
                field("Extected Outcome"; Rec."Extected Outcome")
                {
                    ToolTip = 'Specifies the value of the Extected Outcome field.';
                }
                field(Indicators; Rec.Indicators)
                {
                    ToolTip = 'Specifies the value of the Indicators field.';
                }
                field(DurationNeeded; Rec.DurationNeeded)
                {
                    ToolTip = 'Specifies the value of the DurationNeeded field.';
                }

                field("Comments RML"; Rec."Comments RML")
                {
                    ToolTip = 'Specifies the value of the Comments RML field.';
                }
                field("Comments Supervisor"; Rec."Comments Supervisor")
                {
                    ToolTip = 'Specifies the value of the Comments Supervisor field.';
                }
                field(Notes; Rec.Notes)
                {
                    ToolTip = 'Specifies the value of the Notes field.';
                }
            }
        }
    }




}

#pragma implicitwith restore

