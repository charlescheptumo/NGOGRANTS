#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65179 "A_SubRecepient Fund Requests"
{
    ApplicationArea = Basic;
    CardPageID = "Sub Recepient Fund Request";
    Caption = 'Approved SubRecepient Fund Requests';
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const("Standing Imprest"),
                            Posted = const(false),
                            Status = filter(Approved));
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
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = basic;
                    // Visible = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = basic;
                    Caption = 'Implementing Partner';

                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
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
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Code Name';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //DocPrint.PrintPurchHeader(Rec);


                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(59098, true, true, Rec)
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.FindFirst() then;
    end;
}

#pragma implicitwith restore

