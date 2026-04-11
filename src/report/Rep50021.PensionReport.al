report 50021 "Pension Report"
{
    Caption = 'Pension Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PensionReporting.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = SORTING("Employee No", Type, Code, "Payroll Period", "Reference No") ORDER(Ascending) WHERE(Type = CONST(Deduction));
            RequestFilterFields = "Payroll Period", "Code";
            RequestFilterHeading = 'NITA';
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(NATIONAL_SOCIAL_SECURITY_FUND__; Uppercase('Pension Contribution '))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CoNssf; CoNssf)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4____; Format(DateSpecified, 0, '<Closing><Day> <Month Text> <year4>'))
            {
            }
            column(EndDate1; Format(EndDate1, 0, '<Closing><Day> <month text> <year4>'))
            {

            }
            column(NATIONAL_SOCIAL_SECURITY_FUND___Control28; Uppercase('Pension Contribution '))
            {
            }
            column(P_O__BOX_30599__; 'P.O. BOX 74494 ')
            {
            }
            column(NAIROBI__; 'NAIROBI ')
            {
            }
            column(Assignment_Matrix_X__Employee_No_; "Employee No")
            {
            }
            column(Name; Name)
            {
            }
            column(ABS_Amount_; Abs(Amount))
            {
            }
            column(ABS__Employer_Amount___; Abs("Employer Amount"))
            {
            }
            column(Emp__Social_Security_No__; Emp."NSSF No.")
            {
            }
            column(ABS__Employer_Amount____ABS_Amount_; Abs("Employer Amount") + Abs(Amount))
            {
            }
            column(EmployeeTotal; EmployeeTotal)
            {
            }
            column(EmployerTotal; EmployerTotal)
            {
            }
            column(SumTotal; SumTotal)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(COMPANY_NSSF_No_Caption; COMPANY_NSSF_No_CaptionLbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(CONTRIBUTIONS_RETURN_FORMCaption; CONTRIBUTIONS_RETURN_FORMCaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
            {
            }
            column(Employer_AmountCaption; Employer_AmountCaptionLbl)
            {
            }
            column(Employee_AmountCaption; Employee_AmountCaptionLbl)
            {
            }
            column(NSSF_No_Caption; NSSF_No_CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Certified_correct_by_Company_Authorised_Officer_Caption; Certified_correct_by_Company_Authorised_Officer_CaptionLbl)
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
            column(Assignment_Matrix_X_Type; Type)
            {
            }
            column(Assignment_Matrix_X_Code; Code)
            {
            }
            column(Assignment_Matrix_X_Payroll_Period; "Payroll Period")
            {
            }
            column(Assignment_Matrix_X_Reference_No; "Reference No")
            {
            }
            column(Picture_CompanyInformation; CompRec.Picture)
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

            trigger OnAfterGetRecord()
            begin
                Voluntary := 0;//476390
                EmpTotal := 0;

                if Emp.Get("Employee No") then begin
                    Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    Id := Emp."ID Number";
                    Emp.SetRange(Emp."Pay Period Filter", "Assignment Matrix-X"."Payroll Period");
                    Emp.CalcFields(Emp."Cumm. Basic Pay");
                    if BeginDate = DateSpecified then
                        BasicPay := Emp."Basic Pay"
                    else
                        BasicPay := Emp."Cumm. Basic Pay";
                    SSFNo := Emp."Social Security No.";
                end;
                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Payment then begin
                    if Payment.Get("Assignment Matrix-X".Code) then
                        GroupHeader := Payment.Description;
                end;

                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Deduction then begin
                    if Deduction.Get("Assignment Matrix-X".Code) then
                        GroupHeader := Deduction.Description;
                end;
                TotalBasic := TotalBasic + BasicPay;
                EmployerTotal := EmployerTotal + Abs("Assignment Matrix-X"."Employer Amount");
                EmployeeTotal := EmployeeTotal + Abs("Assignment Matrix-X".Amount);

                //Employee No,Type,Code,Payroll Period,Reference No

                if AssMatrix.Get("Assignment Matrix-X"."Employee No", "Assignment Matrix-X".Type::Deduction, 'D031',
                "Assignment Matrix-X"."Payroll Period") then begin
                    Voluntary := Abs(AssMatrix.Amount);
                    TotalVoluntary := TotalVoluntary + Voluntary;
                end;

                EmpTotal := Abs("Assignment Matrix-X"."Employer Amount") + Abs("Assignment Matrix-X".Amount) + Voluntary;
                SumTotal := SumTotal + Abs("Assignment Matrix-X"."Employer Amount") + Abs("Assignment Matrix-X".Amount) + Voluntary;

                Counter := Counter + 1;
                if PrintToExcel then
                    // MakeExcelDataBody;

                if Counter > 1 then
                        Clear(CompRec.Picture);

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
                // if PrintToExcel then begin
                //     MakeExcelFooter;
                //     CreateExcelbook;
                // end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo(Code);
                //"Assignment Matrix-X".SETRANGE("Assignment Matrix-X".Retirement,TRUE);
                "Assignment Matrix-X".SetRange("Assignment Matrix-X".Type, "Assignment Matrix-X".Type::Deduction);
                // MakeExcelHeader;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintToExcel; PrintToExcel)
                    {
                        Caption = 'Print To Excel';
                        ApplicationArea = All;
                    }
                }
            }
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

        CompRec.Get;
        CompRec.CalcFields(Picture);
        //CoNssf:=CompRec."Revenue Authority Name";
        GetPayPeriod;
        DateSpecified := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X"."Payroll Period");
        EndDate1 := CalcDate('1M-1D', DateSpecified);
        if PayPeriod.Get(DateSpecified) then
            PayPeriodText := PayPeriod.Name;
        nssfcode := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X".Code);
    end;

    var
        LastFieldNo: Integer;
        Enddate1: Date;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        Emp: Record Employee;
        Name: Text[250];
        Payment: Record EarningsX;
        Deduction: Record DeductionsX;
        TypeFilter: Text[30];
        GroupHeader: Text[30];
        BasicPay: Decimal;
        SSFNo: Code[30];
        TotalBasic: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodText: Text[30];
        Title: Text[30];
        DateSpecified: Date;
        BeginDate: Date;
        CompRec: Record "Company Information";
        CoNssf: Text[30];
        SumTotal: Decimal;
        EmployeeTotal: Decimal;
        EmployerTotal: Decimal;
        GetGroup: Codeunit Payroll3;
        GroupCode: Code[20];
        CUser: Code[20];
        nssfcode: Code[10];
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: Label 'NSSF';
        Text001: Label 'KS';
        Id: Code[20];
        Counter: Integer;
        AssMatrix: Record "Assignment Matrix-X";
        Voluntary: Decimal;
        TotalVoluntary: Decimal;
        EmpTotal: Decimal;
        PrintToExcel: Boolean;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        COMPANY_NSSF_No_CaptionLbl: Label 'COMPANY NSSF No.';
        UserCaptionLbl: Label 'User';
        CONTRIBUTIONS_RETURN_FORMCaptionLbl: Label 'CONTRIBUTIONS RETURN FORM';
        PERIODCaptionLbl: Label 'PERIOD';
        No_CaptionLbl: Label 'No.';
        NameCaptionLbl: Label 'Name';
        Total_AmountCaptionLbl: Label 'Total Amount';
        Employer_AmountCaptionLbl: Label 'Employer Amount';
        Employee_AmountCaptionLbl: Label 'Employee Amount';
        NSSF_No_CaptionLbl: Label 'NSSF No.';
        TotalCaptionLbl: Label 'Total';
        Certified_correct_by_Company_Authorised_Officer_CaptionLbl: Label 'Certified correct by Company Authorised Officer ';
        NAME_________________________________________________________________________CaptionLbl: Label 'NAME  .......................................................................';
        SIGNATURE___________________________________________________________CaptionLbl: Label 'SIGNATURE ..........................................................';
        DESIGNATION____________________________________________________________CaptionLbl: Label 'DESIGNATION ...........................................................';
        DATE_____________________________________________________________________CaptionLbl: Label 'DATE ....................................................................';
        Text003: Label 'NSSF';
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[20];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        k: Integer;
        usersetup4: Record "User Setup";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            BeginDate := PayPeriod."Starting Date";
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Nearest then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Up then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Down then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;

    [Scope('Internal')]
    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        
        */

        //ExcelBuf.CreateBookAndOpenExcel(Text003,Text002,Text001,COMPANYNAME,USERID);
        //ERROR('');
        //ExcelBuf.CreateBookAndOpenExcel(Text002,Text001,COMPANYNAME,USERID);
        // ExcelBuf.CreateBookAndOpenExcel('C:\Payroll\MASTER ROLL.xlsx', Text002, Text001, CompanyName, UserId);
        //ERROR('');
        Error('');

    end;

    [Scope('Internal')]
    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn(counter,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Emp."No.", false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Name, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SSFNo, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount) + Abs("Assignment Matrix-X"."Employer Amount"), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Voluntary, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(EmpTotal, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);


        ExcelBuf.AddColumn(Id, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('CONTRIBUTIONS',FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X".Amount),FALSE,'',FALSE,FALSE,FALSE,'@');
    end;

    [Scope('Internal')]
    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('NSSF CONTRIBUTIONS', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NUMBER', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('319686', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('EMPLOYER NAME:'+UPPERCASE(COMPANYNAME),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn('EMPLOYER NAME', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('NATIONAL WATER CONSERVATION & PIPELINE CORPORATION', false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('MONTH OF CONTRIBUTION:'+UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Contributions Period', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(UpperCase(Format(DateSpecified, 0, '<month text> <year4>')), false, '', true, false, false, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('EMPLOYEE''S NAME', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('NSSF NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('STD AMT', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('VOL AMT', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('TOT AMT', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('I.D NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('REMARKS',FALSE,'',TRUE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
    end;

    [Scope('Internal')]
    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(EmployeeTotal + EmployerTotal, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);

        ExcelBuf.AddColumn(TotalVoluntary, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(EmployeeTotal + EmployerTotal + TotalVoluntary, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(SumTotal,FALSE,'',FALSE,FALSE,FALSE,'');
    end;
}
