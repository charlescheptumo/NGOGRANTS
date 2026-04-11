report 50008 "Timesheet Report"
{
    ApplicationArea = All;
    Caption = 'Timesheet Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Timesheet Report.rdlc';
    dataset
    {

        dataitem("Time Sheet Header"; "Time Sheet Header")
        {
            RequestFilterFields = "Resource No.", "Pay Period";
            column(Month; "Pay Period")
            { }
            column(Compinfo_Picture; Compinfo.Picture)
            {

            }
            column(Name; EmpName)
            {

            }
            column(PayrollNumber; PayrollNumber)
            {

            }
            column(Position; Position)
            {

            }
            column(DutyStation; DutyStation)
            {

            }
            column(Country; Country)
            { }
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
            column(DateExamined; ApproverDate[2])
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
            dataitem("Time Sheet Line"; "Time Sheet Line")
            {
                DataItemLink = "Time Sheet No." = field("No.");
                column(Customer_TimeSheetLine; Customer)
                {
                }
                dataitem("Time Sheet Detail"; "Time Sheet Detail")
                {
                    DataItemLink = "Time Sheet No." = field("Time Sheet No."), "Time Sheet Line No." = field("Line No.");

                    column(Date_TimeSheetDetail; "Date")
                    {
                    }
                    column(Day; Day)
                    {

                    }
                    column(Quantity_TimeSheetDetail; Quantity)
                    {
                    }
                    column(Hours; Hours)
                    {

                    }
                    column(onLeave; onLeave)
                    {

                    }
                    column(Weekend; Weekend)
                    { }
                    column(Holiday; Holiday)
                    { }
                    column(Absent; Absent)
                    { }

                    trigger OnAfterGetRecord()
                    begin
                        Hours := '';
                        onLeave := false;
                        Weekend := true;
                        Holiday := false;
                        Absent := false;


                        DateRec.SetRange("Period Type", DateRec."Period Type"::Date);
                        DateRec.SetFilter("Period Start", '%1..', Date);
                        if DateRec.FindFirst() then
                            Day := DateRec."Period Name";

                        if Quantity = 0 then begin
                            CalendarMgmt.SetSource(CompInfo, CustomCalendarChange);
                            if CalendarMgmt.IsNonworkingDay(Date, CustomCalendarChange) then begin
                                Hours := GetNonWorkingDayDescription(Date);
                                if (Hours = '') and (Day in ['Saturday', 'Sunday']) then begin
                                    Hours := 'Weekend';
                                    // "Time Sheet Line".Customer := '';
                                end;
                                Holiday := true;
                            end else begin
                                HRLeaveApplication.Reset();
                                HRLeaveApplication.SetRange("Employee No", "Time Sheet Header"."Resource No.");
                                HRLeaveApplication.SetFilter("Start Date", '<=%1', "Time Sheet Detail".Date);
                                HRLeaveApplication.SetFilter("End Date", '>=%1', "Time Sheet Detail".Date);
                                HRLeaveApplication.SetRange(Status, HRLeaveApplication.Status::Approved);
                                if HRLeaveApplication.FindFirst() then begin
                                    Hours := 'On ' + HRLeaveApplication."Leave Type" + ' Leave';
                                    onLeave := true;
                                end;
                            end;
                        end else
                            Hours := Format(Quantity);

                        if Hours = '' then begin
                            TimeSheetDetail.Reset();
                            TimeSheetDetail.SetRange("Time Sheet No.", "Time Sheet No.");
                            TimeSheetDetail.SetRange(Date, Date);
                            if TimeSheetDetail.FindSet() then
                                TimeSheetDetail.CalcSums(Quantity);
                            if TimeSheetDetail.Quantity = 0 then begin
                                Hours := 'Absent';
                                Absent := true;
                            end;


                        end;
                        if not Absent and not Holiday and not onLeave then
                            Weekend := false;

                    end;
                }
            }
            trigger OnAfterGetRecord()
            begin
                if Emp.Get("Resource No.") then begin
                    EmpName := Emp.FullName();
                    PayrollNumber := Emp."No.";
                    Position := Emp."Job Title";
                    DutyStation := Emp."Current Duty Station";
                    Country := Emp."Country/Region Code";

                end;


                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 950);
                ApprovalEntries.SetRange("Document No.", "No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;
        }

    }
    requestpage
    {
        SaveValues = true;
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

    trigger OnPreReport()
    begin
        Compinfo.Get();
        Compinfo.CalcFields(Compinfo.Picture);

    end;

    var
        PayPeriod: Date;
        Emp: Record Employee;
        EmpName: Text[150];
        PayrollNumber: Code[20];
        Position: Text[100];
        DutyStation: Text[100];
        Country: Text[100];
        HRLeaveApplication: Record "HR Leave Application";
        DateRec: Record Date;
        Hours: Text[30];
        onLeave, Weekend, Holiday, Absent : boolean;
        Compinfo: Record "Company Information";
        CalendarMgmt: Codeunit "Calendar Management";
        CustomCalendarChange: Record "Customized Calendar Change";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        TimeSheetDetail: Record "Time Sheet Detail";
        i: Integer;
        Day: Text[20];

    local procedure GetNonWorkingDayDescription(StartingDate: Date): Text
    var
        BaseCalendarChange: Record "Base Calendar Change";

    begin
        BaseCalendarChange.Reset();
        BaseCalendarChange.SetRange("Base Calendar Code", Compinfo."Base Calendar Code");
        BaseCalendarChange.SetRange(Date, StartingDate);
        BaseCalendarChange.SetRange(Nonworking, true);
        if BaseCalendarChange.FindFirst() then
            exit(BaseCalendarChange.Description);

    end;

    local procedure GetWeekDay(StartingDate: Date): Text
    var
        DateRec: Record Date;
    begin
        DateRec.SetRange("Period Type", DateRec."Period Type"::Date);
        DateRec.SetFilter("Period Start", '%1..', StartingDate);
        if DateRec.FindFirst() then
            exit(DateRec."Period Name");
    end;
}
