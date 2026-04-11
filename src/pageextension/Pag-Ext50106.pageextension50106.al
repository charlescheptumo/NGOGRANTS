#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50106 "pageextension50106" extends "Fixed Asset G/L Journal"
{
    layout
    {
        addafter("FA Error Entry No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        modify("Currency Code")
        {
            Visible = true;
        }
        addafter(Description)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
                Caption = 'Project No.';
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
                Caption = 'Project Activity Code';
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
                Caption = 'Project Activity Quantity';
            }
        }
        addafter(Amount)
        {
            field("Amount (LCY)"; Rec."Amount (LCY)")
            {
                ApplicationArea = Basic;
            }
        }

    }
}

#pragma implicitwith restore

