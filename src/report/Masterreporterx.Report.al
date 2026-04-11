report 69012 "Master reporterx"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Masterreporterx.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem("Assignment Matrix-X"; "Assignment Matrix-X")
        {
            RequestFilterFields = "Payroll Period", Type, "Code", "Posting Group Filter";
            column(EmployeeNo_AssignmentMatrixX; "Assignment Matrix-X"."Employee No")
            {
            }
            column(Code_AssignmentMatrixX; "Assignment Matrix-X".Code)
            {
            }
            column(Description_AssignmentMatrixX; "Assignment Matrix-X".Description)
            {
            }
            column(Amount_AssignmentMatrixX; "Assignment Matrix-X".Amount)
            {
            }
            column(EmployerAmount_AssignmentMatrixX; "Assignment Matrix-X"."Employer Amount")
            {
            }
            column(EmployeeName_AssignmentMatrixX; "Assignment Matrix-X"."Employee Name")
            {
            }
            column(PayrollPeriod_AssignmentMatrixX; "Assignment Matrix-X"."Payroll Period")
            {
            }
            column(Name; Name)
            {
            }
            column(ClosingBalance_AssignmentMatrixX; "Assignment Matrix-X"."Closing Balance")
            {
            }
            column(ReferenceNo_AssignmentMatrixX; "Assignment Matrix-X"."Reference No")
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(Name_CompanyInformation; "Company Information".Name)
                {
                }
                column(Picture_CompanyInformation; "Company Information".Picture)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                // IF ("Assignment Matrix-X".Amount =0) AND ("Assignment Matrix-X"."Outstanding Amount" =0) THEN
                // CurrReport.SKIP;

                if Emp.Get("Employee No") then begin
                    Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    Id := Emp."ID Number";

                end;
                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Payment then begin
                    if Payment.Get("Assignment Matrix-X".Code) then begin
                        GroupHeader := Payment.Description;
                        Payment.SetRange(Payment."Employee Filter", "Employee No");
                        Payment.CalcFields(Payment."Total Amount");
                        Cumulative := Payment."Total Amount";
                    end;
                end;

                if "Assignment Matrix-X".Type = "Assignment Matrix-X".Type::Deduction then begin
                    if Deduction.Get("Assignment Matrix-X".Code) then begin
                        GroupHeader := Deduction.Description;
                        Deduction.SetRange(Deduction."Employee Filter", "Assignment Matrix-X"."Employee No");
                        Deduction.CalcFields(Deduction."Total Amount");
                        Cumulative := Deduction."Total Amount";
                    end;

                end;
                CodeHolder := "Assignment Matrix-X".Code;
                TotalEmployee := TotalEmployee + "Assignment Matrix-X".Amount;
                TotalEmployer := TotalEmployer + "Assignment Matrix-X"."Employer Amount";
                TotalBalance := TotalBalance + "Assignment Matrix-X"."Closing Balance";
                Counter := Counter + 1;
                // if PrintToExcel = true then
                //     MakeExcelDataBody;
            end;

            trigger OnPostDataItem()
            begin

                // if PrintToExcel = true then begin
                //     MakeExcelFooter;
                //     CreateExcelbook;
                // end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo(Code);
                TotalCum := 0;
                CurrReport.CreateTotals(Cumulative);
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
                field(PrintToExcel; PrintToExcel)
                {
                    Caption = 'Print To Excel?';
                    ApplicationArea = All;
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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Emp: Record Employee;
        Name: Text[50];
        Payment: Record EarningsX;
        Deduction: Record DeductionsX;
        TypeFilter: Text[80];
        GroupHeader: Text[80];
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodText: Text[80];
        ReportCaption: Text[80];
        DateSpecified: Date;
        PdCode: Code[10];
        Cumulative: Decimal;
        TotalCum: Decimal;
        CodeHolder: Code[10];
        GroupCode: Code[20];
        CUser: Code[20];
        ExcelBuf: Record "Excel Buffer" temporary;
        Counter: Decimal;
        TotalEmployee: Decimal;
        TotalEmployer: Decimal;
        TotalBalance: Decimal;
        PrintToExcel: Boolean;
        Id: Text[30];
        TotalFor: Label 'Total for ';
        Text002: Label 'DEDUCTION';
        Text001: Label 'KS';
        employeename: Text[100];
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        Text0001: Label 'Please specify payperiod for the report';

    [Scope('Internal')]
    procedure GetPayperiod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            PayPeriodText := PayPeriod.Name;
    end;

    [Scope('Internal')]
    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook('','');
        //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */
        // ExcelBuf.CreateBookAndOpenExcel('C:\bd\iTAX.xlsx', Text002, Text001, CompanyName, UserId);
        // Error('');

    end;

    [Scope('Internal')]
    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(counter,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Emp."No.", false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(Employee."Last Name",FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Name, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn(FirstName,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(NhifNo,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(Abs("Assignment Matrix-X".Amount), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Number);
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X"."Employer Amount"),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X"."Closing Balance"),FALSE,'',FALSE,FALSE,FALSE,'@');
    end;

    [Scope('Internal')]
    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        //ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('EMPLOYER CODE: 16437',FALSE,'',TRUE,FALSE,FALSE,'@');

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:' + UpperCase(CompanyName), false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('DEDUCTION:' +
        UpperCase(Format(DateSpecified, 0, '<month text> <year4>')), false, '', true, false, false, '@', ExcelBuf."Cell Type"::Date);
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('ID NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('PAYROLL NO', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('EMPLOYEE NAME', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('FIRST NAMES',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('I.D NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('N.H.I.F NO.',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('AMOUNT', false, '', true, false, false, '@', ExcelBuf."Cell Type"::Number);
        //ExcelBuf.AddColumn('COMPANY',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('BALANCE',FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
    end;

    [Scope('Internal')]
    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Employees :' + Format(Counter), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(Abs(TotalEmployee), false, '', false, false, false, '@', ExcelBuf."Cell Type"::Number);


        ExcelBuf.AddColumn(TotalEmployer, false, '', false, false, false, '@', ExcelBuf."Cell Type"::Number);
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalBalance, false, '', false, false, false, '', ExcelBuf."Cell Type"::Number);
    end;
}

