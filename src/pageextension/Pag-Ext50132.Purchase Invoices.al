#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50132 "pageextension50132" extends "Purchase Invoices"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                Visible = true;
                ApplicationArea = Dimensions;
                ToolTip = 'Specifies the code for Shortcut Dimension 3, which is one of two global dimension codes that you set up in the General Ledger Setup window.';

                trigger OnValidate()
                begin
                    // ShortcutDimension2CodeOnAfterV();
                end;
            }
        }

        modify("Currency Code")
        {
            Visible = true;
        }

    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSecurityFilterOnRespCenter;

    JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

    CopyBuyFromVendorFilter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //SETRANGE("Assigned User ID",USERID);

    #1..5
    */
    //end;
}

