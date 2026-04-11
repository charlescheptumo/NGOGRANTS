report 56003 Receipt
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Receipt.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("Receipt Header"; "Receipts Header1")
        {
            RequestFilterFields = "No.", Date;
            column(CAshier; "Receipt Header".Cashier)
            {
            }
            column(ChequeNo_ReceiptHeader; "Receipt Header"."Cheque No")
            {
            }
            column(ReceiptNo; "Receipt Header"."No.")
            {
            }
            column(OnBehalfOf_ReceiptHeader; "Receipt Header"."On Behalf Of")
            {
            }
            column(Received_From; "Receipt Header"."Received From")
            {
            }
            column(Date; "Receipt Header".Date)
            {
            }
            column(Picture; CompanyInfo.Picture)
            {
            }
            column(Address_1; CompanyInfo.Address)
            {
            }
            column(Address_2; CompanyInfo."Address 2")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Phone_No; CompanyInfo."Phone No.")
            {
            }
            column(Phone_No2; CompanyInfo."Phone No. 2")
            {
            }
            column(Homepage; CompanyInfo."Home Page")
            {

            }
            column(Post_Code; CompanyInfo."Post Code")
            {

            }
            column(Donor; Donor)
            {
            }
            column(Project; Project)
            {
            }
            column(TotAmountHeader; "Receipt Header".Amount)
            {
            }
            column(StrCopyText; StrCopyText)
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            column(Payment_Reference; "Payment Reference")
            {

            }
            column(TotAmountLCY; TotAmountLCY)
            {

            }
            dataitem("Receipt Line"; "Receipt Lines1")
            {
                DataItemLink = "Receipt No." = FIELD("No.");
                DataItemTableView = SORTING("Receipt No.", "Line No") ORDER(Ascending);
                column(Description; "Receipt Line"."Account Name")
                {
                }
                column(Amount; "Receipt Line".Amount)
                {
                }
                column(Amount__LCY_; "Amount (LCY)")
                {

                }
                column(NumberText; NumberText[1])
                {
                }
                column(Description_ReceiptLine; "Receipt Line".Description)
                {
                }
                column(Country; Country)
                {

                }
                column(Email; Email)
                {

                }
                column(ProjName; ProjName)
                {

                }
                column(GlobalDimension1_ReceiptLines; "Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2_ReceiptLines; "Global Dimension 2 Code")
                {
                }
                column(GlobalDimension3_ReceiptLines; "Shortcut Dimension 3 Code")
                {
                }



                trigger OnAfterGetRecord()
                var
                    Customer: Record Customer;
                    Dimension: Record Dimension;
                begin
                    //MESSAGE(FORMAT(Amount));
                    //TotAmount := TotAmount + "Receipt Line".Amount;
                    if Customer.Get("Account No.") then begin
                        Email := Customer."E-Mail";
                        if Customer."Country/Region Code" <> '' then begin
                            Country_Region.Get(Customer."Country/Region Code");
                            Country := Country_Region.Name;
                        end;
                    end;
                    begin
                        Proj.SetRange(Code, "Global Dimension 2 Code");
                        If proj.FindFirst() then
                            ProjName := Proj.Name;
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    /*
                    CheckReport.InitTextVariable;
                    CheckReport.InitTextVariable;
                    CheckReport.FormatNoText(NumberText,TotAmount,'');
                    CheckReport.FormatNoText(NumberText,TotAmount,'');
                     */

                end;

                trigger OnPreDataItem()
                begin
                    //MESSAGE(FORMAT(Amount));
                    TotAmount := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                /*StrCopyText:='';
                IF "No. Printed">=1 THEN
                  BEGIN
                    StrCopyText:='DUPLICATE';
                  END;*/
                /*
              objLogos.RESET;
               objLogos.SETRANGE(objLogos.Code,"Receipt Header"."Global Dimension 1 Code");
              IF objLogos.FIND('-') THEN BEGIN
                  objLogos.CALCFIELDS(objLogos.Picture);
              END ELSE BEGIN
                  objLogos.SETRANGE(objLogos.Default,TRUE);
                  objLogos.CALCFIELDS(objLogos.Picture);
              END;
              */
                CompanyInfo.Get;
                CompanyInfo.CalcFields(CompanyInfo.Picture);
                //DimVal.RESET;
                //    DimVal.SETRANGE(DimVal.Code,"Receipt Header"."Global Dimension 1 Code");
                //    DimVal.FIND('-');
                //    Donor := DimVal.Name;
                //    //MESSAGE('Global dimension 1::' + DimVal.Name);
                //
                //    DimVal.RESET;
                //    DimVal.SETRANGE(DimVal.Code,"Receipt Header"."Global Dimension 2 Code");
                //    DimVal.FIND('-');
                //    Project := DimVal.Name;


                "Receipt Header".CalcFields("Receipt Header".Amount);
                TotAmount := "Receipt Header".Amount;

                "Receipt Header".CalcFields("Receipt Header"."Amount(LCY)");
                TotAmountLCY := "Receipt Header"."Amount(LCY)";


                if "Currency Code" = '' then
                    "Currency Code" := 'USD';

                CheckReport.InitTextVariable;
                CheckReport.FormatNoText(NumberText, "Receipt Header".Amount, CurrencyCodeText);

            end;

            trigger OnPostDataItem()
            begin
                /*//IF CurrReport.PREVIEW=FALSE THEN
                  BEGIN
                    //"No. Printed":="No. Printed" + 1;
                    //MODIFY;
                  END;
                  */

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Chq__Slip_No_CaptionLbl: Label 'Chq./Slip No.';
        DescriptionCaptionLbl: Label 'Description';
        No_CaptionLbl: Label 'No.';
        Received_fromCaptionLbl: Label 'Received from';
        Currency_CaptionLbl: Label 'Currency:';
        VATCaptionLbl: Label 'VAT';
        DateCaptionLbl: Label 'Date';
        DepartmentCaptionLbl: Label 'Department';
        TotalCaptionLbl: Label 'Total';
        Signature___________________Lbl: Label '..................................';
        Amount_Incl__VATCaptionLbl: Label 'Amount Incl. VAT';
        You_were_served_by_CaptionLbl: Label 'You were served by:';
        TimeCaptionLbl: Label 'Time';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        VAT_Amount_CaptionLbl: Label 'VAT Amount:';
        Amount_Excl_VATCaptionLbl: Label 'Amount Excl VAT';
        Signature_CaptionLbl: Label 'Signature:';
        CompanyInfo: Record "Company Information";
        objLogos: Record "Company Information";
        CheckReport: Codeunit "Payments-Post";
        NumberText: array[2] of Text;
        TotAmount: Decimal;
        TotAmountLCY: Decimal;
        Donor: Text;
        Project: Text;
        DimVal: Record "Dimension Value";
        StrCopyText: Text;
        CurrencyCodeText: Code[10];
        Email: Text[80];
        Country: Text[100];
        Country_Region: Record "Country/Region";
        Proj: Record "Dimension Value";
        ProjName: Text[50];
}

