pageextension 50138 "Time Sheet Card Ext" extends "Time Sheet Card"
{
    PromotedActionCategories = 'Timesheet_Report,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home';
    layout
    {
        addafter("Ending Date")
        {
            field("Pay Period"; Rec."Pay Period")
            {
                ApplicationArea = All;
            }
            field(Status; rec.Status)
            {
                Editable = true;
                Visible = true;
                ApplicationArea = All;
            }
        }
        modify(TimeSheetLines)
        {
            Visible = false;
        }
        addafter(TimeSheetLines)
        {
            part(TimesheetLinesTest; "Time Sheet Lines Sub Custom")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Time Sheet No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        modify(Submit)
        {

            Visible = false;
        }
        addbefore(Submit)
        {
            action(SuggestHrs)
            {
                ApplicationArea = All;
                Caption = 'Suggest Hours', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //Visible = false;
                Image = LinesFromTimesheet;

                trigger OnAction()
                var
                    HoursPerDay: Decimal;
                begin

                    if not confirm('Do you want to suggest worked hours automatically based on the percentage distribution? Any work hours entered for this timesheet will be overwritten!') then
                        exit;
                    ResourcesSetup.Get();
                    ResourcesSetup.TestField("Daily Workhours");
                    CompInfo.Get();
                    CalendarMgmt.SetSource(CompInfo, CustomCalendarChange);

                    TimeSheetLine.Reset();
                    TimeSheetLine.SetRange("Time Sheet No.", Rec."No.");
                    if TimeSheetLine.FindSet() then
                        repeat

                            for Day := Rec."Starting Date" to calcdate('CM', Rec."Starting Date") do begin
                                if CalendarMgmt.IsNonworkingDay(Day, CustomCalendarChange) then
                                    HoursPerDay := 0
                                else
                                    HoursPerDay := ResourcesSetup."Daily Workhours" * TimeSheetLine."Distribution Percentage" / 100;

                                if TimeSheetDetail.Get(
                                             TimeSheetLine."Time Sheet No.",
                                             TimeSheetLine."Line No.",
                                             Day)
                                        then begin
                                    TimeSheetDetail.Quantity := HoursPerDay;
                                    TimeSheetDetail.Modify(true);
                                end else begin
                                    TimeSheetDetail.Init();
                                    TimeSheetDetail.CopyFromTimeSheetLine(TimeSheetLine);
                                    TimeSheetDetail.Date := Day;
                                    TimeSheetDetail.Quantity := HoursPerDay;
                                    TimeSheetDetail.Insert(true);
                                end;

                            end;
                            TimeSheetLine.CalcFields("Total Quantity");
                        until TimeSheetLine.Next() = 0;
                    CurrPage.Update(false);
                end;
            }
            action("Portal Documents")
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Opens attached documents from the portal.';
                RunObject = Page "Portal Documents";
                RunPageLink = ApplicationNo = field("No.");
            }
            action("Timesheet Report")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Opens Timesheet report.';
                trigger OnAction()
                var
                    TimeShtHeader: Record "Time Sheet Header";
                begin
                    TimeShtHeader.reset;
                    TimeShtHeader.SetRange("No.", rec."No.");
                    TimeShtHeader.SetRange("Resource No.", Rec."Resource No.");
                    TimeShtHeader.SetRange("Pay Period", Rec."Pay Period");
                    if TimeShtHeader.findset then
                        Report.Run(50008, true, true, TimeShtHeader);
                end;
            }
            action(ReopenSubmittedCust)
            {
                ApplicationArea = Jobs;
                Caption = '&Reopen';
                Image = ReOpen;
                Enabled = true;
                ToolTip = 'Reopen all submitted or rejected time sheet lines. Each line must have a Type defined. For dedicated line reopen select the Reopen action on the lines section.';

                trigger OnAction()
                begin
                    ReopenSubmittedLines();
                end;
            }
            // action(PopulateLeave)
            // {
            //     trigger OnAction()
            //     var
            //         HRLeaveApplication: Record "HR Leave Application";
            //         Hours: Text[30];
            //         onLeave, Weekend, Holiday, Absent : boolean;
            //     begin
            //         // HRLeaveApplication.Reset();
            //         // HRLeaveApplication.SetRange("Employee No", "Resource No.");
            //         // HRLeaveApplication.SetFilter("Start Date", '<=%1', Date);
            //         // HRLeaveApplication.SetFilter("End Date", '>=%1', Date);
            //         // HRLeaveApplication.SetRange(Status, HRLeaveApplication.Status::Approved);
            //         // if HRLeaveApplication.FindFirst() then begin
            //         //     Hours := 'On ' + HRLeaveApplication."Leave Type";
            //         //     onLeave := true;
            //         // end;
            //     end;
            // }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve1)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject1)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        LeaveApplication: Record "HR Leave Application";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }

            }
            group("Functions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocumentType: Enum "Approval Document Type";
                    begin
                        // DocumentType := Documenttype::"HR Leave";
                        DocumentType := Documenttype::"Time Sheets";

                        ApprovalEntries.SetRecordFilters(DATABASE::"Time Sheet Header", DocumentType, Rec."No.");
                        ApprovalEntries.RunModal();
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        TimeSheetLine.Reset();
                        TimeSheetLine.SetRange("Time Sheet No.", Rec."No.");
                        if TimeSheetLine.FindSet() then begin
                            TimeSheetLine.CalcSums("Distribution Percentage");
                            if TimeSheetLine."Distribution Percentage" <> 100 then
                                Error('The total distribution percentage in a timesheet should add up to 100. Please check your lines.');
                        end;
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }



            }
        }

    }
    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";

    begin
        DocType := DocType::"Time Sheets";
        CurrPage.TimeSheetLines.Page.SetColumns1(Rec."No.");
        CurrPage.TimesheetLinesTest.Page.SetColumns2(Rec."No.");
    end;

    var
        TimeSheetLine: Record "Time Sheet Line";
        TimeSheetDetail: Record "Time Sheet Detail";
        ResourcesSetup: Record "Resources Setup";
        CalendarMgmt: Codeunit "Calendar Management";
        CustomCalendarChange: Record "Customized Calendar Change";
        CompInfo: Record "Company Information";
        Day: Date;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;

    local procedure ReopenSubmittedLines()
    var
        IsHandled: Boolean;
        TimeSheetApprovalMgtExt: Codeunit "Time Sheet Approval Management";
        TimeSheetMgt: Codeunit "Time Sheet Management";

        RefActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject;
        EmploymentQst: Label 'Time Sheet: %1 for dates prior to the Employment Date: %2  for Resource user.Do you still want to submit open lines?', Comment = '%1=Time Sheet No; %2= Resource Employment Date';

    begin

        if TimeSheetApprovalMgtExt.ConfirmAction(RefActionType::ReopenSubmitted) then
            Process(RefActionType::ReopenSubmitted);
    end;

}
