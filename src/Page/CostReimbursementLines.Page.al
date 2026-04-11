#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65130 "Cost Reimbursement Lines"
{
    PageType = ListPart;
    SourceTable = "Billable Project Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(JobNo; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(JobTaskNo; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field(OriginalLineType; Rec."Original Line Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BillingLineType; Rec."Billing Line Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(OriginalType; Rec."Original Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BillingType; Rec."Billing Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(OriginalDescription; Rec."Original Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BillingDescription; Rec."Billing Description")
                {
                    ApplicationArea = Basic;
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = Basic;
                }
                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UnitPriceLCY; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BillingPrice; Rec."Billing Price")
                {
                    ApplicationArea = Basic;
                }
                field(BillingPriceLCY; Rec."Billing Price(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(JobBudgetTemplates; Rec."Job Budget Templates")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                group(Milestones)
                {
                    Image = Setup;
                    action(MilestoneLines)
                    {
                        ApplicationArea = Jobs;
                        Caption = 'Milestone & Lines';
                        Image = JobLines;
                        Scope = Repeater;
                        ShortCutKey = 'Shift+Ctrl+P';
                        ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';

                        trigger OnAction()
                        var
                            MilestoneLine: Record "Milestones Lines";
                            MilestoneLines: Page "Milestones Lines";
                        begin
                            Rec.TestField(Rec."Job No.");
                            MilestoneLine.FilterGroup(2);
                            MilestoneLine.SetRange("Project No", Rec."Job No.");
                            MilestoneLine.SetRange("Task No", Rec."Job Task No.");
                            MilestoneLine.FilterGroup(0);
                            MilestoneLines.SetTableview(MilestoneLine);
                            MilestoneLines.Editable := true;
                            MilestoneLines.Run;
                        end;
                    }
                }
            }
        }
    }
}
