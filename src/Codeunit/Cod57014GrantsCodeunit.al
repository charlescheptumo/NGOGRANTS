codeunit 57014 GrantsCodeunit
{
    trigger OnRun()
    begin

    end;

    var
        tbl_dynasoftPortalUser: Record "Dynasoft Portal User";
        tbl_subAward: Record "Sub Award";
        tbl_subawardReportingSchedule: Record "Sub Award Reporting Schedule";


    procedure fnPasswordReset(email: Text; oldPassword: Text; newPassword: Text) data: Text
    begin
        tbl_dynasoftPortalUser.Reset();
        tbl_dynasoftPortalUser.SetRange("Authentication Email", email);
        tbl_dynasoftPortalUser.SetRange("Password Value", oldPassword);
        if tbl_dynasoftPortalUser.FindSet(true) then begin
            tbl_dynasoftPortalUser."Password Value" := newPassword;
            tbl_dynasoftPortalUser."Change Password" := true;
            tbl_dynasoftPortalUser."Last Modified Date" := Today;
            if tbl_dynasoftPortalUser.Modify(true) then begin
                data += 'success* Password reset was successful.';
            end else begin
                data += 'danger* Sorry, there was an error updating your details. Kindly try again later.'
            end;
        end else begin
            data += 'danger*User details provided are incorrect.';
        end;
    end;

    procedure fnSubmitMilestoneReport(reportNumber: Integer; subAwardNumber: Code[20]; fileName: Text[100]; submittedBy: Code[50]) status: Text
    begin
        tbl_subAward.Reset();
        tbl_subAward.SetRange(No, subAwardNumber);
        if tbl_subAward.FindSet(true) then begin
            tbl_subawardReportingSchedule.Reset();
            tbl_subawardReportingSchedule.SetRange("Sub Award No", subAwardNumber);
            tbl_subawardReportingSchedule.SetRange("Line No", reportNumber);
            if tbl_subawardReportingSchedule.FindSet(true) then begin
                tbl_subawardReportingSchedule."Report Status" := tbl_subawardReportingSchedule."Report Status"::Submitted;
                tbl_subawardReportingSchedule."Report Submitted On" := Today;
                tbl_subawardReportingSchedule."File name" := fileName;
                tbl_subawardReportingSchedule."Submitted By" := submittedBy;
                tbl_subawardReportingSchedule.Validate("Submitted By");
                if tbl_subawardReportingSchedule.Modify(true) then begin
                    status := 'success*Your report has been received successfully. It will be reviewed by the APHF team. Thank you.';
                end else begin
                    status := 'danger*Sorry, We could not update your record at the moment. Kindly try again later. Contact the administrator if this error persists';
                end;
            end else begin
                status := 'danger*Sorry, no such milestone report exists. Kindly contact APHF for more information';

            end;

        end else begin
            status := 'danger*Sorry, no such contract exists. Kindly contact APHF for more information';
        end;
        exit(status);
    end;

    procedure fnDeleteMilestoneReport(reportNumber: Integer; subAwardNumber: Code[20]) status: Text
    begin
        tbl_subAward.Reset();
        tbl_subAward.SetRange(No, subAwardNumber);
        if tbl_subAward.FindSet(true) then begin
            tbl_subawardReportingSchedule.Reset();
            tbl_subawardReportingSchedule.SetRange("Sub Award No", subAwardNumber);
            tbl_subawardReportingSchedule.SetRange("Line No", reportNumber);
            if tbl_subawardReportingSchedule.FindSet(true) then begin
                tbl_subawardReportingSchedule."Report Status" := tbl_subawardReportingSchedule."Report Status"::Pending;
                tbl_subawardReportingSchedule."Report Submitted On" := Today;
                tbl_subawardReportingSchedule."File name" := '';
                tbl_subawardReportingSchedule.Validate("Submitted By");
                if tbl_subawardReportingSchedule.Modify(true) then begin
                    status := 'success*Your report has been received successfully. It will be reviewed by the APHF team. Thank you.';
                end else begin
                    status := 'danger*Sorry, We could not update your record at the moment. Kindly try again later. Contact the administrator if this error persists';
                end;
            end else begin
                status := 'danger*Sorry, no such milestone report exists. Kindly contact APHF for more information';

            end;

        end else begin
            status := 'danger*Sorry, no such contract exists. Kindly contact APHF for more information';
        end;
        exit(status);
    end;
}