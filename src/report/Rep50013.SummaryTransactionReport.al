report 50013 "Summary Transaction Report"
{
    Caption = 'Summary Transaction Report';
    RDLCLayout = 'Layouts/Summary Transaction Report.rdlc';
    ApplicationArea = All;


    dataset
    {
        dataitem(User; User)
        {
            // RequestFilterFields = "Posted Date";
            column(User_Name; "User Name")
            {

            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(DocumentType_Payments; Payments."Payment Type")
            {
            }
            dataitem(PV_Payments; Payments)
            {
                DataItemTableView = WHERE("Payment Type" = CONST("Payment Voucher"));
                RequestFilterFields = "Posted Date";

                column(PV_Count; PVCount)
                {

                }
                column(PostedDate_PV_Payments; PV_Payments."Posted Date")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    PV_Payments.SetFilter(PV_Payments."Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                end;
            }
            // dataitem(AdvanceReq_Payments; Payments)
            // {
            //     DataItemTableView = WHERE("Payment Type" = CONST(Imprest));
            //     column(AdvanceReqCount; AdvanceReqCount)
            //     {

            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(AdvanceSurr_Payments; Payments)
            // {
            //     DataItemTableView = WHERE("Payment Type" = CONST("Imprest Surrender"));
            //     column(AdvanceSurrCount; AdvanceSurrCount)
            //     {

            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(PettyCashReq_Payments; Payments)
            // {
            //     DataItemTableView = WHERE("Payment Type" = CONST("Petty Cash"));
            //     column(PettyCashReqCount; PettyCashReqCount)
            //     {

            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(PettyCashSurr_Payments; Payments)
            // {
            //     DataItemTableView = WHERE("Payment Type" = CONST("Petty Cash Surrender"));
            //     column(PettyCashSurrCount; PettyCashSurrCount)
            //     {

            //     }
            //     // column(DocumentType_Payments; PettyCashSurr_Payments."Payment Type"::"Petty Cash")
            //     // {
            //     // }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(StaffClaims_Payments; Payments)
            // {
            //     DataItemTableView = WHERE("Payment Type" = CONST("Staff Claim"));
            //     column(StaffClaimCount; StaffClaimCount)
            //     {
            //     }
            //     column(DocumentType_SPayments; PettyCashSurr_Payments."Payment Type")
            //     {
            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(BankTransfer_Payments; Payments)
            // {
            //     DataItemTableView = WHERE("Payment Type" = CONST("Bank Transfer"));
            //     column(BankTransferCount; BankTransferCount)
            //     {

            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem("Receipts Header1"; "Receipts Header1")
            // {
            //     DataItemTableView = WHERE("Direct Income Voucher" = CONST(false));
            //     column(ReceiptCount; ReceiptCount)
            //     {

            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(DIV; "Receipts Header1")
            // {
            //     DataItemTableView = WHERE("Direct Income Voucher" = CONST(true));
            //     column(DIVCount; DIVCount)
            //     {

            //     }
            //     // trigger OnAfterGetRecord()
            //     // begin

            //     // end;
            // }
            // dataitem(Purchase_Invoice; "Purchase Header")
            // {
            //     DataItemTableView = WHERE("Document Type" = CONST(Invoice));
            //     column(PurchInvCount; PurchInvCount)
            //     {

            //     }



            // }
            // dataitem(Purchase_Order; "Purchase Header")
            // {
            //     DataItemTableView = WHERE("Document Type" = CONST(Order));
            //     column(PurchOrderCount; PurchOrderCount)
            //     {

            //     }
            // }
            trigger OnAfterGetRecord()
            begin
                //Normal Receipt
                ReceiptsHeader1.Reset;
                // ReceiptsHeader1.SetRange("Posted By", ReceiptsHeader1."Posted By");
                ReceiptsHeader1.SetRange("Posted By", User."User Name");
                ReceiptsHeader1.SetRange(Posted, true);
                ReceiptsHeader1.SetRange("Direct Income Voucher", false);
                ReceiptsHeader1.SetFilter("Posted Date", '%1..%2', StartDateReceipt, EndDateReceipt);
                // ReceiptsHeader1.SetRange("Document Type", ReceiptsHeader1."Document Type"::);
                if ReceiptsHeader1.FindSet then begin
                    ReceiptCount := ReceiptsHeader1.Count;
                end;

                //DIV Receipt
                ReceiptsHeader1.Reset;
                // ReceiptsHeader1.SetRange("Posted By", ReceiptsHeader1."Posted By");
                ReceiptsHeader1.SetRange("Posted By", User."User Name");
                ReceiptsHeader1.SetRange(Posted, true);
                ReceiptsHeader1.SetRange("Direct Income Voucher", true);
                ReceiptsHeader1.SetFilter("Posted Date", '%1..%2', StartDateReceipt, EndDateReceipt);
                // ReceiptsHeader1.SetRange("Document Type", ReceiptsHeader1."Document Type"::);
                if ReceiptsHeader1.FindSet then begin
                    DIVCount := ReceiptsHeader1.Count;
                end;

                //PV
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::"Payment Voucher");
                if Payments.FindSet() then begin
                    PVCount := Payments.Count;
                end;

                //Adv Req
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::Imprest);
                if Payments.FindSet() then begin
                    AdvanceReqCount := Payments.Count;
                end;

                //Adv Surr
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::"Imprest Surrender");
                if Payments.FindSet() then begin
                    AdvanceSurrCount := Payments.Count;
                end;

                //Petty Req
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::"Petty Cash");
                if Payments.FindSet() then begin
                    PettyCashReqCount := Payments.Count;
                end;

                //Petty Surr
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::"Petty Cash Surrender");
                if Payments.FindSet() then begin
                    PettyCashSurrCount := Payments.Count;
                end;

                //Bank Req
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::"Bank Transfer");
                if Payments.FindSet() then begin
                    BankTransferCount := Payments.Count;
                end;

                //Staff Claim
                Payments.Reset();
                // Payments.SetRange("Posted By", Payments."Posted By");
                Payments.SetRange("Posted By", User."User Name");
                Payments.SetRange(Posted, true);
                Payments.SetFilter("Posted Date", '%1..%2', StartDatePayments, EndDatePayments);
                Payments.SetRange("Document Type", Payments."Payment Type"::"Staff Claim");
                if Payments.FindSet() then begin
                    StaffClaimCount := Payments.Count;
                end;

                // //Purchase Order
                // PurHeader.Reset();
                // PurHeader.SetRange("Posted By", PurHeader."Posted By");
                // PurHeader.SetRange(Posted, true);
                // PurHeader.SetFilter("Posted Date", '%1..%2', StartDate, EndDate);
                // PurHeader.SetRange("Document Type", PurHeader."Document Type"::Order);
                // if PurHeader.FindSet() then begin
                //     PurchOrderCount := PurHeader.Count;
                // end;

                // //Purchase Invoice
                // PurHeader.Reset();
                // PurHeader.SetRange("Posted By", PurHeader."Posted By");
                // PurHeader.SetRange(Posted, true);
                // PurHeader.SetFilter("Posted Date", '%1..%2', StartDate, EndDate);
                // PurHeader.SetRange("Document Type", PurHeader."Document Type"::Invoice);
                // if PurHeader.FindSet() then begin
                //     PVCount := PurHeader.Count;
                // end;
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        StartDatePayments := Payments.GetRangeMin(Payments."Posted Date");
        EndDatePayments := Payments.GetRangeMax(Payments."Posted Date");
        // StartDateReceipt := "Receipts Header1".GetRangeMin("Receipts Header1"."Posted Date");
        // EndDateReceipt := "Receipts Header1".GetRangeMax("Receipts Header1"."Posted Date");
        // StartDatePur := PurHeader.GetRangeMin(PurHeader."Posted Date");
        // EndDatePur := PurHeader.GetRangeMax(PurHeader."Posted Date");
    end;


    var
        CompanyInfo: Record "Company Information";
        StartDatePayments: Date;
        EndDatePayments: Date;
        StartDateReceipt: Date;
        EndDateReceipt: Date;
        StartDatePur: Date;
        EndDatePur: Date;
        PostedDate: Date;

        PVCount: Integer;
        ReceiptCount: Integer;
        AdvanceReqCount: Integer;
        PurchOrderCount: Integer;
        AdvanceSurrCount: Integer;
        PettyCashReqCount: Integer;
        PettyCashSurrCount: Integer;
        StaffClaimCount: Integer;
        BankTransferCount: Integer;
        DIVCount: Integer;
        PurchInvCount: Integer;
        ReceiptsHeader1: Record "Receipts Header1";
        Payments: Record Payments;
        PurHeader: Record "Purchase Header";
}
