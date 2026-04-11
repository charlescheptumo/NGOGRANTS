codeunit 50018 "Page Management Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer);
    var

    begin
        if PageID = 0 then
            PageID := GetConditionalCardPageID(RecordRef);

        if PageID = 175 then
            PageID := GetConditionalCardPageID(RecordRef);


    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var

        Payments: Record Payments;
        procurementplan: Record "procurement plan";
        BankRec: Record "Bank Acc. Reconciliation";
        ProjectContractHeader: Record "Project Contract Header";
        Receipt: Record "Receipts Header1";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        HRLeaveApplication: Record "HR Leave Application";
        IFSTenderCommittee: Record "IFS Tender Committee";
        RFI: Record "Request For Information";
        BidTabulationHeader: Record "Bid Tabulation Header";
        PurchaseH: Record "Purchase Header";
        SubContractExtensionVoucher: Record "Sub Contract Extension Voucher";
        PayrollHeader: Record "Payroll Header";
        RecruitmentPlan: Record "Recruitment Plan";
        TrainingNeedsHeader: Record "Training Needs Header";
        TrainingPlanHeader: Record "Training Plan Header";
        TrainingRequests: Record "Training Requests";
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        PrequalificationScoreHeader: Record "Prequalification Score Header";
        RequestForInformation: Record "Request For Information";
        BidScoringTemplate: Record "Bid Scoring Template";
        BidEvaluationRegister: Record "Bid Evaluation Register";
        IFSPrebidRegister: Record "IFS Prebid Register";
        Timesheets: Record "Time Sheet Header";
        StandardPurchaseCode: Record "Standard Purchase Code";

    begin
        case RecordRef.Number of
            database::Payments:
                begin
                    RecordRef.SetTable(Payments);
                    exit(GetPaymentsPageID(RecordRef))
                end;
            Database::"Project Contract Header":
                begin
                    RecordRef.SetTable(ProjectContractHeader);
                    exit(Page::"Project Contract Card")
                end;
            Database::"Receipts Header1":
                begin
                    RecordRef.SetTable(Receipt);
                    exit(Page::"Receipt Card")
                end;
            Database::"Recruitment Requisition Header":
                begin
                    RecordRef.SetTable(RecruitmentRequisitionHeader);
                    exit(Page::"Recruitment Requisition")
                end;
            Database::"HR Leave Application":
                begin
                    RecordRef.SetTable(HRLeaveApplication);
                    exit(Page::"Leave Applications Card")
                end;
            Database::"Vacancy Announcement":
                begin
                    RecordRef.SetTable(VacancyAnnouncement);
                    exit(Page::"Vacancy Announcement Voucher")
                end;

            Database::"IFS Tender Committee":
                begin
                    RecordRef.SetTable(IFSTenderCommittee);
                    exit(GetIFSPageID(RecordRef))
                end;
            Database::"Request For Information":
                begin
                    RecordRef.SetTable(RFI);
                    exit(Page::"IFP Card")
                end;
            Database::"Bid Tabulation Header":
                begin
                    RecordRef.SetTable(BidTabulationHeader);
                    exit(Page::"Proffesion Opinion Card")
                end;
            Database::"Sub Contract Extension Voucher":
                begin
                    RecordRef.SetTable(SubContractExtensionVoucher);
                    exit(Page::"Sub Contract Extension Card")
                end;
            Database::"Payroll Header":
                begin
                    RecordRef.SetTable(PayrollHeader);
                    exit(Page::"Payroll Header")
                end;
            Database::"Recruitment Plan":
                begin
                    RecordRef.SetTable(RecruitmentPlan);
                    exit(Page::"Recruitment Plans")
                end;
            Database::"Procurement Plan":
                begin
                    RecordRef.SetTable(procurementplan);
                    exit(Page::"Procurement Plan Card")
                end;
            Database::"Training Plan Header":
                begin
                    RecordRef.SetTable(TrainingPlanHeader);
                    exit(Page::"Training Plan Header")
                end;
            Database::"Training Needs Header":
                begin
                    RecordRef.SetTable(TrainingNeedsHeader);
                    exit(Page::"Training Plan Header")
                end;
            Database::"Training Requests":
                begin
                    RecordRef.SetTable(TrainingRequests);
                    exit(Page::"Training Requisition")
                end;
            Database::"Perfomance Evaluation":
                begin
                    RecordRef.SetTable(PerfomanceEvaluation);
                    // exit(Page::"Standard Perform Appraisal")
                end;
            Database::"Prequalification Score Header":
                begin
                    RecordRef.SetTable(PrequalificationScoreHeader);
                    // exit(Page::"Standard Perform Appraisal")
                end;
            Database::"Bid Scoring Template":
                begin
                    RecordRef.SetTable(BidScoringTemplate);
                    exit(Page::"Bid Evaluation Template Card")
                end;
            Database::"Bid Evaluation Register":
                begin
                    RecordRef.SetTable(BidEvaluationRegister);
                    // exit(Page::"Standard Perform Appraisal")
                end;
            Database::"IFS Prebid Register":
                begin
                    RecordRef.SetTable(IFSPrebidRegister);
                    // exit(Page::"Standard Perform Appraisal")
                end;
            Database::"Time Sheet Header":
                begin
                    RecordRef.SetTable(Timesheets);
                    exit(Page::"Time Sheet Card")
                end;
            Database::"Standard Purchase Code":
                begin
                    RecordRef.SetTable(StandardPurchaseCode);
                    exit(GetStandardPurchaseCodePageID(RecordRef))
                end;
        end;
    end;



    local procedure GetIFSPageID(RecRef: RecordRef): Integer
    var
        IFSTenderCommittee: Record "IFS Tender Committee";

    begin
        RecRef.SetTable(IFSTenderCommittee);
        case IFSTenderCommittee.Type of
            IFSTenderCommittee.Type::Clustered:
                exit(Page::"Clustered Tender Committee");
            IFSTenderCommittee.Type::Individual:
                exit(Page::"IFS Tender Committee")
        end;

    end;

    local procedure GetPaymentsPageID(RecRef: RecordRef): Integer
    var
        Payment: Record Payments;
    begin
        RecRef.SetTable(Payment);
        case Payment."Payment Type" of
            Payment."Payment Type"::Imprest:
                exit(Page::"Imprest Requisition");
            Payment."Payment Type"::"Bank Transfer":
                exit(Page::"Bank Transfer");
            Payment."Payment Type"::Surrender:
                exit(Page::"Imprest Surrender");
            Payment."Payment Type"::"Petty Cash":
                exit(Page::"Petty Cash Voucher");
            Payment."Payment Type"::"Petty Cash Surrender":
                exit(Page::"Petty Cash Surrender");
            Payment."Payment Type"::"Staff Claim":
                exit(Page::"Staff Claim");
            Payment."Payment Type"::"Payment Voucher":
                exit(Page::"Payment Voucher");
            Payment."Payment Type"::"Standing Imprest":
                exit(Page::"Sub Recepient Fund Request");
            Payment."Payment Type"::"Standing Imprest Surrender":
                exit(Page::"Sub Recepient Surrender");

        end;
    end;

    local procedure GetStandardPurchaseCodePageID(RecRef: RecordRef): Integer
    var
        Payment: Record "Standard Purchase Code";
    begin
        RecRef.SetTable(Payment);
        case Payment."Procurement Method" of
            Payment."Procurement Method"::RFQ:
                exit(Page::"Request For Quotation (RFQ)");
            Payment."Procurement Method"::RFP:
                exit(Page::"Request For Proposal Card");
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", OnAfterGetPurchaseHeaderPageID, '', false, false)]
    local procedure OnAfterGetPurchaseHeaderPageID(RecRef: RecordRef; PurchaseHeader: Record "Purchase Header"; var Result: Integer);
    begin
        RecRef.SetTable(PurchaseHeader);
        case PurchaseHeader."Document Type" of
            PurchaseHeader."Document Type"::"Purchase Requisition":
                begin
                    if PurchaseHeader."PRN Type" = PurchaseHeader."PRN Type"::"Project Works" then
                        Result := Page::"Projects Works PRNs"
                    else
                        Result := Page::"Standard Purchase Requisition";
                end;
            PurchaseHeader."Document Type"::Quote:
                begin
                    Result := Page::"Bid Response Card";
                end;
        end;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", OnAfterGetPurchaseHeaderPageID, '', false, false)]
    // local procedure OnAfterGetPurchaseHeaderPageID(RecRef: RecordRef; PurchaseHeader: Record "Standard Purchase Code"; var Result: Integer);
    // begin
    //     RecRef.SetTable(PurchaseHeader);
    //     case PurchaseHeader."Procurement Method" of
    //         PurchaseHeader."Procurement Method"::RFQ:
    //             begin
    //                 Result := Page::"Request For Quotation (RFQ)";
    //             end;
    //         PurchaseHeader."Procurement Method"::RFP:
    //             begin
    //                 Result := Page::"Request For Proposal Card";
    //             end;
    //     end;
    // end;

}
