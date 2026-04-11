codeunit 57013 GrantsQueries
{
    trigger OnRun()
    begin

    end;

    var
        tbl_dynasoftPortalUser: Record "Dynasoft Portal User";
        tbl_subAward: Record "Sub Award";
        tbl_subAwardMilestones: Record "Sub Award Milestones";
        tbl_subawardReportingSchedule: Record "Sub Award Reporting Schedule";
        tbl_subContractExtensionVoucher: record "Sub Contract Extension Voucher";
        vendor: Record Vendor;

    procedure fnGetPortalUser(email: Text; password: Text) data: Text
    var
        userName: text;
    begin
        tbl_dynasoftPortalUser.Reset();
        tbl_dynasoftPortalUser.SetRange("Authentication Email", email);
        tbl_dynasoftPortalUser.SetRange("Password Value", password);
        tbl_dynasoftPortalUser.SetRange("Record Type", tbl_dynasoftPortalUser."Record Type"::"Implementing partner");
        if tbl_dynasoftPortalUser.FindFirst() then begin
            vendor.Reset();
            vendor.SetRange("No.", tbl_dynasoftPortalUser."Record ID");
            If vendor.FindFirst() then begin
                userName := vendor.Name;
            end;
            data := 'sucesss*' + Format(tbl_dynasoftPortalUser."Change Password") + '*' + Format(tbl_dynasoftPortalUser.State) + '*' + Format(tbl_dynasoftPortalUser."Record ID") + '*' + tbl_dynasoftPortalUser."Full Name" + '*' + Format(userName);

        end else begin
            data := 'danger* Sorry, You have entered the wrong password or email. Kindly try again'
        end;
        exit(data);

    end;

    procedure fnGetGrantDetails(userId: code[20]) data: Text
    begin
        tbl_subAward.Reset();
        tbl_subAward.SetRange("Sub Awardee No", userId);
        if tbl_subAward.findset(true) then begin
            repeat
                data += Format(tbl_subAward."PFC No") + '*' + Format(tbl_subAward."Approved Amount") + '*' + Format(tbl_subAward."Sub-award End Date") + '*' + Format(tbl_subAward."Project Title") + '*' + tbl_subAward.Purpose + '*' + Format(tbl_subAward."Sub-award Start Date") + '*' + Format(tbl_subAward."Sub Awardee Name") + '*' + Format(tbl_subAward.No) + '::::';
            until tbl_subAward.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetSubAwardMilestones(awardNumber: Code[20]) data: Text
    begin
        tbl_subAwardMilestones.Reset();
        tbl_subAwardMilestones.SetRange("Sub Award No", awardNumber);
        if (tbl_subAwardMilestones.FindSet(true)) then begin
            repeat
                data += tbl_subAwardMilestones."Milestone Code" + '*' + tbl_subAwardMilestones."Milestone Description" + '*' + Format(tbl_subAwardMilestones."Milestone Start Date") + '*' + Format(tbl_subAwardMilestones."Milestone End Date") + '*' + Format(tbl_subAwardMilestones."Milestone Status") + '*' + Format(tbl_subAwardMilestones."Line No") + '*' + Format(tbl_subAwardMilestones."Payment tranche") + '*' + Format(tbl_subAwardMilestones.Disbursement) + '*' + tbl_subAwardMilestones."Milestone Description" + '::::';
            until tbl_subAwardMilestones.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetSubawardReportingSchedule(awardNumber: Code[20]) data: Text
    begin
        tbl_subawardReportingSchedule.Reset();
        tbl_subawardReportingSchedule.SetRange("Sub Award No", awardNumber);
        if tbl_subawardReportingSchedule.FindSet(true) then begin
            repeat
                data += Format(tbl_subawardReportingSchedule."Line No") + '*' + Format(tbl_subawardReportingSchedule.Type) + '*' + tbl_subawardReportingSchedule."Report Type Detailed" + '*' + Format(tbl_subawardReportingSchedule."Reporting Duration") + '*' + Format(tbl_subawardReportingSchedule."From Date") + '*' + Format(tbl_subawardReportingSchedule."To Date") + '*' + Format(tbl_subawardReportingSchedule."Duration Due to Report") + '*' + Format(tbl_subawardReportingSchedule."Due Date to Report") + '*' + Format(tbl_subawardReportingSchedule."Report Status") + '*' + tbl_subawardReportingSchedule."Report Due Date Narration" + '::::';
            until tbl_subawardReportingSchedule.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetUploadedReports(awardNumber: Code[20]) data: Text
    begin
        tbl_subawardReportingSchedule.Reset();
        tbl_subawardReportingSchedule.SetRange("Sub Award No", awardNumber);
        tbl_subawardReportingSchedule.SetRange("Report Status", tbl_subawardReportingSchedule."Report Status"::Submitted);
        if tbl_subawardReportingSchedule.FindSet(true) then begin
            repeat
                data += Format(tbl_subawardReportingSchedule."Line No") + '*' + Format(tbl_subawardReportingSchedule."Report Submitted On") + '*' + Format(tbl_subawardReportingSchedule."Report Status") + '*' + tbl_subawardReportingSchedule."File name" + '*' + tbl_subawardReportingSchedule."Submitted By Name" + '::::';
            until tbl_subawardReportingSchedule.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetSubawardNotifications() data: Text
    begin
        tbl_subawardReportingSchedule.Reset();
        repeat
            data += tbl_subawardReportingSchedule."Sub Award No" + '*' + Format(tbl_subawardReportingSchedule."Report Status") + '*' + Format(tbl_subawardReportingSchedule."Due Date to Report") + '::::';
        until tbl_subawardReportingSchedule.Next = 0;
        exit(data);
    end;

    procedure fnGetEtensionVouchers(awardNumber: Code[20]) data: Text
    begin
        tbl_subContractExtensionVoucher.Reset();
        tbl_subContractExtensionVoucher.SetRange("Sub Award No", awardNumber);
        tbl_subContractExtensionVoucher.SetRange("Extension Focus", tbl_subContractExtensionVoucher."Extension Focus"::"Sub Award Extension");
        if tbl_subContractExtensionVoucher.FindSet(true) then begin
            repeat
                data += Format(tbl_subContractExtensionVoucher."No.") + '*' + Format(tbl_subContractExtensionVoucher."Sub Award Start Date") + '*' + Format(tbl_subContractExtensionVoucher."Sub Award End Date") + '*' + Format(tbl_subContractExtensionVoucher."Extented On") + '*' + Format(tbl_subContractExtensionVoucher."Extend to Date") + '::::';
            until tbl_subContractExtensionVoucher.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetVendor(awardNumber: Code[20]) data: Text
    begin
        vendor.Reset();
        vendor.SetRange("No.", awardNumber);
        if vendor.FindFirst() then begin

            data += Format(vendor."No.") + '*' + Format(vendor."Primary Contact No.") + '*' + Format(vendor.Contact) + '*' + Format(vendor."Phone No.") + '*' + Format(vendor."E-Mail") + '::::';

        end;
        exit(data);

    end;


}