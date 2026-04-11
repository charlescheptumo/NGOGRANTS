#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50024 "pageextension50024" extends "Purch. Invoice Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Job No."(Control 38)".


        //Unsupported feature: Property Modification (Visible) on ""Job Task No."(Control 90)".

        modify("Job Unit Price")
        {
            Visible = false;
        }
        addafter("Direct Unit Cost")
        {
            field("Project NO"; Rec."Job No.")
            {
                ApplicationArea = Basic;
            }
            field("Project Task"; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
            }
        }
        modify("Job Total Price")
        {
            Visible = false;
        }
        modify("Job Unit Price (LCY)")
        {
            Visible = false;
        }
        modify("Job Total Price (LCY)")
        {
            Visible = false;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }

        // Not Visible under the Purch. Invoice Subform.dal page but is present under the Purchase Invoice Lines
        // modify("Allocated Amount")
        // {
        //     Visible = false;
        // }
        // modify("Allocated Amount (Posted)")
        // {
        //     Visible = false;
        // }
        addafter("IC Partner Reference")
        {
            // field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Line Amount")
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = Basic;
            }



        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        modify("Gen. Bus. Posting Group")
        {
            visible = true;
        }

    }
}

#pragma implicitwith restore

