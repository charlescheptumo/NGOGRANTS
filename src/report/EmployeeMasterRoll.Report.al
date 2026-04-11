report 69033 "Employee Master Roll"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmployeeMasterRoll5.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Payroll Header"; "Payroll Header")
        {
            RequestFilterFields = "No.";
            trigger OnAfterGetRecord()
            begin
                Payrollheader := "Payroll Header"."No.";
            end;
        }
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Pay Period Filter", "Posting Group";
            column(No_Employee; Employee."No.")
            {
            }
            column(Employee_Name; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(DateSpecified; DateSpecified)
            {
            }
            column(EndDate; EndDate)
            {

            }
            column(Dept; Employee."Global Dimension 1 Code")
            {
            }
            column(NAME_________________________________________________________________________Caption; NAME_________________________________________________________________________CaptionLbl)
            {
            }
            column(SIGNATURE___________________________________________________________Caption; SIGNATURE___________________________________________________________CaptionLbl)
            {
            }
            column(DESIGNATION____________________________________________________________Caption; DESIGNATION____________________________________________________________CaptionLbl)
            {
            }
            column(DATE_____________________________________________________________________Caption; DATE_____________________________________________________________________CaptionLbl)
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
            column(counter; counter)
            {
            }
            column(Posting_Group; "Posting Group")
            {
            }
            column(Global_Dimension_1_Code;"Global Dimension 1 Code")
            {                
            }
            column(Global_Dimension_2_Code;"Global Dimension 2 Code")
            {                
            }            
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number);
                column(Allowances_Number_; Allowances[Number])
                {
                }
                column(EarnDesc_Number_; EarnDesc[Number])
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SetRange(Number, 1, i);
                end;
            }
            // dataitem("Payroll Header"; "Payroll Header")
            // {
            //     DataItemLink = "Payroll Period" = field("Pay Period Filter");
            //     DataItemTableView = where(Status = const(released));
            //     column(No_; "No.")
            //     {
            //     }
            // }

            trigger OnAfterGetRecord()
            var
            // PayrollHeader: Record "Payroll Header";
            begin

                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions");
                if (Employee."Total Allowances" + Employee."Total Deductions") = 0 then
                    CurrReport.Skip;
                counter := counter + 1;
                NetPay := Employee."Total Allowances" + Employee."Total Deductions";


                Clear(Allowances);
                Clear(Deductions);

                OtherEarn := 0;
                OtherDeduct := 0;
                Totallowances := 0;
                OtherDeduct := 0;
                TotalDeductions := 0;

                for i := 1 to NoOfEarnings do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        Assignmat.CalcSums(Amount);
                        Allowances[i] := Assignmat.Amount;
                        Totallowances := Totallowances + Allowances[i];
                    end else begin
                        if Earncode[i] = 'OTHER EARNINGS' then begin
                            Allowances[i] := Employee."Total Allowances" - Totallowances;
                        end
                        else
                            if Earncode[i] = 'GROSS PAY' then
                                Allowances[i] := Employee."Total Allowances";
                    end;
                end;


                for i := NoOfEarnings + 1 to NoOfEarnings + NoOfDeductions do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", Employee."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        Assignmat.CalcSums(Amount, "Employer Amount");
                        Allowances[i] := Assignmat.Amount;
                        TotalDeductions := TotalDeductions + Allowances[i];
                        if Assignmat."Employer Amount" <> 0 then begin
                            if IsEmployerDed[i] then
                                Allowances[i] := Assignmat."Employer Amount";
                            if IsCummilative[i] then
                                Allowances[i] := Abs(Assignmat.Amount) + Abs(Assignmat."Employer Amount");
                        end
                    end else begin
                        if Earncode[i] = 'OTHER DEDUCTIONS' then
                            Allowances[i] := -Abs(Employee."Total Deductions" - TotalDeductions)
                        else
                            if Earncode[i] = 'NET PAY' then
                                Allowances[i] := Employee."Total Allowances" + Employee."Total Deductions";
                    end;
                end;

                //Approvals
                ApprovalEntries.Reset;
                // PayrollHeader.Reset();
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange("Document No.", Payrollheader);
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                // if ApprovalEntries.Find('-') then begin
                if ApprovalEntries.FindSet() then begin
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
        MasterRoll = 'MASTER ROLL';
    }

    trigger OnPreReport()
    begin

        DateSpecified := Employee.GetRangeMin(Employee."Pay Period Filter");
        EndDate := CalcDate('1M-1D', DateSpecified);
        EarnRec.Reset;
        EarnRec.SetRange("Show on Master Roll", true);
        EarnRec.SetRange("Non-Cash Benefit", false);
        EarnRec.SetRange("Pay Period Filter", DateSpecified);
        if EarnRec.Find('-') then
            repeat
                EarnRec.CalcFields("Total Amount");
                if EarnRec."Total Amount" <> 0 then begin
                    i := i + 1;
                    Earncode[i] := EarnRec.Code;
                    EarnDesc[i] := EarnRec.Description;
                    NoOfEarnings := NoOfEarnings + 1;
                end;
            until EarnRec.Next = 0;

        //Add other earnings
        // NoOfEarnings := NoOfEarnings + 1;
        // i := i + 1;
        // Earncode[i] := 'OTHER EARNINGS';
        // EarnDesc[i] := 'OTHER EARNINGS';
        // NoOfEarnings := NoOfEarnings + 1;
        // i := i + 1;
        // Earncode[i] := 'GROSS PAY';
        // EarnDesc[i] := 'GROSS PAY';
        //
        DedRec.Reset;
        DedRec.SetRange(DedRec."Show on Master Roll", true);
        DedRec.SetRange("Pay Period Filter", DateSpecified);
        if DedRec.Find('-') then
            repeat
                DedRec.CalcFields("Total Amount", "Total Amount Employer");
                if (DedRec."Total Amount" <> 0) or (DedRec."Total Amount Employer" <> 0) then begin
                    i := i + 1;
                    Earncode[i] := DedRec.Code;
                    EarnDesc[i] := DedRec.Description;
                    IsCummilative[i] := false;
                    IsEmployerDed[i] := false;
                    IF DedRec."Total Amount Employer" <> 0 then begin
                        i := i + 1;
                        Earncode[i] := DedRec.Code;
                        EarnDesc[i] := DedRec.Description + ' Employer';
                        NoOfDeductions := NoOfDeductions + 1;
                        IsEmployerDed[i] := true;
                        i := i + 1;
                        Earncode[i] := DedRec.Code;
                        EarnDesc[i] := DedRec.Description + ' Cumulative';
                        NoOfDeductions := NoOfDeductions + 1;
                        IsCummilative[i] := true;
                    end;
                    NoOfDeductions := NoOfDeductions + 1;
                end;

            until DedRec.Next = 0;

        //Add other deductions and Net Pay
        // NoOfDeductions := NoOfDeductions + 1;
        // i := i + 1;
        // Earncode[i] := 'OTHER DEDUCTIONS';
        // EarnDesc[i] := 'OTHER DEDUCTIONS';

        NoOfDeductions := NoOfDeductions + 1;
        i := i + 1;
        Earncode[i] := 'NET PAY';
        EarnDesc[i] := 'NET PAY';
        //
    end;

    var
        Allowances: array[100] of Decimal;
        Deductions: array[100] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[100] of Code[20];
        deductcode: array[100] of Code[20];
        EarnDesc: array[100] of Text[150];
        DedDesc: array[100] of Text[150];
        IsEmployerDed: array[100] of Boolean;
        IsCummilative: array[100] of Boolean;
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: Decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit Payroll3;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        NoOfEarnings: Integer;
        NoOfDeductions: Integer;
        PG: Code[20];
        Dpt: Code[20];
        Emp: Code[20];
        NAME_________________________________________________________________________CaptionLbl: Label 'Name  .......................................................................';
        SIGNATURE___________________________________________________________CaptionLbl: Label 'Signature ..........................................................';
        DESIGNATION____________________________________________________________CaptionLbl: Label 'Designation ...........................................................';
        DATE_____________________________________________________________________CaptionLbl: Label 'Date ....................................................................';
        EndDate: Date;
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[20];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        k: Integer;
        usersetup4: Record "User Setup";
        PayrollHeader: Code[20];
}

