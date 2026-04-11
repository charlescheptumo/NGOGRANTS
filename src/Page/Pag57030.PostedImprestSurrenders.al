#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57030 "Posted Imprest Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Posted Imprest Surrender";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    Caption = 'Posted Advance Surrenders';
    PageType = List;
    SourceTable = Payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const(Surrender),
                            Status = filter(Approved),
                            Posted = const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Amount';
                    Visible = false;
                }
                field("Imprest Total Amount"; Rec."Imprest Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Advance Amount';
                    ToolTip = 'Specifies the value of the Total Advance Amount field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Deadline';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57002, true, true);
                    Rec.Reset;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        if Rec.FindFirst() then;
        /*IF UserSetup.GET(USERID) THEN BEGIN
        IF UserSetup."Post Requisition" =FALSE THEN
        SETRANGE("Created By",USERID);
        END;
        */

    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Imprest Amount");
        Rec.CalcFields("Imprest AirFares Amount");
        Rec.CalcFields("Imprest Conf Amount");
        Rec.CalcFields("Imprest Comms Amount");
        Rec."Imprest Total Amount" := Rec."Imprest Amount" + Rec."Imprest AirFares Amount" + Rec."Imprest Comms Amount" + Rec."Imprest Conf Amount";

        Rec.CalcFields("Imprest Surr Amount");
        Rec.CalcFields("Imprest Surr AirFares Amount");
        Rec.CalcFields("Imprest Surr Conf Amount");
        Rec.CalcFields("Imprest Surr Comms Amount");
        Rec."Imprest Surr Total Amount" := Rec."Imprest Surr Amount" + Rec."Imprest Surr AirFares Amount" + Rec."Imprest Surr Comms Amount" + Rec."Imprest Surr Conf Amount";

        Rec.CalcFields("Remaining Amount");
        Rec.CalcFields("Remaining AirFares Amount");
        Rec.CalcFields("Remaining Conf Amount");
        Rec.CalcFields("Remaining Comms Amount");
        Rec."Remaining Total Amount" := Rec."Remaining Amount" + Rec."Remaining AirFares Amount" + Rec."Remaining Comms Amount" + Rec."Remaining Conf Amount";
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

