#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65119 "Revision Planning Lines"
{
    Caption = 'Budget Planning Lines';
    DataCaptionExpression = Caption;
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Report,Outlook';
    SourceTable = "Project Budget Planning Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(ProjectBudgetID; Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LineType; Rec."Line Type")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the type of planning line.';
                }
                field(JobNo; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SourceJobTaskNo; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    Caption = 'Source Job Task No.';
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Source Quantity';
                    ToolTip = 'Specifies the number of units of the resource, item, or general ledger account that should be specified on the planning line. If you later change the No., the quantity you have entered remains on the line.';
                }
                field(DestinationjobTaskNo; Rec."Destination job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination job Task No.';
                }
                field(DestinationQuantity; Rec."Destination Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Quantity';
                }
                field(BudgetType; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                }
                field(JobBudgetTemplates; Rec."Job Budget Templates")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCostLCY; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the total cost for the planning line. The amount is in the local currency.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    var
       // SMTPMailSetup: Record "SMTP Mail Setup";
        MailManagement: Codeunit "Mail Management";
    begin
    end;

    trigger OnOpenPage()
    var
        Job: Record Job;
    begin
    end;
}
