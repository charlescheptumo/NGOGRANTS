#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57044 "Posted PV Lines"
{
    // Editable = false;
    Editable = true;
    PageType = ListPart;
    SourceTable = "PV Lines";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applies to Doc. No"; Rec."Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Editable = true;
                    Visible = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Editable = true;
                    Visible = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Claim Doc No."; Rec."Claim Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Status, Rec.Status::Released);
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Additional Info.")
            {
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                        RecRef2: RecordRef;
                        PurchInvHeader: Record "Purch. Inv. Header";
                    begin
                        if PurchInvHeader.Get(Rec."Applies to Doc. No") then begin
                            RecRef.GetTable(PurchInvHeader);
                            DocumentAttachmentDetails.OpenForRecRef(RecRef);
                            DocumentAttachmentDetails.RunModal;
                        end;
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

