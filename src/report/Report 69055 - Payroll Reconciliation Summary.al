report 69055 "Payroll Reconciliation Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation Summary.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Pay Period Filter", "Posting Group Filter";
            column(EarningsX_Code; EarningsX.Code)
            {
            }
            column(EarningsX_Description; EarningsX.Description)
            {
            }
            column(ThisMonthVal; ThisMonthVal)
            {
            }
            column(LastMonthVal; LastMonthVal)
            {
            }
            column(Difference; Difference)
            {
            }
            column(Thismonth; Thismonth)
            {
            }
            column(Lastmonth; Lastmonth)
            {
            }
            column(SerialNo1; SerialNo)
            {
            }
            column(TotalEmployees; TotalEmployees)
            {
            }
            column(TotalEmployeesLastMonth; TotalEmployeesLastMonth)
            {
            }
            column(NetPayThisMonth; NetPayThisMonth)
            {
            }
            column(NetPayLastMonth; NetPayLastMonth)
            {
            }
            column(Difference2; Difference)
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(Approved_By; usersetup4."Employee Name")
            {
            }
            column(DateApprove; ApproverDate[5])
            {
            }
            column(Signature; usersetup4.Picture)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                MaxIteration = 1;
                column(CompanyInfoName; CompanyInfo.Name)
                {
                }
                column(CompanyInfoPicture; CompanyInfo.Picture)
                {
                }

                trigger OnPreDataItem()
                begin
                    // Integer.SETRANGE(Number,1,i);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //SerialNo:=0;
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                if EarningsX."Non-Cash Benefit" = true then
                    CurrReport.Skip;


                //Earn.RESET;
                //earningsx.SETRANGE(earningsx.Code,EarningsX.Code);
                EarningsX.SetRange(EarningsX."Pay Period Filter", Thismonth);
                EarningsX.SetRange("Posting Group Filter", PostingGrp);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF EarningsX.FINDFIRST THEN
                EarningsX.CalcFields(EarningsX."Total Amount");
                ThisMonthVal := EarningsX."Total Amount";
                TotalEarnThisMonth := TotalEarnThisMonth + ThisMonthVal;

                //Earn.RESET;
                //Earn.SETRANGE(Earn.Code,EarningsX.Code);
                EarningsX.SetRange(EarningsX."Pay Period Filter", Lastmonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF EarningsX.FINDFIRST THEN
                EarningsX.SetRange("Posting Group Filter", PostingGrp);
                EarningsX.CalcFields(EarningsX."Total Amount");

                LastMonthVal := EarningsX."Total Amount";
                TotalEarnLastMonth := TotalEarnLastMonth + LastMonthVal;

                Difference := ThisMonthVal - LastMonthVal;

                //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                if (Difference = 0) then
                    CurrReport.Skip;

                SerialNo := SerialNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                TotalEmployees := 0;
                TotalEmployeesLastMonth := 0;
                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);
                Employee1.SetRange("Posting Group", PostingGrp);
                //filter by posting group

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployees := TotalEmployees + 1;
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);
                Employee1.SetRange("Posting Group", PostingGrp);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployeesLastMonth := TotalEmployeesLastMonth + 1;
                    until Employee1.Next = 0;
                end;

                NetPayThisMonth := 0;
                NetPayLastMonth := 0;
                Difference := 0;

                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);


                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);
                Employee1.SetRange("Posting Group", PostingGrp);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        NetPayThisMonth := NetPayThisMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);
                Employee1.SetRange("Posting Group", PostingGrp);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        NetPayLastMonth := NetPayLastMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    until Employee1.Next = 0;
                end;

                Difference := NetPayThisMonth - NetPayLastMonth;
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            PrintOnlyIfDetail = false;
            column(DeductionsX_Code; DeductionsX.Code)
            {
            }
            column(DeductionsX_Description; DeductionsX.Description)
            {
            }
            column(ThisMonthVal1; ThisMonthVal)
            {
            }
            column(LastMonthVal1; LastMonthVal)
            {
            }
            column(Difference1; Difference)
            {
            }
            column(SerialNo2; SerialNo2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //SerialNo2:=0;

                LastMonthVal := 0;
                ThisMonthVal := 0;
                Difference := 0;
                //Ded.RESET;
                //Ded.SETRANGE(Ded.Code,DeductionsX.Code);
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", Thismonth);
                DeductionsX.SetRange("Posting Group Filter", PostingGrp);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Ded.SETRANGE(Ded."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF Ded.FINDFIRST THEN
                DeductionsX.CalcFields(DeductionsX."Total Amount");
                ThisMonthVal := DeductionsX."Total Amount";
                TotalDedThisMonth := TotalDedThisMonth + ThisMonthVal;

                //Ded.RESET;
                //Ded.SETRANGE(Ded.Code,DeductionsX.Code);
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", Lastmonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Ded.SETRANGE(Ded."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF Ded.FINDFIRST THEN
                DeductionsX.SetRange("Posting Group Filter", PostingGrp);
                DeductionsX.CalcFields(DeductionsX."Total Amount");

                LastMonthVal := DeductionsX."Total Amount";
                TotalDedLastMonth := TotalDedLastMonth + LastMonthVal;

                Difference := ThisMonthVal - LastMonthVal;

                //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                if (Difference = 0) then
                    CurrReport.Skip;

                SerialNo2 := SerialNo2 + 1;

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                // ApprovalEntries.SetRange("Document No.", "Payroll Header"."No.");
                ApprovalEntries.SetRange("Document No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    k := 0;
                    repeat
                        k := k + 1;
                        if k = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if k = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if k = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                        if k = 4 then begin
                            Approver[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if usersetup4.Get(Approver[5]) then
                                usersetup4.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;

            trigger OnPostDataItem()
            begin
                //SerialNo:=0;
            end;

            trigger OnPreDataItem()
            begin
                //SerialNo:=0;
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

    trigger OnPreReport()
    begin

        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
        PostingGrp := EarningsX.GetFilter("Posting Group Filter");
    end;

    var
        EmpName: Text[230];
        Emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        Thismonth: Date;
        Lastmonth: Date;
        LastMonthVal: Decimal;
        Difference: Decimal;
        PostingGrp: Code[100];
        ThisMonthVal: Decimal;
        Thismonth1: Date;
        Lastmonth1: Date;
        LastMonthVal1: Decimal;
        Difference1: Decimal;
        ThisMonthVal1: Decimal;
        EmpName1: Text;
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        CompanyInfo: Record "Company Information";
        SerialNo: Integer;
        SerialNo2: Integer;
        SerialNo3: Integer;
        Earn: Record EarningsX;
        TotalEarnThisMonth: Decimal;
        TotalDedThisMonth: Decimal;
        TotalEarnLastMonth: Decimal;
        TotalDedLastMonth: Decimal;
        Ded: Record DeductionsX;
        EarningFilter: Text[200];
        TotalEmployees: Integer;
        TotalEmployeesLastMonth: Integer;
        Employee1: Record Employee;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[20];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        k: Integer;
        usersetup4: Record "User Setup";
}

