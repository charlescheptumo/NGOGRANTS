page 50014 "SharePoint Connection Setup"
{
    ApplicationArea = All;
    Caption = 'SharePoint Connection Setup';
    PageType = Card;
    SourceTable = "SharePoint Connector Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Client ID"; Rec."Client ID")
                {
                    ToolTip = 'Specifies the value of the Client ID field.';
                }
                field("Client Secret"; Rec."Client Secret")
                {
                    ToolTip = 'Specifies the value of the Client Secret field.';
                }
                field("Sharepoint URL"; Rec."Sharepoint URL")
                {
                    ToolTip = 'Specifies the value of the Sharepoint URL field.';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Connect)
            {
                trigger OnAction()
                var
                    AadTenantID: Text;
                    Diag: Interface "HTTP Diagnostics";
                    SharepointList: Record "SharePoint List" temporary;
                    sp: Codeunit "SharePoint Auth.";
                begin


                end;
            }
        }
    }
}
