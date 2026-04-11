#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57025 "Imprest Surrenders"
{
    ApplicationArea = Basic;
    CardPageID = "Imprest Surrender";
    // DeleteAllowed = false;
    Editable = false;
    PageType = List;
    Caption = 'Advance Request Surrenders';
    SourceTable = Payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const(Surrender),
                            Status = filter(Open | "Pending Approval"),
                            "Document Type" = const(Surrender));
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Issue Doc. No';
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
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
            if UserSetup."post surrender" = false then
                Rec.SetRange("Created By", UserId);
        end;

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
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Payment Type" := Rec."payment type"::Surrender;
        Rec."Document Type" := Rec."document type"::Surrender;
    end;

    trigger OnOpenPage()
    begin
        if Rec.FindFirst() then;
        if UserSetup.Get(UserId) then begin
            if UserSetup."post surrender" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

