page 50090 "Imprest Surrender Lines Coms"
{
    ApplicationArea = Basic;
    Caption = 'Imprest Surrender Lines Coms';
    PageType = ListPart;
    SourceTable = "Imprest Lines Comms";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Advance Type"; Rec."Advance Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Type field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }

                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Communications Date"; Rec."Communications Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communications Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Actual Spent LCY"; Rec."Actual Spent LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Actual Spent LCY field.';
                }
                field("Remaining Amount LCY"; Rec."Remaining Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Remaining Amount LCY field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    Caption = 'Project Code';
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Activity No.';
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Project Activity No. field.';
                }
            }
        }
    }

    actions
    {
    }
}
