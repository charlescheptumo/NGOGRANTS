#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50075 "pageextension50075" extends "Contact Card"
{
    Caption = 'Collaborator Card';

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Contact Card"(Page 5050)".

    layout
    {
        modify("Salesperson Code")
        {
            Caption = 'Solicitor Code';

            //Unsupported feature: Property Insertion (Visible) on ""Salesperson Code"(Control 24)".

        }
        modify("Company No.")
        {
            Caption = 'Organization No.';
        }
        modify("Company Name")
        {
            Caption = 'Organization Name';
        }
        modify(Control31)
        {
            Visible = false;
        }
        addafter("Language Code")
        {
            field(Group; Rec.Group)
            {
                ApplicationArea = Basic;
            }
            field("Sub-Group"; Rec."Sub-Group")
            {
                ApplicationArea = Basic;
            }
            field("Parent Contact ID"; Rec."Parent Contact ID")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        modify(SalesQuotes)
        {
            Visible = false;
        }
        modify(NewSalesQuote)
        {
            Visible = false;
        }
        modify("Oppo&rtunities")
        {
            Visible = false;
        }
        modify("Create Opportunity")
        {
            Visible = false;
        }
    }
}

#pragma implicitwith restore

