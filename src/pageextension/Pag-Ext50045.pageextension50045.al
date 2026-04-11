#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50045 "pageextension50045" extends "Payment Journal"
{
    layout
    {

        addafter("Account No.")
        {
            field("Acc Name"; Rec."Acc Name")
            {
                Caption = 'Account Name';
                ApplicationArea = Basic;
            }
        }
        addafter("Bal. Account No.")
        {
            field("Bal. Acc Name"; Rec."Bal. Acc Name")
            {
                Caption = 'Bal. Account Name';
                ApplicationArea = Basic;
            }
        }
        addafter("Bal. Account No.")
        {
            field("Line Type"; Rec."Job Line Type")
            {
                Caption = 'Job Line Type';
                ApplicationArea = Basic;
            }
        }

        addafter("VAT Prod. Posting Group")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
            }
        }

        modify(AccName)
        {
            Visible = true;
        }
    }
}

#pragma implicitwith restore

