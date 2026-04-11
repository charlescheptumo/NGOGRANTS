#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57011 "Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Requisition";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    Caption = 'Advance Requests';
    PageType = List;
    SourceTable = Payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const(Imprest),
                            Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Amount';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Total Amount"; Rec."Imprest Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Advance Amount';
                    ToolTip = 'Specifies the value of the Total Advance Amount field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrendered field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Deadline';
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
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
                Visible = false;
                ToolTip = 'Executes the Print action.';
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

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;

        Rec.CalcFields("Imprest Amount");
        Rec.CalcFields("Imprest AirFares Amount");
        Rec.CalcFields("Imprest Conf Amount");
        Rec.CalcFields("Imprest Comms Amount");
        Rec."Imprest Total Amount" := Rec."Imprest Amount" + Rec."Imprest AirFares Amount" + Rec."Imprest Comms Amount" + Rec."Imprest Conf Amount";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Document Type" := Rec."document type"::Imprest;
    end;

    trigger OnOpenPage()
    begin
        if Rec.FindFirst() then;
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

