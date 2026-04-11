Codeunit 59500 "Custom Approvals Codeunit"
{
    Permissions = tabledata "Approval Entry" = RIMD;
    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'No related approval workflow is enabled.';

        //pavement
        OnSendPavementApprovalRequestTxt: label 'Approval of a Pavement Lab Test is requested';
        RunWorkflowOnSendPavementForApprovalCode: label 'RUNWORKFLOWONSENDPAVEMENTFORAPPROVAL';
        OnCancelPavementApprovalRequestTxt: label 'An Approval of a Pavement Lab Test is canceled';
        RunWorkflowOnCancelPavementForApprovalCode: label 'RUNWORKFLOWONCANCELPAVEMENTFORAPPROVAL';

        //Project Schedule
        OnSendScheduleApprovalRequestTxt: label 'Approval of a Project Schedule is requested';
        RunWorkflowOnSendScheduleForApprovalCode: label 'RUNWORKFLOWONSENDSCHEDULEFORAPPROVAL';
        OnCancelScheduleApprovalRequestTxt: label 'An Approval of a Project Schedule is canceled';
        RunWorkflowOnCancelScheduleForApprovalCode: label 'RUNWORKFLOWONCANCELSCHEDULEFORAPPROVAL';

        //purchase requisition
        OnSendPurchaseApprovalRequestTxt: label 'Approval of a Purchase Requisition is requested';
        RunWorkflowOnSendPurchaseForApprovalCode: label 'RUNWORKFLOWONSENDPURCHASEFORAPPROVAL';
        OnCancelPurchaseApprovalRequestTxt: label 'An Approval of a Purchase Requisition  is canceled';
        RunWorkflowOnCancelPurchaseForApprovalCode: label 'RUNWORKFLOWONCANCELPURCHASEFORAPPROVAL';

        //ifRcard
        OnSendIFRApprovalRequestTxt: label 'Approval of an IFR is requested';
        RunWorkflowOnSendIFRForApprovalCode: label 'RUNWORKFLOWONSENDIFRFORAPPROVAL';
        OnCancelIFRApprovalRequestTxt: label 'An Approval of An IFR is canceled';
        RunWorkflowOnCancelIFRForApprovalCode: label 'RUNWORKFLOWONCANCELIFRFORAPPROVAL';

        //DraftIFS
        OnSendDraftIFSApprovalRequestTxt: label 'Approval of DraftIFS is requested';
        RunWorkflowOnSendDraftIFSForApprovalCode: label 'RUNWORKFLOWONSENDDRAFTIFSFORAPPROVAL';
        OnCancelDraftIFSApprovalRequestTxt: label 'An Approval of DraftIFS is canceled';
        RunWorkflowOnCancelDraftIFSForApprovalCode: label 'RUNWORKFLOWONCANCELDRAFTIFSFORAPPROVAL';

        //RFQ
        OnSendRFQApprovalRequestTxt: label 'Approval of RFQ is requested';
        RunWorkflowOnSendRFQForApprovalCode: label 'RUNWORKFLOWONRFQFORAPPROVAL';
        OnCancelRFQApprovalRequestTxt: label 'An Approval of RFQ  is canceled';
        RunWorkflowOnCancelRFQForApprovalCode: label 'RUNWORKFLOWONCANCELRFQFORAPPROVAL';

        //Procurement Plan
        OnSendProcPlanApprovalRequestTxt: label 'Approval of Procurement Plan is requested';
        RunWorkflowOnSendProcPlanForApprovalCode: label 'RUNWORKFLOWONPROCPLANFORAPPROVAL';
        OnCancelProcPlanApprovalRequestTxt: label 'An Approval of Procurement Plan is canceled';
        RunWorkflowOnCancelProcPlanForApprovalCode: label 'RUNWORKFLOWONCANCELProcPlanFORAPPROVAL';
        //PV
        OnSendPVApprovalRequestTxt: label 'Approval of a payments document  is requested';
        RunWorkflowOnSendPVForApprovalCode: label 'RUNWORKFLOWONSENDPVFORAPPROVAL';
        OnCancelPVApprovalRequestTxt: label 'An Approval of a Payments Document is canceled';
        RunWorkflowOnCancelPVForApprovalCode: label 'RUNWORKFLOWONCANCELPVFORAPPROVAL';

        //Imprest Memo
        OnSendIMApprovalRequestTxt: label 'Approval of an Imprest Memo Request is requested';
        RunWorkflowOnSendIMForApprovalCode: label 'RUNWORKFLOWONSENDIMFORAPPROVAL';
        OnCancelIMApprovalRequestTxt: label 'An Approval of Imprest Memo Request is canceled';
        RunWorkflowOnCancelIMForApprovalCode: label 'RUNWORKFLOWONCANCELIMFORAPPROVAL';

        //Interbank Transfers
        OnSendITApprovalRequestTxt: label 'Approval of an Interbank Transfer is requested';
        RunWorkflowOnSendITForApprovalCode: label 'RUNWORKFLOWONSENDITFORAPPROVAL';
        OnCancelITApprovalRequestTxt: label 'An Approval of an Interbank Transfer is canceled';
        RunWorkflowOnCancelITForApprovalCode: label 'RUNWORKFLOWONCANCELITFORAPPROVAL';
        //
        BudgetSendForApprovalEventDescTxt: Label 'Approval of a Budget is requested.';
        RunWorkflowOnSendBudgetForApprovalCode: label 'RUNWORKFLOWONSENDBUDGETFORAPPROVAL';
        RunWorkflowOnCancelBudgetForApprovalCode: label 'RUNWORKFLOWONCANCELBUDGETFORAPPROVAL';
        BudgetApprReqCancelledEventDescTxt: Label 'An approval request for a Budget has been canceled.';
        BudgetReleasedEventDescTxt: Label 'A Budget has been released.';
        ".....................1": Label '..................1';
        //Time Sheet
        TimesheetSendForApprovalEventDescTxt: Label 'Approval of a Timesheet is requested.';
        TimesheetApprReqCancelledEventDescTxt: Label 'An approval request for a Timesheet has been canceled.';
        timesheetReleasedEventDescTxt: Label 'A Timesheet has been released.';
        RunWorkflowOnSendTimesheetForApprovalCode: label 'RUNWORKFLOWONSENDTIMESHEETSFORAPPROVAL';
        RunWorkflowOnCancelTimesheetForApprovalCode: label 'RUNWORKFLOWONCANCELTIMESHEETSFORAPPROVAL';
        //"****Bank Rec**************": ;
        BankRecSendForApprovalEventDescTxt: Label 'Approval of a Bank Reconciliation is requested.';
        BankRecApprReqCancelledEventDescTxt: Label 'An approval request for a Bank Reconciliation has been canceled.';
        BankRecReleasedEventDescTxt: Label 'A Bank Reconciliation has been released.';
        RunWorkflowOnSendBankRecForApprovalCode: label 'RUNWORKFLOWONSENDBANKRECFORAPPROVAL';
        RunWorkflowOnCancelBankRecForApprovalCode: label 'RUNWORKFLOWONCANCELBANKRECAPPROVALREQUEST';
        //
        ProjectContractSendForApprovalEventDescTxt: Label 'Approval of a Project Contract is requested.';
        ProjectContractApprReqCancelledEventDescTxt: Label 'An approval request for a Project Contract has been canceled.';
        RunWorkflowOnSendProjectContractForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTCONTRACTFORAPPROVAL';
        RunWorkflowOnCancelProjectContractForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTCONTRACTFORAPPROVAL';
        //
        ReceiptSendForApprovalEventDescTxt: Label 'Approval of a Receipt is requested.';
        ReceiptApprReqCancelledEventDescTxt: Label 'An approval request for a Receipt has been canceled.';
        RunWorkflowOnSendReceiptForApprovalCode: label 'RUNWORKFLOWONSENDRECEIPTFORAPPROVAL';
        RunWorkflowOnCancelReceiptForApprovalCode: label 'RUNWORKFLOWONCANCELRECEIPTFORAPPROVAL';
        //
        VacancyAnnouncementApprReqCancelledEventDescTxt: Label 'An approval request for a Vacancy Announcement has been canceled.';
        VacancyAnnouncementReleasedEventDescTxt: Label 'A Vacancy Announcement has been released.';
        VacancyAnnouncementSendForApprovalEventDescTxt: Label 'Approval of a Vacancy Announcement is requested.';
        RunWorkflowOnSendVacancyAnnouncementForApprovalCode: label 'RUNWORKFLOWONSENDVACANCYANNOUNCEMENTFORAPPROVAL';
        RunWorkflowOnCancelVacancyAnnouncementForApprovalCode: label 'RUNWORKFLOWONCANCELVACANCYANNOUNCEMENTFORAPPROVAL';
        //
        HRLeaveApplicationApprReqCancelledEventDescTxt: Label 'An approval request for a HR Leave Application has been canceled.';
        HRLeaveApplicationReleasedEventDescTxt: Label 'A HR Leave Application has been released.';
        HRLeaveApplicationSendForApprovalEventDescTxt: Label 'Approval of a Leave Application is requested.';
        RunWorkflowOnSendHRLeaveApplicationForApprovalCode: label 'RUNWORKFLOWONSENDHRLEAVEAPPLICATIONFORAPPROVAL';
        // RunWorkflowOnCancelHRLeaveApplicationForApprovalCode: label 'RUNWORKFLOWONCANCELHRLEAVEAPPLICATIONFORAPPROVAL';
        RunWorkflowOnCancelHRLeaveApplicationForApprovalCode: label 'RUNWORKFLOWONCANCELHRLEAVEAPPLICATIONAPPROVALREQUEST';
        //
        RecruitmentRequisitionHeaderApprReqCancelledEventDescTxt: Label 'An approval request for a Recruitment Requisition has been canceled.';
        RecruitmentRequisitionHeaderSendForApprovalEventDescTxt: Label 'Approval of a Recruitment Requisition is requested.';
        RunWorkflowOnSendRecruitmentRequisitionHeaderForApprovalCode: label 'RUNWORKFLOWONSENDRECRUITMENTREQUISITIONHEADERFORAPPROVAL';
        RunWorkflowOnCancelRecruitmentRequisitionHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELRECRUITMENTREQUISITIONHEADERFORAPPROVAL';
        //
        IFSTenderCommitteeApprReqCancelledEventDescTxt: Label 'An approval request for a IFS Tender Committee has been canceled.';
        IFSTenderCommitteeSendForApprovalEventDescTxt: Label 'Approval of a IFS Tender Committee is requested.';
        RunWorkflowOnSendIFSTenderCommitteeForApprovalCode: label 'RUNWORKFLOWONSENDIFSTENDERCOMMITTEEFORAPPROVAL';
        RunWorkflowOnCancelIFSTenderCommitteeForApprovalCode: label 'RUNWORKFLOWONCANCELIFSTENDERCOMMITTEEFORAPPROVAL';
        //
        RFIApprReqCancelledEventDescTxt: Label 'An approval request for a Request For Information has been canceled.';
        RFISendForApprovalEventDescTxt: Label 'Approval of a Request For Information is requested.';
        RunWorkflowOnSendRFIForApprovalCode: label 'RUNWORKFLOWONSENDRFIFORAPPROVAL';
        RunWorkflowOnCancelRFIForApprovalCode: label 'RUNWORKFLOWONCANCELRFIFORAPPROVAL';
        //
        BidTabulationHeaderApprReqCancelledEventDescTxt: Label 'An approval request for a Bid Tabulation has been canceled.';
        BidTabulationHeaderSendForApprovalEventDescTxt: Label 'Approval of a Bid Tabulation is requested.';
        RunWorkflowOnSendBidTabulationHeaderForApprovalCode: label 'RUNWORKFLOWONSENDBIDTABULATIONHEADERFORAPPROVAL';
        RunWorkflowOnCancelBidTabulationHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELBIDTABULATIONHEADERFORAPPROVAL';
        //
        SubContractExtensionVoucherSendForApprovalEventDescTxt: Label 'Approval of a Sub Contract Extension Voucher is requested.';
        SubContractExtensionVoucherApprReqCancelledEventDescTxt: Label 'An approval request for a Sub Contract Extension Voucher has been canceled.';
        SubContractExtensionVoucherReleasedEventDescTxt: Label 'A Sub Contract Extension Voucher has been released.';
        RunWorkflowOnSendSubContractExtensionVoucherForApprovalCode: label 'RUNWORKFLOWONSENDSUBCONTRACTEXTENSIONVOUCHERFORAPPROVAL';
        RunWorkflowOnCancelSubContractExtensionVoucherForApprovalCode: label 'RUNWORKFLOWONCANCELSUBCONTRACTEXTENSIONVOUCHERFORAPPROVAL';
        //
        PayrollHeaderSendForApprovalEventDescTxt: Label 'Approval of a Payroll Header is requested.';
        PayrollHeaderApprReqCancelledEventDescTxt: Label 'An approval request for a Payroll Header has been canceled.';
        PayrollHeaderReleasedEventDescTxt: Label 'A Payroll Header has been released.';
        RunWorkflowOnSendPayrollHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPAYROLL HEADERFORAPPROVAL';
        RunWorkflowOnCancelPayrollHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPAYROLL HEADERAPPROVALREQUEST';

        // //Sandbox2
        // RunWorkflowOnSendPayrollHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPAYROLLHEADERFORAPPROVAL';
        // RunWorkflowOnCancelPayrollHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPAYROLLHEADERFORAPPROVAL';
        //Recruitment Plan
        RecruitmentPlanSendForApprovalEventDescTxt: Label 'Approval of a Recruitment Plan is requested.';
        RecruitmentPlanApprReqCancelledEventDescTxt: Label 'An approval request for a Recruitment Plan has been canceled.';
        RecruitmentPlanReleasedEventDescTxt: Label 'A Recruitment Plan has been released.';
        RunWorkflowOnSendRecruitmentPlanForApprovalCode: label 'RUNWORKFLOWONSENDRECRUITMENTPLANFORAPPROVAL';
        RunWorkflowOnCancelRecruitmentPlanForApprovalCode: label 'RUNWORKFLOWONCANCELRECRUITMENTPLANFORAPPROVAL';
        //Test
        TestSendForApprovalEventDescTxt: Label 'Approval of a Test is requested.';
        TestApprReqCancelledEventDescTxt: Label 'An approval request for a Test has been canceled.';
        TestReleasedEventDescTxt: Label 'A Test has been released.';
        RunWorkflowOnSendTestForApprovalCode: label 'RUNWORKFLOWONSENDTESTFORAPPROVAL';
        RunWorkflowOnCancelTestForApprovalCode: label 'RUNWORKFLOWONCANCELTESTFORAPPROVAL';

        //Training Needs Header
        OnSendTrainingNeedsHeaderApprovalRequestTxt: label 'Approval of a Training Needs Header document  is requested';
        RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGNEEDSHEADERFORAPPROVAL';
        OnCancelTrainingNeedsHeaderApprovalRequestTxt: label 'An Approval of a Training Needs Header Document is canceled';
        RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGNEEDSHEADERFORAPPROVAL';

        //Training Plan Header
        OnSendTrainingPlanHeaderApprovalRequestTxt: label 'Approval of a Training Plan Header document  is requested';
        RunWorkflowOnSendTrainingPlanHeaderForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGPLANHEADERFORAPPROVAL';
        OnCancelTrainingPlanHeaderApprovalRequestTxt: label 'An Approval of a Training Plan Header Document is canceled';
        RunWorkflowOnCancelTrainingPlanHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGPLANHEADERFORAPPROVAL';

        //Training Requests
        OnSendTrainingRequestsApprovalRequestTxt: label 'Approval of a Training Requests document  is requested';
        RunWorkflowOnSendTrainingRequestsForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGREQUESTSFORAPPROVAL';
        OnCancelTrainingRequestsApprovalRequestTxt: label 'An Approval of a Training Requests Document is canceled';
        RunWorkflowOnCancelTrainingRequestsForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGREQUESTSFORAPPROVAL';

        //Perfomance Evaluation
        OnSendPerfomanceEvaluationApprovalRequestTxt: label 'Approval of a Perfomance Evaluation document  is requested';
        RunWorkflowOnSendPerfomanceEvaluationForApprovalCode: label 'RUNWORKFLOWONSENDPERFOMANCEEVALUATIONFORAPPROVAL';
        OnCancelPerfomanceEvaluationApprovalRequestTxt: label 'An Approval of a Perfomance Evaluation Document is canceled';
        RunWorkflowOnCancelPerfomanceEvaluationForApprovalCode: label 'RUNWORKFLOWONCANCELPERFOMANCEEVALUATIONFORAPPROVAL';

        //Prequalification Score Header
        OnSendPrequalificationScoreHeaderApprovalRequestTxt: label 'Approval of a Prequalification Score Header document  is requested';
        RunWorkflowOnSendPrequalificationScoreHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPREQUALIFICATIONSCOREHEADERFORAPPROVAL';
        OnCancelPrequalificationScoreHeaderApprovalRequestTxt: label 'An Approval of a Prequalification Score Header Document is canceled';
        RunWorkflowOnCancelPrequalificationScoreHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPREQUALIFICATIONSCOREHEADERFORAPPROVAL';

        //Request For Information 
        OnSendRequestForInformationApprovalRequestTxt: label 'Approval of a Request For Information document  is requested';
        RunWorkflowOnSendRequestForInformationForApprovalCode: label 'RUNWORKFLOWONSENDREQUESTFORINFORMATIONFORAPPROVAL';
        OnCancelRequestForInformationApprovalRequestTxt: label 'An Approval of a Request For Information Document is canceled';
        RunWorkflowOnCancelRequestForInformationForApprovalCode: label 'RUNWORKFLOWONCANCELREQUESTFORINFORMATIONFORAPPROVAL';

        //Bid Scoring Template
        OnSendBidScoringTemplateApprovalRequestTxt: label 'Approval of a Bid Scoring Template document  is requested';
        RunWorkflowOnSendBidScoringTemplateForApprovalCode: label 'RUNWORKFLOWONSENDBIDSCORINGTEMPLATEFORAPPROVAL';
        OnCancelBidScoringTemplateApprovalRequestTxt: label 'An Approval of a Bid Scoring Template Document is canceled';
        RunWorkflowOnCancelBidScoringTemplateForApprovalCode: label 'RUNWORKFLOWONCANCELBIDSCORINGTEMPLATEFORAPPROVAL';

        //Bid Evaluation Register
        OnSendBidEvaluationRegisterApprovalRequestTxt: label 'Approval of a Bid Evaluation Register document  is requested';
        RunWorkflowOnSendBidEvaluationRegisterForApprovalCode: label 'RUNWORKFLOWONSENDBIDEVALUATIONREGISTERFORAPPROVAL';
        OnCancelBidEvaluationRegisterApprovalRequestTxt: label 'An Approval of a Bid Evaluation Register Document is canceled';
        RunWorkflowOnCancelBidEvaluationRegisterForApprovalCode: label 'RUNWORKFLOWONCANCELBIDEVALUATIONREGISTERFORAPPROVAL';

        //IFS Prebid Register
        OnSendIFSPrebidRegisterApprovalRequestTxt: label 'Approval of a IFS Prebid Register document  is requested';
        RunWorkflowOnSendIFSPrebidRegisterForApprovalCode: label 'RUNWORKFLOWONSENDIFSPREBIDREGISTERFORAPPROVAL';
        OnCancelIFSPrebidRegisterApprovalRequestTxt: label 'An Approval of a IFS Prebid Register Document is canceled';
        RunWorkflowOnCancelIFSPrebidRegisterForApprovalCode: label 'RUNWORKFLOWONCANCELIFSPREBIDREGISTERFORAPPROVAL';

        //Timesheets
        // OnSendEmpTimesheetsApprovalRequestTxt: label 'Approval of an Employee Timesheets document  is requested';
        // RunWorkflowOnSendEmpTimesheetsForApprovalCode: label 'RUNWORKFLOWONSENDEMPTIMESHEETSFORAPPROVAL';
        // OnCancelEmpTimesheetsApprovalRequestTxt: label 'An Approval of an Employee Timesheets Document is canceled';
        // RunWorkflowOnCancelEmpTimesheetsForApprovalCode: label 'RUNWORKFLOWONCANCELEMPTIMESHEETSFORAPPROVAL';

        //Award Extension
        AwardContractExtensionVoucherSendForApprovalEventDescTxt: Label 'Approval of an Award Contract Addendum is requested.';
        AwardContractExtensionVoucherApprReqCancelledEventDescTxt: Label 'An approval request for an Award Contract Addendum has been canceled.';
        AwardContractExtensionVoucherReleasedEventDescTxt: Label 'An Award Contract Addendum has been released.';
        RunWorkflowOnSendAwardContractExtensionVoucherForApprovalCode: label 'RUNWORKFLOWONSENDAWARDCONTRACTEXTENSIONVOUCHERFORAPPROVAL';
        RunWorkflowOnCancelAwardContractExtensionVoucherForApprovalCode: label 'RUNWORKFLOWONCANCELAWARDCONTRACTEXTENSIONVOUCHERFORAPPROVAL';



    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of


            //pURCHASE
            Database::"Purchase Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPurchaseForApprovalCode));
            //IFRCARD
            //Database::"Request For Information":
            //exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFRForApprovalCode));
            //DraftIFS

            //procurement Plan
            Database::"Procurement Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProcPlanForApprovalCode));
            //RFQ
            Database::"Standard Purchase Code":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRFQForApprovalCode));
            //PV
            Database::Payments:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPVForApprovalCode));
            //Imprest Memo
            Database::"Imprest Memo":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIMForApprovalCode));
            DATABASE::"IFS Tender Committee":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFSTenderCommitteeForApprovalCode));
            DATABASE::"Bid Tabulation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBidTabulationHeaderForApprovalCode));
            DATABASE::"Request For Information":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRFIForApprovalCode));
            DATABASE::"HR Leave Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRLeaveApplicationForApprovalCode));
            DATABASE::"Vacancy Announcement":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVacancyAnnouncementForApprovalCode));
            DATABASE::"Bank Acc. Reconciliation":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBankRecForApprovalCode));
            DATABASE::"Recruitment Requisition Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecruitmentRequisitionHeaderForApprovalCode));
            Database::"Receipts Header1":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendReceiptForApprovalCode));
            Database::"Project Contract Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectContractForApprovalCode));
            Database::"Sub Contract Extension Voucher":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSubContractExtensionVoucherForApprovalCode));
            Database::"Award Extension":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAwardContractExtensionVoucherForApprovalCode));
            Database::"Payroll Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPayrollHeaderForApprovalCode));
            Database::"Recruitment Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecruitmentPlanForApprovalCode));

            Database::"Approval Test":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTestForApprovalCode));
            Database::"Training Needs Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode));
            Database::"Training Plan Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingPlanHeaderForApprovalCode));
            Database::"Training Requests":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingRequestsForApprovalCode));
            Database::"Perfomance Evaluation":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPerfomanceEvaluationForApprovalCode));
            Database::"Prequalification Score Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPrequalificationScoreHeaderForApprovalCode));
            Database::"Request For Information":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRequestForInformationForApprovalCode));
            Database::"Bid Scoring Template":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBidScoringTemplateForApprovalCode));
            Database::"Bid Evaluation Register":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBidEvaluationRegisterForApprovalCode));
            Database::"IFS Prebid Register":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFSPrebidRegisterForApprovalCode));
            //Timesheets
            Database::"Time Sheet Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTimesheetForApprovalCode));

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin

        //Timesheets
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTimesheetForApprovalCode, DATABASE::"Time Sheet Header",
        TimesheetSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTimesheetForApprovalCode, DATABASE::"Time Sheet Header",
        TimesheetApprReqCancelledEventDescTxt, 0, false);
        //HRLeaveApplication
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRLeaveApplicationForApprovalCode, DATABASE::"HR Leave Application",
        //   HRLeaveApplicationSendForApprovalEventDescTxt, 0, false);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRLeaveApplicationForApprovalCode, DATABASE::"HR Leave Application",
        //   HRLeaveApplicationApprReqCancelledEventDescTxt, 0, false);

        // //PayrollHeader
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPayrollHeaderForApprovalCode, DATABASE::"Payroll Header",
        // PayrollHeaderSendForApprovalEventDescTxt, 0, false);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPayrollHeaderForApprovalCode, DATABASE::"Payroll Header",
        //    PayrollHeaderApprReqCancelledEventDescTxt, 0, false);

        // //AwardContractExtensionVoucher
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendAwardContractExtensionVoucherForApprovalCode, DATABASE::"Award Extension",
        // AwardContractExtensionVoucherSendForApprovalEventDescTxt, 0, false);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelAwardContractExtensionVoucherForApprovalCode, DATABASE::"Award Extension",
        //    AwardContractExtensionVoucherApprReqCancelledEventDescTxt, 0, false);



        /* 
                //Purchase
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnSendPurchaseForApprovalCode, Database::"Purchase Header", OnSendPurchaseApprovalRequestTxt, 0, false);
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnCancelPurchaseForApprovalCode, Database::"Purchase Header", OnCancelPurchaseApprovalRequestTxt, 0, false);
                //IFPCARD
                // WorkFlowEventHandling.AddEventToLibrary(
                // RunWorkflowOnSendIFRForApprovalCode, Database::"Request For Information", OnSendIFRApprovalRequestTxt, 0, false);
                // WorkFlowEventHandling.AddEventToLibrary(
                // RunWorkflowOnCancelIFRForApprovalCode, Database::"Request For Information", OnCancelIFRApprovalRequestTxt, 0, false);
                //Procurement Plan
                WorkFlowEventHandling.AddEventToLibrary(
                       RunWorkflowOnSendProcPlanForApprovalCode, Database::"Procurement Plan", OnSendProcPlanApprovalRequestTxt, 0, false);
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnCancelProcPlanForApprovalCode, Database::"Procurement Plan", OnCancelProcPlanApprovalRequestTxt, 0, false);

                //RFQ
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnSendRFQForApprovalCode, Database::"Standard Purchase Code", OnSendRFQApprovalRequestTxt, 0, false);
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnCancelRFQForApprovalCode, Database::"Standard Purchase Code", OnCancelRFQApprovalRequestTxt, 0, false);

                //PV
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnSendPVForApprovalCode, Database::"Payments", OnSendPVApprovalRequestTxt, 0, false);
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnCancelPVForApprovalCode, Database::"Payments", OnCancelPVApprovalRequestTxt, 0, false);

                //Imprest Memo
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnSendIMForApprovalCode, Database::"Imprest Memo", OnSendIMApprovalRequestTxt, 0, false);
                WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnCancelIMForApprovalCode, Database::"Imprest Memo", OnCancelIMApprovalRequestTxt, 0, false);

                //BankRec
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendBankRecForApprovalCode, DATABASE::"Bank Acc. Reconciliation",
                BankRecSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBankRecForApprovalCode, DATABASE::"Bank Acc. Reconciliation",
                   BankRecApprReqCancelledEventDescTxt, 0, false);

                //BidTabulationHeader
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendBidTabulationHeaderForApprovalCode, DATABASE::"Bid Tabulation Header",
                BidTabulationHeaderSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBidTabulationHeaderForApprovalCode, DATABASE::"Bid Tabulation Header",
                 BidTabulationHeaderApprReqCancelledEventDescTxt, 0, false);

                //IFSTenderCommittee
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendIFSTenderCommitteeForApprovalCode, DATABASE::"IFS Tender Committee",
                  IFSTenderCommitteeSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelIFSTenderCommitteeForApprovalCode, DATABASE::"IFS Tender Committee",
                  IFSTenderCommitteeApprReqCancelledEventDescTxt, 0, false);

                //RFI
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRFIForApprovalCode, DATABASE::"Request For Information",
                  RFISendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRFIForApprovalCode, DATABASE::"Request For Information",
                  RFIApprReqCancelledEventDescTxt, 0, false);

                //HRLeaveApplication
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendHRLeaveApplicationForApprovalCode, DATABASE::"HR Leave Application",
                  HRLeaveApplicationSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHRLeaveApplicationForApprovalCode, DATABASE::"HR Leave Application",
                  HRLeaveApplicationApprReqCancelledEventDescTxt, 0, false);

                //Recruitment Requisition Header
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRecruitmentRequisitionHeaderForApprovalCode, DATABASE::"Recruitment Requisition Header",
                  RecruitmentRequisitionHeaderSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRecruitmentRequisitionHeaderForApprovalCode, DATABASE::"Recruitment Requisition Header",
                  RecruitmentRequisitionHeaderApprReqCancelledEventDescTxt, 0, false);

                //VacancyAnnouncement
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendVacancyAnnouncementForApprovalCode, DATABASE::"Vacancy Announcement",
                  VacancyAnnouncementSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelVacancyAnnouncementForApprovalCode, DATABASE::"Vacancy Announcement",
                  VacancyAnnouncementApprReqCancelledEventDescTxt, 0, false);

                //Project Contract Header
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendProjectContractForApprovalCode, DATABASE::"Project Contract Header",
                          ProjectContractSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelProjectContractForApprovalCode, DATABASE::"Project Contract Header",
                  ProjectContractApprReqCancelledEventDescTxt, 0, false);

                //Receipt
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendReceiptForApprovalCode, DATABASE::"Receipts Header1",
                  ReceiptSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelReceiptForApprovalCode, DATABASE::"Receipts Header1",
                  ReceiptApprReqCancelledEventDescTxt, 0, false);

                //SubContractExtensionVoucher
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendSubContractExtensionVoucherForApprovalCode, DATABASE::"Sub Contract Extension Voucher",
                SubContractExtensionVoucherSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSubContractExtensionVoucherForApprovalCode, DATABASE::"Sub Contract Extension Voucher",
                   SubContractExtensionVoucherApprReqCancelledEventDescTxt, 0, false);

                //PayrollHeader
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPayrollHeaderForApprovalCode, DATABASE::"Payroll Header",
                PayrollHeaderSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPayrollHeaderForApprovalCode, DATABASE::"Payroll Header",
                   PayrollHeaderApprReqCancelledEventDescTxt, 0, false);

                //RecruitmentPlan
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRecruitmentPlanForApprovalCode, DATABASE::"Recruitment Plan",
                RecruitmentPlanSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelRecruitmentPlanForApprovalCode, DATABASE::"Recruitment Plan",
                   RecruitmentPlanApprReqCancelledEventDescTxt, 0, false);
                //Test
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTestForApprovalCode, DATABASE::"Approval Test",
                       TestSendForApprovalEventDescTxt, 0, false);
                WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTestForApprovalCode, DATABASE::"Approval Test",
                  TestApprReqCancelledEventDescTxt, 0, false); */

    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnSendDocForApproval', '', false, false)]
    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin


        RecRef.GetTable(Variant);
        case RecRef.Number of



            //Purchase
            Database::"Purchase Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPurchaseForApprovalCode, Variant);

            //IFRCARD
            // Database::"Request For Information":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendIFRForApprovalCode, Variant);
            //Procurement Plan
            Database::"Procurement Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProcPlanForApprovalCode, Variant);
            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRFQForApprovalCode, Variant);
            //PV
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPVForApprovalCode, Variant);

            //Imprest Memo
            Database::"Imprest Memo":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIMForApprovalCode, Variant);

            DATABASE::"IFS Tender Committee":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIFSTenderCommitteeForApprovalCode, Variant);
            DATABASE::"Bid Tabulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBidTabulationHeaderForApprovalCode, Variant);
            DATABASE::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRFIForApprovalCode, Variant);
            DATABASE::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRLeaveApplicationForApprovalCode, Variant);
            DATABASE::"Vacancy Announcement":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVacancyAnnouncementForApprovalCode, Variant);
            DATABASE::"Bank Acc. Reconciliation":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBankRecForApprovalCode, Variant);
            DATABASE::"Recruitment Requisition Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruitmentRequisitionHeaderForApprovalCode, Variant);
            Database::"Receipts Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendReceiptForApprovalCode, Variant);
            Database::"Project Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectContractForApprovalCode, Variant);
            Database::"Sub Contract Extension Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSubContractExtensionVoucherForApprovalCode, Variant);
            Database::"Award Extension":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAwardContractExtensionVoucherForApprovalCode, Variant);
            Database::"Payroll Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPayrollHeaderForApprovalCode, Variant);
            Database::"Recruitment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruitmentPlanForApprovalCode, Variant);
            Database::"Approval Test":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTestForApprovalCode, Variant);
            Database::"Training Needs Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode, Variant);
            Database::"Training Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingPlanHeaderForApprovalCode, Variant);
            Database::"Training Requests":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingRequestsForApprovalCode, Variant);
            Database::"Perfomance Evaluation":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPerfomanceEvaluationForApprovalCode, Variant);
            Database::"Prequalification Score Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPrequalificationScoreHeaderForApprovalCode, Variant);
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRequestForInformationForApprovalCode, Variant);
            Database::"Bid Scoring Template":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBidScoringTemplateForApprovalCode, Variant);
            Database::"Bid Evaluation Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBidEvaluationRegisterForApprovalCode, Variant);
            Database::"IFS Prebid Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIFSPrebidRegisterForApprovalCode, Variant);
            //Timesheets
            Database::"Time Sheet Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTimesheetForApprovalCode, Variant);

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnCancelDocApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of


            //purchase
            Database::"Purchase Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPurchaseForApprovalCode, Variant);
            //IFRCARD
            // Database::"Request For Information":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFRForApprovalCode, Variant);
            //procurement plan
            Database::"procurement plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcPlanForApprovalCode, Variant);

            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRFQForApprovalCode, Variant);
            //pv
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPVForApprovalCode, Variant);

            //Imprest Memo
            Database::"Imprest Memo":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIMForApprovalCode, Variant);

            DATABASE::"IFS Tender Committee":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFSTenderCommitteeForApprovalCode, Variant);
            DATABASE::"Bid Tabulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidTabulationHeaderForApprovalCode, Variant);
            DATABASE::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRFIForApprovalCode, Variant);
            DATABASE::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRLeaveApplicationForApprovalCode, Variant);
            DATABASE::"Vacancy Announcement":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVacancyAnnouncementForApprovalCode, Variant);
            DATABASE::"Bank Acc. Reconciliation":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBankRecForApprovalCode, Variant);
            DATABASE::"Recruitment Requisition Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruitmentRequisitionHeaderForApprovalCode, Variant);
            Database::"Receipts Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelReceiptForApprovalCode, Variant);
            Database::"Project Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectContractForApprovalCode, Variant);
            Database::"Sub Contract Extension Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSubContractExtensionVoucherForApprovalCode, Variant);
            Database::"Award Extension":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAwardContractExtensionVoucherForApprovalCode, Variant);
            Database::"Payroll Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayrollHeaderForApprovalCode, Variant);
            Database::"Recruitment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruitmentPlanForApprovalCode, Variant);
            Database::"Approval Test":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTestForApprovalCode, Variant);
            Database::"Perfomance Evaluation":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPerfomanceEvaluationForApprovalCode, Variant);
            Database::"Prequalification Score Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPrequalificationScoreHeaderForApprovalCode, Variant);
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRequestForInformationForApprovalCode, Variant);
            Database::"Bid Scoring Template":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidScoringTemplateForApprovalCode, Variant);
            Database::"Bid Evaluation Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidEvaluationRegisterForApprovalCode, Variant);
            Database::"IFS Prebid Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFSPrebidRegisterForApprovalCode, Variant);
            //Timesheets
            Database::"Time Sheet Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTimesheetForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;

    end;



    [IntegrationEvent(false, false)]
    procedure OnSendDocForApproval(var Variant: Variant)
    begin

    end;




}




