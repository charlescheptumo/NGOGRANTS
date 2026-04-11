report 69020 NHIF
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NHIF2.rdlc';
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
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            DataItemTableView = SORTING("Employee No", Type, Code, "Payroll Period", "Reference No") WHERE(Type = CONST(Deduction));
            RequestFilterFields = "Payroll Period", "Code";
            RequestFilterHeading = 'NHIF';
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4____; Format(DateSpecified, 0, '<Closing><Day> <Month Text> <year4>'))
            {
            }
            column(EndDate1; Format(EndDate1, 0, '<Closing><Day> <month text> <year4>'))
            {

            }
            column(EmployerNHIFNo; EmployerNHIFNo)
            {
            }
            column(Address; Address)
            {
            }
            column(Tel; Tel)
            {
            }
            column(CompPINNo; CompPINNo)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO_Control42; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME_Control1000000006; CompanyName)
            {
            }
            column(EmployerNHIFNo_Control1000000007; EmployerNHIFNo)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___Month_Text___year4_____Control1000000009; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(ABS__Assignment_Matrix_X__Amount_; Abs("Assignment Matrix-X".Amount))
            {
            }
            column(NHIF; NhifNo)
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
            column(FirstName_____Emp__Middle_Name______LastName; FirstName + ' ' + Emp."Middle Name" + ' ' + LastName)
            {
            }
            column(Assignment_Matrix_X__Assignment_Matrix_X___Employee_No_; "Assignment Matrix-X"."Employee No")
            {
            }
            column(YEAR; YEAR)
            {
            }
            column(Emp__ID_Number_; Emp."ID Number")
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(Counter; Counter)
            {
            }
            column(AmountCaption; AmountCaptionLbl)
            {
            }
            column(ID_PassportCaption; ID_PassportCaptionLbl)
            {
            }
            column(Date_of_BirthCaption; Date_of_BirthCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(NHIF_No_Caption; NHIF_No_CaptionLbl)
            {
            }
            column(MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaption; MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaptionLbl)
            {
            }
            column(Name_of_EmployeeCaption; Name_of_EmployeeCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption; EMPLOYER_NOCaptionLbl)
            {
            }
            column(Payroll_No_Caption; Payroll_No_CaptionLbl)
            {
            }
            column(PERIODCaption; PERIODCaptionLbl)
            {
            }
            column(EMPLOYERCaption; EMPLOYERCaptionLbl)
            {
            }
            column(ADDRESSCaption; ADDRESSCaptionLbl)
            {
            }
            column(EMPLOYER_PIN_NOCaption; EMPLOYER_PIN_NOCaptionLbl)
            {
            }
            column(TEL_NOCaption; TEL_NOCaptionLbl)
            {
            }
            column(PageCaption_Control44; PageCaption_Control44Lbl)
            {
            }
            column(UserCaption; UserCaptionLbl)
            {
            }
            column(NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaption; NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaptionLbl)
            {
            }
            column(EMPLOYER_NOCaption_Control1000000008; EMPLOYER_NOCaption_Control1000000008Lbl)
            {
            }
            column(PERIODCaption_Control1000000010; PERIODCaption_Control1000000010Lbl)
            {
            }
            column(Payroll_No_Caption_Control1000000056; Payroll_No_Caption_Control1000000056Lbl)
            {
            }
            column(Name_of_EmployeeCaption_Control1000000055; Name_of_EmployeeCaption_Control1000000055Lbl)
            {
            }
            column(NHIF_No_Caption_Control1000000053; NHIF_No_Caption_Control1000000053Lbl)
            {
            }
            column(Date_of_BirthCaption_Control1000000051; Date_of_BirthCaption_Control1000000051Lbl)
            {
            }
            column(ID_PassportCaption_Control1000000049; ID_PassportCaption_Control1000000049Lbl)
            {
            }
            column(AmountCaption_Control1000000005; AmountCaption_Control1000000005Lbl)
            {
            }
            column(Total_AmountCaption; Total_AmountCaptionLbl)
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
            column(Picture_CompanyInformation; CompInfo.Picture)
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
                Id := '';
                NhifNo := '';
                if Emp.Get("Assignment Matrix-X"."Employee No") then begin
                    NhifNo := Emp."NHIF No.";


                    if Emp."Last Name" = '' then begin
                        LastName := Emp."Middle Name";
                        FirstName := Emp."First Name";
                    end else begin
                        LastName := Emp."Last Name";
                        FirstName := Emp."First Name" + ' ' + Emp."Middle Name";
                    end;

                    Id := Emp."ID Number";
                    YEAR := Emp."Date Of Birth";
                    TotalAmount := TotalAmount + Abs("Assignment Matrix-X".Amount);
                end;
                Counter := Counter + 1;
                // if PrintToExcel then
                //     MakeExcelDataBody;
                if Counter > 1 then
                    Clear(CompInfo.Picture);

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69030);
                ApprovalEntries.SetRange("Document No.", Payrollheader);
                // ApprovalEntries.SetRange("Document No.");
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
                // MakeExcelHeader;
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
                //EmployerNHIFNo:=CompInfoSetup."N.H.I.F No";
                // CompPINNo:=CompInfoSetup."Company P.I.N";
                // Address:=CompInfoSetup."Maximum limit";
                //Tel:=CompInfoSetup."Repayment Period";
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
        DateSpecified := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X"."Payroll Period");
        EndDate1 := CalcDate('1M-1D', DateSpecified);
        NHIFCODE := "Assignment Matrix-X".GetRangeMin("Assignment Matrix-X".Code);
        Counter := 0;
    end;

    var
        DateSpecified: Date;
        Enddate1: Date;
        NhifNo: Code[20];
        Emp: Record Employee;
        Id: Code[20];
        FirstName: Text[30];
        LastName: Text[30];
        TotalAmount: Decimal;
        "Count": Integer;
        Deductions: Record "Assignment Matrix-X";
        EmployerNHIFNo: Code[20];
        DOB: Date;
        CompInfoSetup: Record "Loans transactionsX";
        "HR Details": Record Employee;
        CompPINNo: Code[20];
        YEAR: Date;
        Address: Text[90];
        Tel: Text[30];
        Counter: Integer;
        LastFieldNo: Integer;
        BeginDate: Date;
        NHIFCODE: Code[10];
        ExcelBuf: Record "Excel Buffer" temporary;
        Text002: Label 'NHIF';
        Text001: Label 'CIMBRIA';
        NAME_________________________________________________________________________CaptionLbl: Label 'NAME  .......................................................................';
        SIGNATURE___________________________________________________________CaptionLbl: Label 'SIGNATURE ..........................................................';
        DESIGNATION____________________________________________________________CaptionLbl: Label 'DESIGNATION ...........................................................';
        DATE_____________________________________________________________________CaptionLbl: Label 'DATE ....................................................................';

        PrintToExcel: Boolean;
        AmountCaptionLbl: Label 'Amount';
        ID_PassportCaptionLbl: Label 'ID/Passport';
        Date_of_BirthCaptionLbl: Label 'Date of Birth';
        PageCaptionLbl: Label 'Page';
        NHIF_No_CaptionLbl: Label 'NHIF No.';
        MONTHLY_PAYROLL__BY_PRODUCT__RETURNS_TO_NHIFCaptionLbl: Label 'MONTHLY PAYROLL (BY-PRODUCT) RETURNS TO NHIF';
        Name_of_EmployeeCaptionLbl: Label 'Name of Employee';
        EMPLOYER_NOCaptionLbl: Label 'EMPLOYER NO';
        Payroll_No_CaptionLbl: Label 'Payroll No.';
        PERIODCaptionLbl: Label 'PERIOD';
        EMPLOYERCaptionLbl: Label 'EMPLOYER';
        ADDRESSCaptionLbl: Label 'ADDRESS';
        EMPLOYER_PIN_NOCaptionLbl: Label 'EMPLOYER PIN NO';
        TEL_NOCaptionLbl: Label 'TEL NO';
        PageCaption_Control44Lbl: Label 'Page';
        UserCaptionLbl: Label 'User';
        NATIONAL_HOSPITAL_INSURANCE_FUND_REPORTCaptionLbl: Label 'NATIONAL HOSPITAL INSURANCE FUND REPORT';
        EMPLOYER_NOCaption_Control1000000008Lbl: Label 'EMPLOYER NO';
        PERIODCaption_Control1000000010Lbl: Label 'PERIOD';
        Payroll_No_Caption_Control1000000056Lbl: Label 'Payroll No.';
        Name_of_EmployeeCaption_Control1000000055Lbl: Label 'Name of Employee';
        NHIF_No_Caption_Control1000000053Lbl: Label 'NHIF No.';
        Date_of_BirthCaption_Control1000000051Lbl: Label 'Date of Birth';
        ID_PassportCaption_Control1000000049Lbl: Label 'ID/Passport';
        AmountCaption_Control1000000005Lbl: Label 'Amount';
        Total_AmountCaptionLbl: Label 'Total Amount';
        Text003: Label 'NHIF Report';
        CompInfo: Record "Company Information";
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

        // ExcelBuf.CreateBookAndOpenExcel('C:\bd\NHIF.xlsx', Text002, Text001, CompanyName, UserId);
        // Error('');

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
        //ExcelBuf.AddColumn(Employee."Last Name",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(LastName, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FirstName, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Id, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(NhifNo, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Number);
    end;

    [Scope('Internal')]
    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin

        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER CODE', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('00737', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:' + UpperCase(CompanyName), false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('NATIONAL WATER CONSERVATION & PIPELINE CORPORATION', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTH OF CONTRIBUTION:', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(UpperCase(Format(DateSpecified, 0, '<year4>-0<month>')), false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('LAST NAME', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('FIRST NAME', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('ID NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('NHIF NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('AMOUNT', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.NewRow;
        //ExcelBuf.NewRow;
    end;

    [Scope('Internal')]
    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin


        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        //ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);


        ExcelBuf.AddColumn('TOTAL', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalAmount, false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
    end;
}

