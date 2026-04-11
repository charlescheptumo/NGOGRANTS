#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50069 "pageextension50069" extends "Job Task Lines Subform"
{
    layout
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        addafter("Job Task No.")
        {

            field("Line No"; Rec."Line No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Line No field.';
            }
        }

        addafter("Amt. Rcd. Not Invoiced")
        {

            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field(Commitments; Rec.Commitments)
            {
                ApplicationArea = Basic;
            }
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Blocked field.';
            }
            field("Completed Length(Km)"; Rec."Completed Length(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        modify("Job Task No.")
        {
            Caption = 'Budget Task No.';
        }
        modify("Job Task Type")
        {
            Caption = 'Budget Task Type';
        }
        modify("Start Date")
        {
            Visible = false;
        }
        modify("Usage (Total Price)")
        {
            Visible = false;
        }
        modify("Contract (Total Price)")
        {
            Visible = false;
        }
        modify("Contract (Invoiced Price)")
        {
            Visible = false;
        }
        addafter("Start Date")
        {

            field("Starting Date"; Rec."Starting Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Starting Date field.';
            }
        }
    }
    actions
    {
        modify("&Job")
        {
            Caption = '&Budget';
        }
        modify(JobPlanningLines)
        {
            Caption = 'Budget &Planning Lines';
        }
        modify("Job Ledger E&ntries")
        {
            Caption = 'Budget Ledger E&ntries';
        }
        modify("Copy Job Planning Lines &from...")
        {
            Caption = 'Copy Budget Planning Lines &from...';
        }
        modify("<Action7>")
        {
            Caption = 'I&ndent Budget Tasks';
        }
        modify("Copy Job Planning Lines &to...")
        {
            Caption = 'Copy Budget Planning Lines &to...';
        }
        modify("Create &Sales Invoice")
        {
            Visible = false;
        }
        modify("SalesInvoicesCreditMemos")
        {
            Visible = false;
        }
    }

}

#pragma implicitwith restore

