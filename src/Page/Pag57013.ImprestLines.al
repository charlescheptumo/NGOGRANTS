#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57013 "Imprest Lines"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "Imprest Lines";
    Caption = 'Advance Lines';
    ApplicationArea = Basic;

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
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ToolTip = 'Specifies the value of the Country Code field.';
                }
                field("Area Code"; Rec."Area Code")
                {
                    ToolTip = 'Specifies the value of the Area Code field.';
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Daily Rate"; Rec."Daily Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Rate field.';
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }

                field("More than 60 Days (LCY)"; Rec."More than 60 Days (LCY)")
                {
                    ToolTip = 'Specifies the value of the > 60 Days (USD) field.';
                    Visible = false;
                }
                field("More than 60 Days Amount"; Rec."More than 60 Days Amount")
                {
                    ToolTip = 'Specifies the value of the > 60 Days Local field.';
                    Visible = false;
                }
                field("Room Amount"; Rec."Room Amount")
                {
                    ToolTip = 'Specifies the value of the Room Amount field.';
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount';
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount (USD)';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount LCY field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Task No. field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}

#pragma implicitwith restore

