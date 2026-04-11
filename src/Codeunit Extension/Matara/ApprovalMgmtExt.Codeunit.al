codeunit 90100 "Approval Mgmt. Ext"

{
    Permissions = tabledata "Approval Entry" = RIMD;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Variant: Variant;
        BankRec: Record "Bank Acc. Reconciliation";
        ProjectContractHeader: Record "Project Contract Header";
        Receipt: Record "Receipts Header1";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        HRLeaveApplication: Record "HR Leave Application";
        IFSTenderCommittee: Record "IFS Tender Committee";
        RFI: Record "Request For Information";
        BidTabulationHeader: Record "Bid Tabulation Header";
        SubContractExtensionVoucher: Record "Sub Contract Extension Voucher";
        PayrollHeader: Record "Payroll Header";
        RecruitmentPlan: Record "Recruitment Plan";

        //purchase
        PurchaseHeader: Record "Purchase Header";

        //IFRCARD
        //RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";

        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //PV
        Payments: Record payments;

        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";

        //Training Needs
        TrainingNeedsHeader: Record "Training Needs Header";

        //Training Plan
        TrainingPlanHeader: Record "Training Plan Header";

        //Training Requests
        TrainingRequests: Record "Training Requests";

        PerfomanceEvaluation: Record "Perfomance Evaluation";
        PrequalificationScoreHeader: Record "Prequalification Score Header";
        RequestForInformation: Record "Request For Information";
        BidScoringTemplate: Record "Bid Scoring Template";
        BidEvaluationRegister: Record "Bid Evaluation Register";
        IFSPrebidRegister: Record "IFS Prebid Register";
        Timesheets: Record "Time Sheet Header";

        //Test
        Test: Record "Approval Test";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';

    begin
        case RecRef.Number of

            //purchase
            Database::"Purchase Header":
                begin
                    RecRef.SetTable(PurchaseHeader);
                    PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
                    PurchaseHeader.Validate(Status, PurchaseHeader.Status::Open);
                    PurchaseHeader.Modify;
                    Variant := PurchaseHeader;
                    Handled := true;
                end;


            //IFRCARD
            // Database::"Request For Information":
            //     begin
            //         RecRef.SetTable(RequestForInformation);
            //         RequestForInformation.Validate(Status, RequestForInformation.Status::Open);
            //         RequestForInformation.Modify;
            //         Variant := RequestForInformation;
            //         Handled := true;
            //     end;

            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Open);
                    procurementplan.Modify;
                    Variant := procurementplan;
                    Handled := true;
                end;
            //RFQ
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Open);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    Handled := true;
                end;


            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::Open);
                    ImprestMemo.Modify;
                    Variant := ImprestMemo;
                    Handled := true;
                end;

            //Test
            Database::"Approval Test":
                begin
                    RecRef.SetTable(Test);
                    Test.Validate(Status, Test.Status::Open);
                    Test.Modify;
                    Variant := Test;
                    Handled := true;
                end;
            DATABASE::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTenderCommittee);
                    IFSTenderCommittee.Validate("Approval Status", IFSTenderCommittee."Approval Status"::Open);
                    IFSTenderCommittee.Modify(true);
                    Variant := IFSTenderCommittee;
                    Handled := true;
                end;
            DATABASE::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(BidTabulationHeader);
                    BidTabulationHeader.Validate("Approval Status", BidTabulationHeader."Approval Status"::Open);
                    BidTabulationHeader.Modify(true);
                    Variant := BidTabulationHeader;
                    Handled := true;
                end;
            DATABASE::"Request For Information":
                begin
                    RecRef.SetTable(RFI);
                    RFI.Validate(Status, RFI.Status::Open);
                    RFI.Modify(true);
                    Variant := RFI;
                    Handled := true;
                end;
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    HRLeaveApplication.Validate(Status, HRLeaveApplication.Status::Open);
                    HRLeaveApplication.Modify(true);
                    Variant := HRLeaveApplication;
                    Handled := true;
                end;
            DATABASE::"Vacancy Announcement":
                begin
                    RecRef.SetTable(VacancyAnnouncement);
                    VacancyAnnouncement.Validate("Approval Status", VacancyAnnouncement."Approval Status"::Open);
                    VacancyAnnouncement.Modify(true);
                    Variant := VacancyAnnouncement;
                    Handled := true;
                end;
            DATABASE::"Bank Acc. Reconciliation":
                begin
                    RecRef.SetTable(BankRec);
                    BankRec.Validate(Status, BankRec.Status::Open);
                    BankRec.Modify(true);
                    Variant := BankRec;
                    Handled := true;
                end;
            DATABASE::Payments:
                begin
                    RecRef.SetTable(Payments);
                    Payments.Validate(Status, Payments.Status::Open);
                    Payments.Modify(true);
                    Variant := Payments;
                    Handled := true;
                end;
            DATABASE::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitmentRequisitionHeader);
                    RecruitmentRequisitionHeader.Validate("Approval Status", RecruitmentRequisitionHeader."Approval Status"::Open);
                    RecruitmentRequisitionHeader.Modify(true);
                    Variant := RecruitmentRequisitionHeader;
                    Handled := true;
                end;
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::Open);
                    Receipt.Modify(true);
                    Variant := Receipt;
                    Handled := true;
                end;
            Database::"Project Contract Header":
                begin
                    RecRef.SetTable(ProjectContractHeader);
                    ProjectContractHeader.Validate("Approval Status", ProjectContractHeader."Approval Status"::Open);
                    ProjectContractHeader.Modify(true);
                    Variant := ProjectContractHeader;
                    Handled := true;
                end;
            Database::"Sub Contract Extension Voucher":
                begin
                    RecRef.SetTable(SubContractExtensionVoucher);
                    SubContractExtensionVoucher.Validate(Status, SubContractExtensionVoucher.Status::Open);
                    SubContractExtensionVoucher.Modify(true);
                    Variant := SubContractExtensionVoucher;
                    Handled := true;
                end;
            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::Open);
                    PayrollHeader.Modify(true);
                    Variant := PayrollHeader;
                    Handled := true;
                end;
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(RecruitmentPlan);
                    RecruitmentPlan.Validate("Approval Status", RecruitmentPlan."Approval Status"::Open);
                    RecruitmentPlan.Modify(true);
                    Variant := RecruitmentPlan;
                    Handled := true;
                end;


            //Training Needs Header
            Database::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::Open);
                    TrainingNeedsHeader.Modify;
                    Variant := TrainingNeedsHeader;
                    Handled := true;
                end;

            //Training Plan Header
            Database::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    TrainingPlanHeader.Validate("Approved Status", TrainingPlanHeader."Approved Status"::Open);
                    TrainingPlanHeader.Modify;
                    Variant := TrainingPlanHeader;
                    Handled := true;
                end;
            //Training Requests
            Database::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    TrainingRequests.Validate(Status, TrainingRequests.Status::Open);
                    TrainingRequests.Modify;
                    Variant := TrainingRequests;
                    Handled := true;
                end;
            //Perfomance Evaluation
            Database::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(PerfomanceEvaluation);
                    PerfomanceEvaluation.Validate("Approval Status", PerfomanceEvaluation."Approval Status"::Open);
                    PerfomanceEvaluation.Modify;
                    Variant := PerfomanceEvaluation;
                    Handled := true;
                end;
            // Database::"Prequalification Score Header":
            //     begin
            //         RecRef.SetTable(PrequalificationScoreHeader);
            //         PrequalificationScoreHeader.Validate("Approval Status", PrequalificationScoreHeader."Approval Status"::Open);
            //         PrequalificationScoreHeader.Modify;
            //         Variant := PrequalificationScoreHeader;
            //         Handled := true;
            //     end;
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Open);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    Handled := true;
                end;
            // Database::"Bid Scoring Template":
            //     begin
            //         RecRef.SetTable(BidScoringTemplate);
            //         BidScoringTemplate.Validate("Approval Status", BidScoringTemplate."Approval Status"::Open);
            //         BidScoringTemplate.Modify;
            //         Variant := BidScoringTemplate;
            //         Handled := true;
            //     end;
            Database::"Bid Evaluation Register":
                begin
                    RecRef.SetTable(BidEvaluationRegister);
                    BidEvaluationRegister.Validate("Approval Status", BidEvaluationRegister."Approval Status"::Open);
                    BidEvaluationRegister.Modify;
                    Variant := BidEvaluationRegister;
                    Handled := true;
                end;
            // Database::"IFS Prebid Register":
            //     begin
            //         RecRef.SetTable(IFSPrebidRegister);
            //         IFSPrebidRegister.Validate("Approval Status", IFSPrebidRegister."Approval Status"::Open);
            //         IFSPrebidRegister.Modify;
            //         Variant := IFSPrebidRegister;
            //         Handled := true;
            //     end;

            //Timesheets
            Database::"Time Sheet Header":
                begin
                    RecRef.SetTable(Timesheets);
                    Timesheets.Validate(Status, Timesheets.Status::Open);
                    Timesheets.Modify;
                    Variant := Timesheets;
                    Handled := true;
                end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var

        Variant: Variant;

        //pavement
        //PavementTestHeader: Record "Pavement Test Header";
        //purchase
        purchaseheader: Record "Purchase Header";

        //IFRCARD
        // RequestForInformation: Record "Request For Information";

        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        Payments: record payments;
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";

        //Test
        Test: Record "Approval Test";
        ProjectContractHeader: Record "Project Contract Header";
        BankRec: Record "Bank Acc. Reconciliation";
        Receipt: Record "Receipts Header1";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        HRLeaveApplication: Record "HR Leave Application";
        IFSTenderCommittee: Record "IFS Tender Committee";
        RFI: Record "Request For Information";
        BidTabulationHeader: Record "Bid Tabulation Header";
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
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';

    begin
        Handled := true;
        case RecRef.Number of


            //purchase
            Database::"Purchase Header":
                begin
                    RecRef.SetTable(purchaseheader);
                    PurchaseHeader.Validate(Status, purchaseheader.Status::Released);
                    PurchaseHeader.Modify;
                    Variant := PurchaseHeader;
                end;
            //IFRCARD
            // Database::"Request For Information":
            //     begin
            //         RecRef.SetTable(RequestForInformation);
            //         RequestForInformation.Validate(Status, RequestForInformation.Status::Released);
            //         RequestForInformation.Modify;
            //         Variant := RequestForInformation;
            //     end;
            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Released);
                    procurementplan.Modify;
                    Variant := procurementplan;
                end;

            //rfq
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Released);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::Released);
                    ImprestMemo.Modify;
                    Variant := ImprestMemo;
                end;

            //Test
            Database::"Approval Test":
                begin
                    RecRef.SetTable(Test);
                    Test.Validate(Status, Test.Status::Released);
                    Test.Modify;
                    Variant := Test;
                end;
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);

                    HRLeaveApplication.Status := HRLeaveApplication.Status::Approved;
                    HRLeaveApplication.Modify();
                    Handled := true;
                    Variant := HRLeaveApplication;
                end;
            DATABASE::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(BidTabulationHeader);
                    BidTabulationHeader.Validate("Approval Status", BidTabulationHeader."Approval Status"::Released);
                    BidTabulationHeader.Modify();
                    Handled := true;
                    Variant := BidTabulationHeader;
                end;
            DATABASE::"Request For Information":
                begin
                    RecRef.SetTable(RFI);
                    RFI.Validate(Status, RFI.Status::Released);
                    RFI.Modify();
                    Handled := true;
                    Variant := RFI;
                end;
            DATABASE::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTenderCommittee);
                    IFSTenderCommittee.Validate("Approval Status", IFSTenderCommittee."Approval Status"::Released);
                    IFSTenderCommittee.Modify();
                    Handled := true;
                    Variant := IFSTenderCommittee;
                end;
            DATABASE::"Vacancy Announcement":
                begin
                    RecRef.SetTable(VacancyAnnouncement);
                    VacancyAnnouncement.Validate("Approval Status", VacancyAnnouncement."Approval Status"::Released);
                    VacancyAnnouncement.Modify();
                    Handled := true;
                    Variant := VacancyAnnouncement;
                end;
            DATABASE::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitmentRequisitionHeader);
                    RecruitmentRequisitionHeader.Validate("Approval Status", RecruitmentRequisitionHeader."Approval Status"::Approved);
                    RecruitmentRequisitionHeader.Modify();
                    Handled := true;
                    Variant := RecruitmentRequisitionHeader;
                end;
            DATABASE::"Bank Acc. Reconciliation":
                begin
                    RecRef.SetTable(BankRec);
                    BankRec.Validate(Status, BankRec.Status::Released);
                    BankRec.Modify();
                    Handled := true;
                    Variant := BankRec;
                end;
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::Released);
                    Receipt.Modify();
                    Handled := true;
                    Variant := Receipt;
                end;
            DATABASE::Payments:
                begin
                    RecRef.SetTable(Payments);
                    Payments.Validate(Status, Payments.Status::Approved);
                    Payments.Modify();
                    Handled := true;
                    Variant := Payments;
                end;
            DATABASE::"Project Contract Header":
                begin
                    RecRef.SetTable(ProjectContractHeader);
                    ProjectContractHeader.Validate("Approval Status", ProjectContractHeader."Approval Status"::Approved);
                    ProjectContractHeader.Modify();
                    Handled := true;
                    Variant := ProjectContractHeader;
                end;
            DATABASE::"Sub Contract Extension Voucher":
                begin
                    RecRef.SetTable(SubContractExtensionVoucher);
                    SubContractExtensionVoucher.Validate("Status", SubContractExtensionVoucher."Status"::Approved);
                    SubContractExtensionVoucher.Modify();
                    Handled := true;
                    Variant := SubContractExtensionVoucher;
                end;
            DATABASE::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate("Status", PayrollHeader."Status"::Approved);
                    PayrollHeader.Modify();
                    Handled := true;
                    Variant := PayrollHeader;
                end;
            DATABASE::"Recruitment Plan":
                begin
                    RecRef.SetTable(RecruitmentPlan);
                    RecruitmentPlan.Validate("Approval Status", RecruitmentPlan."Approval Status"::Approved);
                    RecruitmentPlan.Modify();
                    Handled := true;
                    Variant := RecruitmentPlan;
                end;

            //Training Needs Header
            Database::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::Released);
                    TrainingNeedsHeader.Modify;
                    Variant := TrainingNeedsHeader;
                    Handled := true;
                end;

            //Training Plan Header
            Database::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    TrainingPlanHeader.Validate("Approved Status", TrainingPlanHeader."Approved Status"::Released);
                    TrainingPlanHeader.Modify;
                    Variant := TrainingPlanHeader;
                    Handled := true;
                end;
            //Training Requests
            Database::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    TrainingRequests.Validate(Status, TrainingRequests.Status::Approved);
                    TrainingRequests.Modify;
                    Variant := TrainingRequests;
                    Handled := true;
                end;
            //Perfomance Evaluation
            Database::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(PerfomanceEvaluation);
                    PerfomanceEvaluation.Validate("Approval Status", PerfomanceEvaluation."Approval Status"::Released);
                    PerfomanceEvaluation.Modify;
                    Variant := PerfomanceEvaluation;
                    Handled := true;
                end;

            // DATABASE::"Prequalification Score Header":
            //     begin
            //         RecRef.SetTable(PrequalificationScoreHeader);

            //         PrequalificationScoreHeader.Status := PrequalificationScoreHeader.Status::Released;
            //         PrequalificationScoreHeader.Modify();
            //         Handled := true;
            //         Variant := PrequalificationScoreHeader;
            //     end;
            // DATABASE::"Bid Scoring Template":
            //     begin
            //         RecRef.SetTable(BidScoringTemplate);

            //         BidScoringTemplate.Status := BidScoringTemplate.Status::Released;
            //         BidScoringTemplate.Modify();
            //         Handled := true;
            //         Variant := BidScoringTemplate;
            //     end;
            DATABASE::"Bid Evaluation Register":
                begin
                    RecRef.SetTable(BidEvaluationRegister);

                    BidEvaluationRegister."Approval Status" := BidEvaluationRegister."Approval Status"::Released;
                    BidEvaluationRegister.Modify();
                    Handled := true;
                    Variant := BidEvaluationRegister;
                end;
            DATABASE::"Time Sheet Header":
                begin
                    RecRef.SetTable(Timesheets);
                    Timesheets.Validate(Status, Timesheets.Status::Approved);
                    Timesheets.Modify();
                    Handled := true;
                    Variant := Timesheets;
                end;
            // DATABASE::"IFS Prebid Register":
            //     begin
            //         RecRef.SetTable(IFSPrebidRegister);

            //         IFSPrebidRegister.Status := IFSPrebidRegister.Status::Released;
            //         IFSPrebidRegister.Modify();
            //         Handled := true;
            //         Variant := IFSPrebidRegister;
            //     end;
            else
                Handled := false;
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        //pavement
        // PavementTestHeader: Record "Pavement Test Header";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        //RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";

        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //Test
        Test: Record "Approval Test";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        Payments: Record Payments;
        ProjectContractHeader: Record "Project Contract Header";
        BankRec: Record "Bank Acc. Reconciliation";
        Receipt: Record "Receipts Header1";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        HRLeaveApplication: Record "HR Leave Application";
        IFSTenderCommittee: Record "IFS Tender Committee";
        RFI: Record "Request For Information";
        BidTabulationHeader: Record "Bid Tabulation Header";
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
    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of


            //purchase

            Database::"Purchase Header":
                begin
                    RecRef.SetTable(PurchaseHeader);
                    PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
                    PurchaseHeader.Validate(Status, PurchaseHeader.Status::"Pending Approval");
                    PurchaseHeader.Modify;
                    Variant := PurchaseHeader;
                    IsHandled := true;
                end;
            //IFRCARD

            // Database::"Request For Information":
            //     begin
            //         RecRef.SetTable(RequestForInformation);
            //         RequestForInformation.Validate(Status, RequestForInformation.Status::"Pending Approval");
            //         RequestForInformation.Modify;
            //         Variant := RequestForInformation;
            //         IsHandled := true;
            //     end;

            //procurement plan

            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::"Pending Approval");
                    procurementplan.Modify;
                    Variant := procurementplan;
                    IsHandled := true;
                end;
            //rfq

            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::"Pending Approval");
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    IsHandled := true;
                end;
            //pv
            Database::"Payments":
                begin
                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::"Pending Approval");
                    payments.Modify;
                    Variant := payments;
                    IsHandled := true;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Validate(Status, ImprestMemo.Status::"Pending Approval");
                    ImprestMemo.Modify;
                    Variant := ImprestMemo;
                    IsHandled := true;
                end;

            //Test
            Database::"Approval Test":
                begin
                    RecRef.SetTable(Test);
                    Test.Validate(Status, Test.Status::"Pending Approval");
                    Test.Modify;
                    Variant := Test;
                    IsHandled := true;
                end;
            DATABASE::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(BidTabulationHeader);
                    BidTabulationHeader.Validate("Approval Status", BidTabulationHeader."Approval Status"::"Pending Approval");
                    BidTabulationHeader.Modify();
                    Variant := BidTabulationHeader;
                    IsHandled := true;
                end;
            DATABASE::"Request For Information":
                begin
                    RecRef.SetTable(RFI);
                    RFI.Validate(Status, RFI.Status::"Pending Approval");
                    RFI.Modify();
                    Variant := RFI;
                    IsHandled := true;
                end;
            DATABASE::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTenderCommittee);
                    IFSTenderCommittee.Validate("Approval Status", IFSTenderCommittee."Approval Status"::"Pending Approval");
                    IFSTenderCommittee.Modify();
                    Variant := IFSTenderCommittee;
                    IsHandled := true;
                end;
            DATABASE::"Bank Acc. Reconciliation":
                begin
                    RecRef.SetTable(BankRec);
                    BankRec.Status := BankRec.Status::"Pending Approval";
                    BankRec.Modify();
                    Variant := BankRec;
                    IsHandled := true;
                end;
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Status := Receipt.Status::"Pending Approval";
                    Receipt.Modify();
                    Variant := Receipt;
                    IsHandled := true;
                end;
            DATABASE::Payments:
                begin
                    RecRef.SetTable(Payments);
                    Payments.Validate(Status, Payments.Status::"Pending Approval");
                    Payments.Modify();
                    Variant := Payments;
                    IsHandled := true;
                end;
            Database::"Project Contract Header":
                begin
                    RecRef.SetTable(ProjectContractHeader);
                    ProjectContractHeader.Validate("Approval Status", ProjectContractHeader."Approval Status"::"Pending Approval");
                    ProjectContractHeader.Modify();
                    Variant := ProjectContractHeader;
                    IsHandled := true;
                end;
            DATABASE::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitmentRequisitionHeader);
                    RecruitmentRequisitionHeader.Validate(RecruitmentRequisitionHeader."Approval Status", RecruitmentRequisitionHeader."Approval Status"::"Pending Approval");
                    RecruitmentRequisitionHeader.Modify();
                    Variant := RecruitmentRequisitionHeader;
                    IsHandled := true;
                end;
            DATABASE::"Vacancy Announcement":
                begin
                    RecRef.SetTable(VacancyAnnouncement);
                    VacancyAnnouncement.Validate("Approval Status", VacancyAnnouncement."Approval Status"::"Pending Approval");
                    VacancyAnnouncement.Modify();
                    Variant := VacancyAnnouncement;
                    IsHandled := true;
                end;
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    HRLeaveApplication.Validate(Status, HRLeaveApplication.Status::"Pending Approval");
                    HRLeaveApplication.Modify();
                    Variant := HRLeaveApplication;
                    IsHandled := true;
                end;

            DATABASE::"Sub Contract Extension Voucher":
                begin
                    RecRef.SetTable(SubContractExtensionVoucher);
                    SubContractExtensionVoucher.Validate(Status, SubContractExtensionVoucher.Status::"Pending Approval");
                    SubContractExtensionVoucher.Modify();
                    Variant := SubContractExtensionVoucher;
                    IsHandled := true;
                end;
            DATABASE::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::"Pending Approval");
                    PayrollHeader.Modify();
                    Variant := PayrollHeader;
                    IsHandled := true;
                end;
            DATABASE::"Recruitment Plan":
                begin
                    RecRef.SetTable(RecruitmentPlan);
                    RecruitmentPlan.Validate("Approval Status", RecruitmentPlan."Approval Status"::"Pending Approval");
                    RecruitmentPlan.Modify();
                    Variant := RecruitmentPlan;
                    IsHandled := true;
                end;
            //Training Needs Header
            Database::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::"Pending Approval");
                    TrainingNeedsHeader.Modify;
                    Variant := TrainingNeedsHeader;
                    IsHandled := true;
                end;

            //Training Plan Header
            Database::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    TrainingPlanHeader.Validate("Approved Status", TrainingPlanHeader."Approved Status"::"Pending Approval");
                    TrainingPlanHeader.Modify;
                    Variant := TrainingPlanHeader;
                    IsHandled := true;
                end;
            //Training Requests
            Database::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    TrainingRequests.Validate(Status, TrainingRequests.Status::Pending);
                    TrainingRequests.Modify;
                    Variant := TrainingRequests;
                    IsHandled := true;
                end;

            //Perfomance Evaluation
            Database::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(PerfomanceEvaluation);
                    PerfomanceEvaluation.Validate("Approval Status", PerfomanceEvaluation."Approval Status"::"Pending Approval");
                    PerfomanceEvaluation.Modify;
                    Variant := PerfomanceEvaluation;
                    IsHandled := true;
                end;
            // Database::"Prequalification Score Header":
            //     begin
            //         RecRef.SetTable(PrequalificationScoreHeader);
            //         PrequalificationScoreHeader.Validate("Approval Status", PrequalificationScoreHeader."Approval Status"::"Pending Approval");
            //         PrequalificationScoreHeader.Modify;
            //         Variant := PrequalificationScoreHeader;
            //         IsHandled := true;
            //     end;
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::"Pending Approval");
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    IsHandled := true;
                end;
            // Database::"Bid Scoring Template":
            //     begin
            //         RecRef.SetTable(BidScoringTemplate);
            //         BidScoringTemplate.Validate(Status, BidScoringTemplate."Approval Status"::"Pending Approval");
            //         BidScoringTemplate.Modify;
            //         Variant := procurementplan;
            //         IsHandled := true;
            //     end;
            Database::"Bid Evaluation Register":
                begin
                    RecRef.SetTable(BidEvaluationRegister);
                    BidEvaluationRegister.Validate("Approval Status", BidEvaluationRegister."Approval Status"::"Pending Approval");
                    BidEvaluationRegister.Modify;
                    Variant := BidEvaluationRegister;
                    IsHandled := true;
                end;
            Database::"Time Sheet Header":
                begin
                    RecRef.SetTable(Timesheets);
                    Timesheets.Validate(Status, Timesheets.Status::"Pending Approval");
                    Timesheets.Modify;
                    Variant := Timesheets;
                    IsHandled := true;
                end;
            // Database::"IFS Prebid Register":
            //     begin
            //         RecRef.SetTable(IFSPrebidRegister);
            //         IFSPrebidRegister.Validate("Approval Status", IFSPrebidRegister."Approval Status"::"Pending Approval");
            //         IFSPrebidRegister.Modify;
            //         Variant := IFSPrebidRegister;
            //         IsHandled := true;
            //     end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]

    procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; VAR ApprovalEntryArgument: Record "Approval Entry")
    var

        //pavement
        //PavementTestHeader: Record "Pavement Test Header";

        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        //RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //rfq
        StandardPurchaseCode: Record "Standard Purchase Code";
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //Test
        Test: Record "Approval Test";
        //Standing Imprest
        StandingImprest: Record "Imprest Memo";
        Payments: Record Payments;

        BankAccReconciliation: Record "Bank Acc. Reconciliation";
        ApprovalAmount: Decimal;
        ApprovalAmountLCY: Decimal;
        ProjectContractHeader: Record "Project Contract Header";
        Receipt: Record "Receipts Header1";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        HRLeaveApplication: Record "HR Leave Application";
        IFSTenderCommittee: Record "IFS Tender Committee";
        RFI: Record "Request For Information";
        BidTabulationHeader: Record "Bid Tabulation Header";
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
    begin
        ApprovalEntryArgument.INIT;
        ApprovalEntryArgument."Table ID" := RecRef.NUMBER;
        ApprovalEntryArgument."Record ID to Approve" := RecRef.RECORDID;
        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
        ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
        ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;

        CASE RecRef.NUMBER OF
            //pavement
            // DATABASE::"Pavement Test Header":
            //     BEGIN
            //         RecRef.SETTABLE(PavementTestHeader);
            //         ApprovalEntryArgument."Document No." := PavementTestHeader."Document No.";
            //     END;
            //purchase
            DATABASE::"Purchase Header":
                BEGIN
                    RecRef.SETTABLE(PurchaseHeader);
                    ApprovalEntryArgument."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";
                    ApprovalEntryArgument."Document No." := PurchaseHeader."No.";
                END;
            //IFRCARD
            // DATABASE::"Request For Information":
            //     BEGIN
            //         RecRef.SETTABLE(RequestForInformation);
            //         ApprovalEntryArgument."Document No." := RequestForInformation.Code;
            //     END;

            //procurement plan
            DATABASE::"procurement plan":
                BEGIN
                    RecRef.SETTABLE(procurementplan);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Procurement Plan Card";
                    ApprovalEntryArgument."Document No." := procurementplan.Code;
                END;

            //rfq
            DATABASE::"Standard Purchase Code":
                BEGIN
                    RecRef.SETTABLE(StandardPurchaseCode);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::RFQ;
                    ApprovalEntryArgument."Document No." := StandardPurchaseCode.Code;
                END;

            //Imprest memo
            DATABASE::"Imprest Memo":
                BEGIN
                    RecRef.SETTABLE(ImprestMemo);
                    ApprovalEntryArgument."Document No." := ImprestMemo."No.";
                END;
            //Test
            Database::"Approval Test":
                begin
                    RecRef.SetTable(test);
                    ApprovalEntryArgument."Document No." := Format(Test."Primary Key");
                end;
            Database::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTenderCommittee);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::IFS;
                    ApprovalEntryArgument."Document No." := IFSTenderCommittee."Document No.";
                end;
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RFI);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::RFI;
                    ApprovalEntryArgument."Document No." := RFI.Code;
                end;
            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(BidTabulationHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Quote;
                    ApprovalEntryArgument."Document No." := BidTabulationHeader.Code;
                end;
            DATABASE::Payments:
                begin
                    RecRef.SetTable(Payments);
                    Payments.CalcFields("Imprest Amount");
                    ApprovalAmount := Payments."Imprest Amount";
                    ApprovalAmountLCY := Payments."Total Amount";
                    case Payments."Payment Type" of
                        Payments."Payment Type"::Imprest:
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Advance;
                        Payments."Payment Type"::"Bank Transfer":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Bank Transfer";

                        Payments."Payment Type"::Surrender:
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Advance Surrender";
                        Payments."Payment Type"::"Petty Cash":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Petty Cash";
                        Payments."Payment Type"::"Petty Cash Surrender":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Petty Cash Surrender";
                        Payments."Payment Type"::"Staff Claim":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Claims";
                        Payments."Payment Type"::"Payment Voucher":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Payment Voucher";
                        Payments."Payment Type"::"Standing Imprest":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Sub Award Funds Request";
                        Payments."Payment Type"::"Standing Imprest Surrender":
                            ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Sub Award Funds Request Surrender";

                    end;

                    ApprovalEntryArgument."Document No." := Payments."No.";
                    //ApprovalEntryArgument."Salespers./Purch. Code" := SalesHeader."Salesperson Code";
                    ApprovalEntryArgument.Amount := ApprovalAmount;
                    ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
                    ApprovalEntryArgument."Currency Code" := Payments."Currency Code";
                    //ApprovalEntryArgument."Available Credit Limit (LCY)" := GetAvailableCreditLimit(SalesHeader);
                end;
            DATABASE::"Bank Acc. Reconciliation":
                begin
                    RecRef.SetTable(BankAccReconciliation);
                    ApprovalAmount := BankAccReconciliation."Balance Last Statement";// Payments."Imprest Amount";
                    ApprovalAmountLCY := BankAccReconciliation."Balance Last Statement";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Bank Reconciliation";
                    ApprovalEntryArgument."Document No." := BankAccReconciliation."Bank Account No." + ' ' + BankAccReconciliation."Statement No.";
                    //ApprovalEntryArgument."Salespers./Purch. Code" := SalesHeader."Salesperson Code";
                    ApprovalEntryArgument.Amount := ApprovalAmount;
                    ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
                    ApprovalEntryArgument."Currency Code" := Payments."Currency Code";
                    //ApprovalEntryArgument."Available Credit Limit (LCY)" := GetAvailableCreditLimit(SalesHeader);
                end;
            Database::"Project Contract Header":
                begin
                    RecRef.SetTable(ProjectContractHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Grant Funding Application";
                    ApprovalEntryArgument."Document No." := ProjectContractHeader."Project Contract No";

                end;
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Receipt Processing";
                    ApprovalEntryArgument."Document No." := Receipt."No.";
                end;
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitmentRequisitionHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Recruitment Requisition";
                    ApprovalEntryArgument."Document No." := RecruitmentRequisitionHeader."Document No.";
                end;
            Database::"Vacancy Announcement":
                begin
                    RecRef.SetTable(VacancyAnnouncement);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Vacancy Announcement";
                    ApprovalEntryArgument."Document No." := VacancyAnnouncement."Announcement No.";
                end;
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"HR Leave";
                    ApprovalEntryArgument."Document No." := HRLeaveApplication."Application Code";
                end;
            Database::"Sub Contract Extension Voucher":
                begin
                    RecRef.SetTable(SubContractExtensionVoucher);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Sub Contract Extension";
                    ApprovalEntryArgument."Document No." := SubContractExtensionVoucher."No.";
                end;
            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Salary Voucher";
                    ApprovalEntryArgument."Document No." := PayrollHeader."No.";
                end;
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(RecruitmentPlan);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Recruitment Plan";
                    ApprovalEntryArgument."Document No." := RecruitmentPlan."Document No.";
                end;
            DATABASE::"Training Plan Header":
                BEGIN
                    RecRef.SETTABLE(TrainingPlanHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Plan Header";
                    ApprovalEntryArgument."Document No." := TrainingPlanHeader.No;
                END;
            DATABASE::"Training Needs Header":
                BEGIN
                    RecRef.SETTABLE(TrainingNeedsHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Needs Header";
                    ApprovalEntryArgument."Document No." := TrainingNeedsHeader.Code;
                END;
            DATABASE::"Training Requests":
                BEGIN
                    RecRef.SETTABLE(TrainingRequests);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Requests";
                    ApprovalEntryArgument."Document No." := TrainingRequests.Code;
                END;
            DATABASE::"Perfomance Evaluation":
                BEGIN
                    RecRef.SETTABLE(PerfomanceEvaluation);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Perfomance Evaluation";
                    ApprovalEntryArgument."Document No." := PerfomanceEvaluation.No;
                END;
            Database::"Prequalification Score Header":
                begin
                    RecRef.SetTable(PrequalificationScoreHeader);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Prequalification Score Header";
                    ApprovalEntryArgument."Document No." := PrequalificationScoreHeader.Code;
                end;
            Database::"Bid Scoring Template":
                begin
                    RecRef.SetTable(BidScoringTemplate);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Bid Scoring Template";
                    ApprovalEntryArgument."Document No." := BidScoringTemplate."Document No";
                end;
            Database::"Bid Evaluation Register":
                begin
                    RecRef.SetTable(BidEvaluationRegister);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Bid Evaluation Register";
                    ApprovalEntryArgument."Document No." := BidEvaluationRegister.Code;
                end;
            Database::"IFS Prebid Register":
                begin
                    RecRef.SetTable(IFSPrebidRegister);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"IFS Prebid Register";
                    ApprovalEntryArgument."Document No." := IFSPrebidRegister.Code;
                end;
            Database::"Time Sheet Header":
                begin
                    RecRef.SetTable(Timesheets);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Time Sheets";
                    ApprovalEntryArgument."Document No." := Timesheets."No.";
                end;
        END;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnApproveApprovalRequest, '', false, false)]

    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry");
    var
        WFMngt: Codeunit "Workflow Management";
        AppMGt: Codeunit "Approvals Mgmt.";
        RecRef: RecordRef;
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        // RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //rfq
        StandardPurchaseCode: Record "Standard Purchase Code";
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //Test
        Test: Record "Approval Test";
        //Standing Imprest
        StandingImprest: Record "Imprest Memo";
        Payments: Record Payments;

        BankAccReconciliation: Record "Bank Acc. Reconciliation";
        ApprovalAmount: Decimal;
        ApprovalAmountLCY: Decimal;
        ProjectContractHeader: Record "Project Contract Header";
        Receipt: Record "Receipts Header1";
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        HRLeaveApplication: Record "HR Leave Application";
        IFSTenderCommittee: Record "IFS Tender Committee";
        RFI: Record "Request For Information";
        BidTabulationHeader: Record "Bid Tabulation Header";
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
        paymentvoucher: Record Payments;
    begin
        // code to change from Created to open

        ApprovalEntry.Reset();
        HandleNextApproval(ApprovalEntry."Document No.");

        // //pv
        // paymentvoucher.Reset();
        // paymentvoucher.SetRange("No.", ApprovalEntry."Document No.");
        // if paymentvoucher.find('-') then begin
        //     paymentvoucher.Status := paymentvoucher.Status::Approved;
        //     paymentvoucher.Modify();

        //     // if paymentvoucher."Document Type" = paymentvoucher."Document Type"::"Payment Voucher" then begin
        //     //     if Confirm('Do you want to post this Payment Voucher', true) then begin
        //     //         PVPost."Post Payment Voucher"(paymentvoucher);
        //     //     end;
        //     // end;
        // end;


        RecRef.Get(ApprovalEntry."Record ID to Approve");
        case RecRef.Number of
            database::"Purchase Header":
                begin
                    RecRef.SetTable(PurchaseHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        PurchaseHeader.Status := PurchaseHeader.Status::Released;
                        PurchaseHeader.Modify();
                    end;
                end;
            Database::"Approval Test":
                begin
                    RecRef.SetTable(Test);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        Test.Status := Test.Status::Released;
                        Test.Modify();
                    end;
                end;
            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Released);
                        procurementplan.Modify;
                    end;
                end;

            //rfq
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Released);
                        StandardPurchaseCode.Modify;
                    end;
                end;

            //Imprest Memo
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        ImprestMemo.Validate(Status, ImprestMemo.Status::Released);
                        ImprestMemo.Modify;
                    end;
                end;
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

                        HRLeaveApplication.Status := HRLeaveApplication.Status::Approved;
                        HRLeaveApplication.Modify();
                    end;
                end;
            DATABASE::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(BidTabulationHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        BidTabulationHeader.Validate("Approval Status", BidTabulationHeader."Approval Status"::Released);
                        BidTabulationHeader.Modify();
                    end;
                end;
            DATABASE::"Request For Information":
                begin
                    RecRef.SetTable(RFI);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        RFI.Validate(Status, RFI.Status::Released);
                        RFI.Modify();
                    end;
                end;
            DATABASE::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTenderCommittee);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        IFSTenderCommittee.Validate("Approval Status", IFSTenderCommittee."Approval Status"::Released);
                        IFSTenderCommittee.Modify();
                    end;
                end;
            DATABASE::"Vacancy Announcement":
                begin
                    RecRef.SetTable(VacancyAnnouncement);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        VacancyAnnouncement.Validate("Approval Status", VacancyAnnouncement."Approval Status"::Released);
                        VacancyAnnouncement.Modify();
                    end;
                end;
            DATABASE::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitmentRequisitionHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        RecruitmentRequisitionHeader.Validate("Approval Status", RecruitmentRequisitionHeader."Approval Status"::Approved);
                        RecruitmentRequisitionHeader.Modify();
                    end;
                end;
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        Receipt.Validate(Status, Receipt.Status::Released);
                        Receipt.Modify();
                    end;
                end;
            DATABASE::Payments:
                begin
                    RecRef.SetTable(Payments);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        Payments.Validate(Status, Payments.Status::Approved);
                        Payments.Modify();
                    end;
                end;
            DATABASE::"Project Contract Header":
                begin
                    RecRef.SetTable(ProjectContractHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        ProjectContractHeader.Validate("Approval Status", ProjectContractHeader."Approval Status"::Approved);
                        ProjectContractHeader.Modify();
                    end;
                end;
            DATABASE::"Sub Contract Extension Voucher":
                begin
                    RecRef.SetTable(SubContractExtensionVoucher);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        SubContractExtensionVoucher.Validate("Status", SubContractExtensionVoucher."Status"::Approved);
                        SubContractExtensionVoucher.Modify();
                    end;
                end;
            DATABASE::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        PayrollHeader.Validate("Status", PayrollHeader."Status"::Approved);
                        PayrollHeader.Modify();
                    end;
                end;
            DATABASE::"Recruitment Plan":
                begin
                    RecRef.SetTable(RecruitmentPlan);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        RecruitmentPlan.Validate("Approval Status", RecruitmentPlan."Approval Status"::Approved);
                        RecruitmentPlan.Modify();
                    end;
                end;

            DATABASE::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

                        TrainingPlanHeader."Approved Status" := TrainingPlanHeader."Approved Status"::Released;
                        TrainingPlanHeader.Modify();
                    end;
                end;
            DATABASE::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

                        TrainingNeedsHeader.Status := TrainingNeedsHeader.Status::Released;
                        TrainingNeedsHeader.Modify();
                    end;
                end;
            DATABASE::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

                        TrainingRequests.Status := TrainingRequests.Status::Approved;
                        TrainingRequests.Modify();
                    end;
                end;
            DATABASE::"Perfomance Evaluation":
                begin
                    RecRef.SetTable(PerfomanceEvaluation);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

                        PerfomanceEvaluation."Approval Status" := PerfomanceEvaluation."Approval Status"::Released;
                        PerfomanceEvaluation.Modify();
                    end;
                end;
            // DATABASE::"Prequalification Score Header":
            //     begin
            //         RecRef.SetTable(PrequalificationScoreHeader);
            //         if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

            //             PrequalificationScoreHeader.Status := PrequalificationScoreHeader.Status::Released;
            //             PrequalificationScoreHeader.Modify();
            //         end;
            //     end;
            // DATABASE::"Bid Scoring Template":
            //     begin
            //         RecRef.SetTable(BidScoringTemplate);
            //         if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

            //             BidScoringTemplate.Status := BidScoringTemplate.Status::Released;
            //             BidScoringTemplate.Modify();
            //         end;
            //     end;
            DATABASE::"Bid Evaluation Register":
                begin
                    RecRef.SetTable(BidEvaluationRegister);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

                        BidEvaluationRegister."Approval Status" := BidEvaluationRegister."Approval Status"::Released;
                        BidEvaluationRegister.Modify();
                    end;
                end;
            DATABASE::"Time Sheet Header":
                begin
                    RecRef.SetTable(Timesheets);
                    if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        Timesheets.Validate(Status, Timesheets.Status::Approved);
                        Timesheets.Modify();
                    end;
                end;
        // DATABASE::"IFS Prebid Register":
        //     begin
        //         RecRef.SetTable(IFSPrebidRegister);
        //         if not AppMGt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin

        //             IFSPrebidRegister.Status := IFSPrebidRegister.Status::Released;
        //             IFSPrebidRegister.Modify();
        //         end;
        //     end;
        end;
    end;
    //WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveJobApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    //Procedure to open Approval entries By Pius
    procedure HandleNextApproval(DocumentNo: Code[20])
    var
        ApprovalEntry: Record "Approval Entry";
        CurrentApprovalEntry: Record "Approval Entry";
        NextApprovalEntry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SequenceNo: Integer;
        MaxSequenceNo: Integer;
    begin
        ApprovalEntry.SetRange("Document No.", DocumentNo);
        if not ApprovalEntry.FindSet() then
            exit;

        // Find the maximum sequence number
        MaxSequenceNo := GetMaxSequenceNo(DocumentNo);

        // Check each sequence from 1 to MaxSequenceNo
        for SequenceNo := 1 to MaxSequenceNo - 1 do begin
            // Check if current sequence is approved
            if IsSequenceApproved(DocumentNo, SequenceNo) then begin
                // Check if next sequence exists and is created
                if GetApprovalEntryBySequence(NextApprovalEntry, DocumentNo, SequenceNo + 1) then begin
                    if NextApprovalEntry.Status = NextApprovalEntry.Status::Created then begin
                        // Change status from Created to Open
                        NextApprovalEntry.Validate(Status, NextApprovalEntry.Status::Open);
                        //NextApprovalEntry."Date-Time Sent for Approval" := CurrentDateTime;
                        NextApprovalEntry.Modify(true);

                        // Message('Approval sequence %1 opened for approver: %2',
                        //         SequenceNo + 1, NextApprovalEntry."Approver ID");
                    end;
                end;
            end;
        end;
    end;

    local procedure GetMaxSequenceNo(DocumentNo: Code[20]): Integer
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Document No.", DocumentNo);
        ApprovalEntry.SetCurrentKey("Sequence No.");
        if ApprovalEntry.FindLast() then
            exit(ApprovalEntry."Sequence No.");

        exit(0);
    end;

    local procedure IsSequenceApproved(DocumentNo: Code[20]; SequenceNo: Integer): Boolean
    var
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.SetRange("Document No.", DocumentNo);
        ApprovalEntry.SetRange("Sequence No.", SequenceNo);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);

        exit(ApprovalEntry.FindFirst());
    end;

    local procedure GetApprovalEntryBySequence(var ApprovalEntry: Record "Approval Entry"; DocumentNo: Code[20]; SequenceNo: Integer): Boolean
    begin
        ApprovalEntry.SetRange("Document No.", DocumentNo);
        ApprovalEntry.SetRange("Sequence No.", SequenceNo);

        exit(ApprovalEntry.FindFirst());
    end;

    // Alternative: Check specific sequence pairs
    procedure CheckAndOpenNextApproval(DocumentNo: Code[20]; CurrentSequenceNo: Integer)
    var
        NextApprovalEntry: Record "Approval Entry";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // Get the next approval in sequence
        if GetApprovalEntryBySequence(NextApprovalEntry, DocumentNo, CurrentSequenceNo + 1) then begin
            if NextApprovalEntry.Status = NextApprovalEntry.Status::Created then begin
                // Change status from Created to Open
                NextApprovalEntry.Validate(Status, NextApprovalEntry.Status::Open);
                NextApprovalEntry."Date-Time Sent for Approval" := CurrentDateTime;
                NextApprovalEntry.Modify(true);
                // Message('Next approval opened: Sequence %1 for %2',
                //         CurrentSequenceNo + 1, NextApprovalEntry."Approver ID");
            end;
        end;
    end;



}