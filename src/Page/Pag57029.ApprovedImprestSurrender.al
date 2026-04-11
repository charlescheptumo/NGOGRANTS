#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57029 "Approved Imprest Surrender"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    Caption = 'Approved Advance Surrender';
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Approved),
                            Posted = const(false),
                            Surrendered = const(false));
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Deadline';
                    ToolTip = 'Specifies the value of the Advance Deadline field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Advance Issue Doc. No';
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    Caption = 'Project Task No.';
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    Caption = 'Project Task Name';
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Code Name';
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                    ToolTip = 'Specifies the value of the Program Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                    ToolTip = 'Specifies the value of the Section Name field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Location Name';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Location Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Advance Amount';
                    Caption = 'DSA/Accomodation & Meals Amount';
                    ToolTip = 'Specifies the value of the DSA/Accomodation & Meals Amount field.';
                }
                field("Imprest Conf Amount"; Rec."Imprest Conf Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Conference Registration Amount';
                    ToolTip = 'Specifies the value of the Conference Registration Amount field.';
                }
                field("Imprest AirFares Amount"; Rec."Imprest AirFares Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'AirFares Amount';
                    ToolTip = 'Specifies the value of the AirFares Amount field.';
                }
                field("Imprest Comms Amount"; Rec."Imprest Comms Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Communication and Others Amount';
                    ToolTip = 'Specifies the value of the Communication and Others Amount field.';
                }
                field("Imprest Total Amount"; Rec."Imprest Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount';
                    ToolTip = 'Specifies the value of the Total Advance Amount field.';
                }
                field("Imprest Surr Amount"; Rec."Imprest Surr Amount")
                {
                    ApplicationArea = Basic;
                    // Caption = 'Advance Amount';
                    Caption = 'DSA/Accomodation & Meals Surr Amount';
                    ToolTip = 'Specifies the value of the DSA/Accomodation & Meals Amount field.';
                }
                field("Imprest Surr Conf Amount"; Rec."Imprest Surr Conf Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Conference Registration Surr Amount';
                    ToolTip = 'Specifies the value of the Conference Registration Amount field.';
                }
                field("Imprest Surr AirFares Amount"; Rec."Imprest Surr AirFares Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'AirFares Surr Amount';
                    ToolTip = 'Specifies the value of the AirFares Amount field.';
                }
                field("Imprest Surr Comms Amount"; Rec."Imprest Surr Comms Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Communication and Others Surr Amount';
                    ToolTip = 'Specifies the value of the Communication and Others Amount field.';
                }
                field("Imprest Surr Total Amount"; Rec."Imprest Surr Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Surr Amount';
                    ToolTip = 'Specifies the value of the Total Advance Amount field.';
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Actual Amount Spent field.';
                }
                field("DSA Actual Amount Spent USD"; Rec."DSA Actual Amount Spent LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DSA Actual Amount Spent USD field.';
                }
                field("Conf Actual Amount Spent USD"; Rec."Conf Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Conf Actual Amount Spent USD field.';
                }
                field("AirFares Actual Amount Spent USD"; Rec."AirFares Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AirFares Actual Amount Spent USD field.';
                }
                field("Comms Actual Amount Spent USD"; Rec."Comms Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comms Actual Amount Spent USD field.';
                }
                field("Total Actual Amount Spent USD"; Rec."Total Actual Amount Spent USD")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Actual Amount Spent USD field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining DSA Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining AirFares Amount"; Rec."Remaining AirFares Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining Conference Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Conf Amount"; Rec."Remaining Conf Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining Conference Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Comms Amount"; Rec."Remaining Comms Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Remaining Conference Amount';
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Remaining Total Amount"; Rec."Remaining Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Total Remaining Amount';
                    ToolTip = 'Specifies the value of the Total Remaining Amount field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project';
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    Caption = 'Project Task No';
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
            }
            part(Control1000000017; "Imprest Surrender Lines")
            {
                Editable = true;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'DSA/Accomodation & Meals';
            }
            part(Control1000000018; "Imprest Surrender Lines Conf")
            {
                Editable = true;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'Conference Registration';
            }
            part(Control1000000019; "Imprest Surrender Lines AirFa")
            {
                Editable = true;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'AirFares';
            }
            part(Control1000000020; "Imprest Surrender Lines Coms")
            {
                Editable = true;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
                Caption = 'Communication and Others';
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Caption = 'Attachments';
            }

        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocType: Enum "Approval Document Type";
                    begin

                        DocType := DocType::"Advance Surrender";
                        ApprovalEntries.SetRecordFilters(Database::Payments, DocType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                separator(Action1000000037)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57005, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    Visible = false;
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Visible = false;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Rec.TestField("Reasons to Reopen");
                        ReOpenPayment.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000031)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        usersetup.Get(UserId);
                        if usersetup."post surrender" = false then
                            Error('You do not have sufficient rights to Post An Advance Surrender! Please! contact System Administrator for Assistance.');
                        PaymentPost."Post ImprestSurrender"(Rec);
                        Committment.ImprestUnCommittment(Rec);
                    end;
                }
                action("Initiate Staff Claim")
                {
                    ApplicationArea = Basic;
                    Image = CreateInteraction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Enabled = false;
                    Visible = false;
                    ToolTip = 'Executes the Initiate Staff Claim action.';
                    trigger OnAction()
                    var
                        TXT001: label 'You do not have sufficient rights to Initiate  a staff claim! Please! contact System Administrator for Assistance.';
                        TXT002: label 'Initiate staff claim for the staff %1';
                        TXT003: label 'The employee %1 is not due for a refund';
                    begin
                        if Confirm(TXT002, true, Rec."Account Name") = true then begin
                            usersetup.Get(UserId);
                            if usersetup."post surrender" = false then
                                Error(TXT001);
                            if Rec."Remaining Amount" < 0 then
                                PaymentPost.CreateStaffClaim(Rec) else
                                Error(TXT003, Rec."Account Name");
                        end
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        // SetControlAppearance;

        DocType := DocType::"Advance Surrender";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);

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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Surrender;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    var
        PaymentPost: Codeunit "Payments-Post";

        ShowAttach: Boolean;
        Committment: Codeunit "Procurement Processing";
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        usersetup: Record "User Setup";
        ReOpenPayment: Codeunit Payments;
}

#pragma implicitwith restore

