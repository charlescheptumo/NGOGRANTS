#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69767 "Candidate Selection Panel Card"
{
    PageType = Card;
    SourceTable = "Candidate Selection Panel";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Panel ID"; Rec."Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("No of Committee Members"; Rec."No of Committee Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'No of Panelists';
                    ToolTip = 'Specifies the value of the No of Committee Members field.';
                }
            }
            part(Control15; "Selection Panelist")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Panel ID" = field("Panel ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NotifyPanelists)
            {
                ApplicationArea = Basic;
                Image = Email;
                Caption = 'Notify Panelists';
                trigger OnAction()
                var
                    EmailMsg: Codeunit "Email Message";
                    Email: Codeunit Email;
                    CC: List of [Text];
                    BCC: List of [Text];
                    Recepients: List of [Text];
                    Body: Text;
                    Ins: InStream;
                    TempBlob: Codeunit "Temp Blob";
                    Filename: Text;
                    Contenttype: Text;
                    EmailScenario: Enum "Email Scenario";
                    SelectionPanel: Record "Candidate Selection Panelist";
                begin
                    Clear(Recepients);
                    SelectionPanel.Reset();
                    SelectionPanel.SetRange("Document No", Rec."Document No");
                    SelectionPanel.SetRange("Panel ID", Rec."Panel ID");
                    if SelectionPanel.FindSet() then
                        repeat
                            Recepients.Add(SelectionPanel.Email);

                        until SelectionPanel.Next() = 0;
                    EmailMsg.Create(Recepients, 'INTERVIEW PANEL INVITE', Body, false, CC, BCC);
                    EmailScenario := EmailScenario::HR;
                    Email.OpenInEditor(EmailMsg);
                end;

            }

        }
    }
}

#pragma implicitwith restore

