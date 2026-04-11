page 65172 "Sub Award Reporting Schedule"
{
    ApplicationArea = All;
    Caption = 'Sub Award Reporting Schedule';
    PageType = ListPart;
    SourceTable = "Sub Award Reporting Schedule";

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Report Type Detailed"; Rec."Report Type Detailed")
                {
                    Caption = 'Report Type Description';
                }
                field("Reporting Period"; Rec."Reporting Period")
                {
                    Caption = 'Report Description';
                }

                field("Reporting Duration"; Rec."Reporting Duration")
                {
                    ToolTip = 'Specifies the value of the Reporting Duration field.';
                }
                field("Duration Due to Report"; Rec."Duration Due to Report")
                {
                    ToolTip = 'Specifies the value of the Duration Due to Report field.';
                }
                field("Reporting Type"; Rec."Reporting Type")
                {
                    ToolTip = 'Specifies the value of the Reporting Type field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Due Date to Report"; Rec."Due Date to Report")
                {
                    ToolTip = 'Specifies the value of the Due Date to Report field.';
                }
                field("Report Due Date Narration"; Rec."Report Due Date Narration")
                {

                }
                field("Report Status"; Rec."Report Status")
                {

                }
                field("File name"; Rec."File name")
                {

                }
                field("Re-Submission Comment"; Rec."Re-Submission Comment")
                {

                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ToolTip = 'Specifies the value of the Sub Awardee No field.';
                }
                field("Submitted By Name"; Rec."Submitted By Name")
                {
                    ToolTip = 'Specifies the value of the Submitted By Name field.';
                }
                field(Notified; Rec.Notified)
                {
                    ToolTip = 'Specifies the value of the Notified field.';
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Reattach)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Resend for Attachment';
                    Image = Document;
                    Scope = Repeater;
                    trigger OnAction()
                    var
                        ReportingSchedule: Record "Sub Award Reporting Schedule";
                    begin
                        ReportingSchedule.Reset();
                        ReportingSchedule.SetRange("Line No");
                        ReportingSchedule.FindSet();
                        if ReportingSchedule."Re-Submission Comment" <> '' then begin
                            Message('Resubmit');
                        end;
                    end;
                }
            }
        }
    }
}
