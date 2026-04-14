page 50109 "Banked Staff Claim"
{
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable

    Caption = 'Banked Staff Claim';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            Posted = const(true),
                            Status = const(Approved));
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';

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
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Bank Account Number"; Rec."Imprest Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Bank Account Number';
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Imprest Bank Name"; Rec."Imprest Bank Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Bank Name';
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Imprest Bank Branch Name"; Rec."Imprest Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Bank Branch Name';
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Bank Branch Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Bank Account";
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No.';
                    ToolTip = 'Specifies the value of the Transaction No. field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                    ApplicationArea = Basic;
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount USD field.';
                    Caption = 'Total Amount USD';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    Caption = 'Funding Code Name';
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Name';
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    Caption = 'Department Name';
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Sub Department Name';
                    ToolTip = 'Specifies the value of the Sub Department Code field.';
                }

                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Caption = 'Project';
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Caption = 'Project Task No';
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Project Name';
                    ToolTip = 'Specifies the value of the Job Name field.';
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
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("Type of Expense"; Rec."Type of Expense")
                {
                    ToolTip = 'Specifies the value of the Type of Expense field.', Comment = '%';
                    ApplicationArea = Basic;
                    Caption = 'Type of Expense';
                    Editable = true;
                }
            }
            part(Control1000000021; "Staff Claim Lines")
            {
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
            systempart(Control1000000022; Links)
            {
                ApplicationArea = Basic;
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
                action("Resource Costs")
                {
                    ApplicationArea = Basic;
                    Image = ResourceCosts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Resource Costs action.';
                    trigger OnAction()
                    begin
                        Resource.Reset;
                        Resource.SetRange("No.", Rec."Account No.");
                        if Resource.FindSet then begin
                            ResourceNo := Resource."Resource Group No.";
                            ResourceCost.SetCurrentkey(Code);
                            ResourceCost.SetRange(Code, ResourceNo);
                            ResourceCard.SetTableview(ResourceCost);
                            ResourceCard.Run;
                        end
                    end;
                }

                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //add pv from claims
                        //added on 27/04/2017
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Process Claims", usersetup."Process Claims" = true);
                        if Confirm(Text004, false, Rec."No.") then begin
                            if Rec."Payment processed" = false then begin
                                Claimheaders.Reset;
                                Claimheaders.SetRange(Claimheaders."No.", Rec."No.");
                                if Claimheaders.Find('-') then begin

                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."PV Nos";
                                    end;
                                    rec.TestField("PV Voucher Type");
                                    if Rec."PV Voucher Type" = Rec."pv voucher type"::"Create New PV" then begin
                                        pvheaders.Init;
                                        pvheaders."No." := NoSeriesMgt.GetNextNo(Noseries, pvheaders.Date, true);
                                        pvheaders.Project := Rec.Project;
                                        pvheaders."Project Description" := Rec."Project Description";
                                        pvheaders.Date := Rec."Posting Date";
                                        pvheaders."Created By" := UserId;
                                        pvheaders.Payee := Rec.Payee;
                                        pvheaders.Job := Claimheaders.Job;
                                        pvheaders."Job Task No" := Claimheaders."Job Task No";
                                        pvheaders."On behalf of" := Claimheaders."Account Name";
                                        pvheaders."Payment Narration" := Rec."Payment Narration";
                                        pvheaders."Shortcut Dimension 1 Code" := Claimheaders."Shortcut Dimension 1 Code";
                                        pvheaders.Validate("Shortcut Dimension 1 Code");
                                        pvheaders."Shortcut Dimension 2 Code" := Claimheaders."Shortcut Dimension 2 Code";
                                        pvheaders.Validate("Shortcut Dimension 2 Code");
                                        pvheaders."Shortcut Dimension 3 Code" := Claimheaders."Shortcut Dimension 3 Code";
                                        pvheaders.Validate("Shortcut Dimension 3 Code");
                                        pvheaders."Created By" := UserId;
                                        pvheaders.Insert;
                                    end;

                                    //Added to create New or Update by Daudi
                                    if Rec."PV Voucher Type" = Rec."pv voucher type"::"Create New PV" then begin
                                        StaffCLaimNo := pvheaders."No.";
                                    end;

                                    if Rec."PV Voucher Type" = Rec."pv voucher type"::"Append To Exist" then begin
                                        Rec.TestField("PV No");
                                        StaffCLaimNo := Rec."PV No";

                                    end;
                                    Claimlines.Reset;
                                    Claimlines.SetRange(Claimlines.No, Claimheaders."No.");
                                    if Claimlines.Find('-') then begin
                                        repeat
                                            pvlines.Init;
                                            //pvlines.No := pvheaders."No.";
                                            pvlines.No := StaffCLaimNo;
                                            pvlines."Line No" := Claimlines."Line No";
                                            pvlines.Type := 'VENDOR D';
                                            pvlines."Account Type" := Claimheaders."Account Type";
                                            pvlines."Account No" := Claimheaders."Account No.";
                                            pvlines."Account Name" := Claimheaders."Account Name";
                                            pvlines."Applies to Doc. No" := Claimheaders."No.";
                                            pvlines."Vote Item" := Claimlines."Vote Item";
                                            pvlines."Shortcut Dimension 1 Code" := Claimheaders."Shortcut Dimension 1 Code";
                                            pvlines."Shortcut Dimension 2 Code" := Claimheaders."Shortcut Dimension 2 Code";
                                            pvlines.Amount := Claimlines.Amount;
                                            pvlines."Amount (LCY)" := Claimlines."Amount (LCY)";
                                            pvlines."Net Amount" := Claimlines.Amount;
                                            pvlines.Insert;
                                            pvlines.Validate("Shortcut Dimension 1 Code");
                                            pvlines.Validate("Shortcut Dimension 2 Code");
                                            pvlines.Validate(Amount);
                                        until Claimlines.Next = 0;
                                    end;

                                    pvheaders."Payment processed" := true;
                                    Claimheaders."Payment processed" := true;
                                    Claimheaders.Modify;
                                end;
                                //move documents from links/Muraya

                                // Rollback

                                // RecordLink1.Reset();
                                // if RecordLink1.FindLast Then
                                //     LineNO := RecordLink1.Id;
                                // sp.Reset();
                                // sp.SetRange("No.", Claimheaders."No.");
                                // if sp.FindSet() then begin
                                //     repeat

                                //         RecordLink.Init();
                                //         RecordLink.CreatedBy := UserId;
                                //         RecordLink."No." := StaffCLaimNo;
                                //         RecordLink.Id := LineNO + 10;
                                //         // RecordLink."Document Type" := GlobalDocType;
                                //         RecordLink.Created := CurrentDateTime;
                                //         RecordLink.Title := SP.Title;
                                //         RecordLink.OdataId := sp.OdataId;
                                //         RecordLink."Server Relative Url" := Sp."Server Relative Url";

                                //         RecordLink.Insert();
                                //     until SP.Next = 0;
                                // end;
                                //move documents from links

                                IDEntry := Claimheaders.RecordId;
                                RecordLink.Reset;
                                RecordLink.SetRange("Record ID", IDEntry);
                                if RecordLink.FindSet then begin
                                    repeat
                                        pvheaders.Reset;
                                        pvheaders.SetRange("No.", StaffCLaimNo);
                                        if pvheaders.FindFirst then begin
                                            //copy to the record link table with record id of the PV Machira
                                            RecordLink1.Reset;
                                            if RecordLink1.FindLast then begin
                                                "EntryNo." := RecordLink1."Link ID";
                                            end;
                                            RecordLink1.Init;
                                            RecordLink1."Link ID" := "EntryNo." + 1;
                                            RecordLink1."Record ID" := pvheaders.RecordId;
                                            RecordLink1.URL1 := RecordLink.URL1;
                                            RecordLink1.Description := RecordLink.URL1;
                                            RecordLink1.Company := RecordLink.Company;
                                            RecordLink1.Type := RecordLink.Type;
                                            RecordLink1.Created := RecordLink.Created;
                                            RecordLink1."User ID" := RecordLink."User ID";
                                            RecordLink1.Insert;
                                        end;
                                    until RecordLink.Next = 0;

                                end;


                                Message('Payment voucher for the staff claim No. %1 has been processed, Kindly send it for approval', StaffCLaimNo);
                            end else
                                Error('The payment for claim No. %1 has already been processed.', Claimheaders."No.");
                        end;
                    end;

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocType: Enum "Approval Document Type";
                    begin

                        DocType := DocType::"Staff Claims";
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
                separator(Action1000000043)
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
                        Report.Run(57011, true, true, Rec)
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
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
                action("Banked Staff Claim")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Banked Staff Claim action.';
                    trigger OnAction()
                    begin
                        Payments.Reset;
                        Payments.SetRange("No.", Rec."No.");
                        Payments.SetRange(Select, true);
                        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                        if Payments.Find('-') then begin
                            repeat
                                Payments.banked := true;
                                Payments.Modify;
                            until Payments.Next = 0;
                        end;
                        Message('Banked Successfully');
                    end;
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
                        PaymentsPost.PostStaffClaims(Rec);
                        //  PaymentsPost.PostStaffClaimsNew(Rec); //
                        Commitment.StaffUnCommittment(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        SetControlAppearance;

        DocType := DocType::"Staff Claims";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."No.");

    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Staff Claim";
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
        Payments: Record Payments;
        Commitment: Codeunit "Procurement Processing";
        ResourceCost: Record "Resource Cost";
        ResourceCard: Page "Resource Costs";
        Resource: Record Resource;
        ResourceNo: Code[30];
        usersetup: Record "User Setup";
        ReopenStaff: Codeunit Payments;
        RecordLink: Record "Record Link";
        RecordLink1: Record "Record Link";

        pvlines: Record "PV Lines";
        pvheaders: Record Payments;
        Claimlines: Record "PV Lines";
        Claimheaders: Record Payments;
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to process a payment voucher for staff claim No. %1?';
        SP: Record "Sharepoint File List";
        LineNO: Integer;
        // RecordLink1: Record "Sharepoint File List";

        IDEntry: RecordID;
        "EntryNo.": Integer;
        StaffCLaimNo: Code[20];

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

