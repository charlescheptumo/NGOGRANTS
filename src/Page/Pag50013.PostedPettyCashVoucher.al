page 50013 "Posted Petty Cash Voucher"
{

    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    ShowFilter = false;
    SourceTable = Payments;
    Editable = false;
    SourceTableView = where("Payment Type" = const("Petty Cash"),
                            Posted = const(true));
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
                field(Project; Rec.Job)
                {
                    ApplicationArea = Basic;

                    Editable = false;
                    //Enabled = true;
                    //Visible = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Project Description"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    //Enabled = false;
                    //Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Job Task No."; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project Task No';

                    trigger OnValidate()
                    begin
                        Rec.TestField("Job Task No");
                    end;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Task Name';
                    visible = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;

                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                    trigger OnValidate()
                    begin
                        Rec.TestField("Account Type");
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = Customer."Customer Posting Group" where("Customer Posting Group" = filter('PCASH'));
                    ToolTip = 'Specifies the value of the Account No. field.';
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
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
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
                    Caption = 'Funding Name';
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
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1000000021; "PCV Lines")
            {
                Editable = true;
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
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

        area(processing)
        {
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
                        Report.Run(57003, true, true, Rec)
                    end;
                }
                action("&Navigate")
                {
                    ApplicationArea = Basic;
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;


                    trigger OnAction()
                    var
                        Navigate: Page Navigate;
                        UserSetup: Record "User Setup";
                        GL: Record "G/L Entry";
                    begin
                        Navigate.SetDoc(Rec.Date, Rec."No.");
                        Navigate.Run;
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

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocType: Enum "Approval Document Type";
                    begin

                        DocType := DocType::"Petty Cash";
                        ApprovalEntries.SetRecordFilters(Database::Payments, DocType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }

        }
    }

    trigger OnAfterGetRecord()

    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;

        DocType := DocType::"Petty Cash";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Petty Cash";
        Rec."Account Type" := Rec."account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}
