#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50003 "Release Approval Document"
{
    TableNo = "Purchase Header";

    trigger OnRun()
    begin
    end;

    var
        Text001: label 'There is nothing to release for the document of type %1 with the number %2.';
        Text002: label 'This document can only be released when the approval process is complete.';
        Text003: label 'The approval process must be cancelled or completed to reopen this document.';
        Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    // procedure ReleasePV(var PV: Record "CRM Training")
    // begin

    //     // IF PV.Attendees = PV.Attendees::"3" THEN
    //     //  EXIT;
    //     //
    //     // //TESTFIELD("Buy-from Vendor No.");
    //     // //IF PV."Document Type"=PV."Document Type"::"Payment Voucher" THEN BEGIN
    //     // PV.Attendees := PV.Attendees::"3";
    //     // PV.MODIFY(TRUE);
    //     // SendApprovalNotification(PV."Document No.");
    //     // //END;
    // end;
    // procedure Reopen(var PV: Record "CRM Training")
    // begin
    //     // WITH PV DO BEGIN
    //     //  IF Attendees = Attendees::"0" THEN
    //     //    EXIT;
    //     //  Attendees := Attendees::"0";
    //     //  MODIFY(TRUE);
    //     // END;
    // end;
    procedure ReopenLeaveApp(LeaveApp: Record "HR Leave Application")
    begin
        with LeaveApp do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;
    procedure ReleaseLeaveApp(LeaveApp: Record "HR Leave Application")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if LeaveApp.Status = LeaveApp.Status::Approved then
            exit;

        LeaveApp.Status := LeaveApp.Status::Approved;
        LeaveApp.Modify(true);

        /* LeaveApp.RESET;
         LeaveApp.SETRANGE(LeaveApp."Application Code",ApprovalEntry."Document No.");
         IF LeaveApp.FIND('-')THEN BEGIN
         //LeaveApp.CreateLeaveLedgerEntries;
        ApprovalMgtNotification.SendLeaveApprovedMail(LeaveApp,ApprovalEntry);
         END;*/
        // LeaveApp.CreateLeaveLedgerEntries;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange("Document No.", LeaveApp."Application Code");
        if ApprovalEntry.FindSet then begin
            LeaveApp.Reset;
            LeaveApp.SetRange(LeaveApp."Application Code", ApprovalEntry."Document No.");
            if LeaveApp.Find('-') then
                ApprovalMgtNotification.SendLeaveApprovedMail(LeaveApp, ApprovalEntry);
        end;
        OnAfterReleaseLeave(LeaveApp);

    end;

    // procedure ReopenCopyReg(CopyReg: Record "Copyright Registration Table")
    // begin
    //     with CopyReg do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseCopyReg(CopyReg: Record "Copyright Registration Table")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if CopyReg.Status = CopyReg.Status::Approved then
    //         exit;

    //     CopyReg.Status := CopyReg.Status::Approved;
    //     CopyReg.Modify(true);
    // end;


    procedure ReopenOvertime(Overtime: Record "Overtime Header")
    begin
        with Overtime do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseOvertime(Overtime: Record "Overtime Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Overtime.Status = Overtime.Status::Approved then
            exit;

        Overtime.Status := Overtime.Status::Approved;
        Overtime.Modify(true);
    end;


    procedure ReopenTrainingApp(TrainingApp: Record "Training Requests")
    begin
        /*WITH TrainingApp DO BEGIN
          IF "Budget Name" = "Budget Name"::"0" THEN
            EXIT;
          "Budget Name" := "Budget Name"::"0";
          MODIFY(TRUE);
        END;*/

    end;


    procedure ReleaseTrainingApp(TrainingApp: Record "Training Requests")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        /*IF TrainingApp."Budget Name" = TrainingApp."Budget Name"::"2" THEN
          EXIT;
        
        TrainingApp."Budget Name" := TrainingApp."Budget Name"::"2";
        TrainingApp.MODIFY(TRUE);*/

    end;


    procedure ReopenGFA(GFA: Record Opportunity)
    begin
        with GFA do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseGFA(GFA: Record Opportunity)
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if GFA."Approval Status" = GFA."approval status"::Released then
            exit;

        GFA."Approval Status" := GFA."approval status"::Released;
        GFA.Modify(true);
        SendApprovalNotification(GFA."No.");
    end;


    procedure ReopenProjectContract(ProjectContract: Record "Project Contract Header")
    begin
        with ProjectContract do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseProjectContract(ProjectContract: Record "Project Contract Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ProjectContract."Approval Status" = ProjectContract."approval status"::Approved then
            exit;

        ProjectContract."Approval Status" := ProjectContract."approval status"::Approved;
        ProjectContract.Modify(true);
        SendApprovalNotification(ProjectContract."Project Contract No");
    end;


    procedure ReopenProcDoc(Procurement: Record "Procurement Request")
    begin
        with Procurement do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseProcDOc(Procurement: Record "Procurement Request")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if Procurement.Status = Procurement.Status::Released then
            exit;

        Procurement.Status := Procurement.Status::Released;
        Procurement.Modify(true);
        SendApprovalNotification(Procurement.No);
    end;


    // procedure ReopenFleet(FLeet: Record "Transport Requisition")
    // begin
    //     with FLeet do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseFleet(Fleet: Record "Transport Requisition")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Fleet.Status = Fleet.Status::Approved then
    //         exit;

    //     Fleet.Status := Fleet.Status::Approved;
    //     Fleet.Modify(true);
    //     SendApprovalNotification(Fleet."Transport Requisition No");
    // end;


    // procedure ReopenFileMovement(FileMovement: Record "File Movement Header")
    // begin
    //     with FileMovement do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseFileMovement(FileMovement: Record "File Movement Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if FileMovement.Status = FileMovement.Status::Approved then
    //         exit;

    //     FileMovement.Status := FileMovement.Status::Approved;
    //     FileMovement.Modify(true);
    //     SendApprovalNotification(FileMovement."No.");
    // end;


    procedure ReopenReceipt(ReceiptsHeader1: Record "Receipts Header1")
    begin
        with ReceiptsHeader1 do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseReceipt(ReceiptsHeader1: Record "Receipts Header1")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ReceiptsHeader1.Status = ReceiptsHeader1.Status::Released then
            exit;

        ReceiptsHeader1.Status := ReceiptsHeader1.Status::Released;
        ReceiptsHeader1.Modify(true);
    end;


    procedure ReopenIFP(IFP: Record "Request For Information")
    begin
        with IFP do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseIFP(IFP: Record "Request For Information")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if IFP.Status = IFP.Status::Released then
            exit;

        IFP.Status := IFP.Status::Released;
        IFP.Modify(true);
        SendApprovalNotification(IFP.Code);
    end;


    procedure ReopenVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    begin
        with VendDebarment do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if VendDebarment."Approval Status" = VendDebarment."approval status"::Released then
            exit;

        VendDebarment."Approval Status" := VendDebarment."approval status"::Released;
        VendDebarment.Modify(true);
        SendApprovalNotification(VendDebarment."Document No");
    end;


    procedure ReopenProcPlan(ProcPlan: Record "Procurement Plan")
    begin
        with ProcPlan do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseProcPlan(ProcPlan: Record "Procurement Plan")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ProcPlan."Approval Status" = ProcPlan."approval status"::Released then
            exit;

        ProcPlan."Approval Status" := ProcPlan."approval status"::Released;
        ProcPlan.Modify(true);
        SendApprovalNotification(ProcPlan.Code);
    end;

    local procedure "*******Project Fundin*******************"()
    begin
    end;


    // procedure ReopenProjectReq(ProjFundReq: Record "Project Funding Request Vouche")
    // begin
    //     with ProjFundReq do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseProjectReq(ProjFundReq: Record "Project Funding Request Vouche")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProjFundReq.Status = ProjFundReq.Status::Approved then
    //         exit;

    //     ProjFundReq.Status := ProjFundReq.Status::Approved;
    //     ProjFundReq.Modify(true);
    //     SendApprovalNotification(ProjFundReq."Document No");
    // end;


    procedure ReopenITT(ITT: Record "Standard Purchase Code")
    begin
        with ITT do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseITT(ITT: Record "Standard Purchase Code")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ITT.Status = ITT.Status::Released then
            exit;

        ITT.Status := ITT.Status::Released;
        ITT.Modify(true);
        SendApprovalNotification(ITT.Code);
    end;

    local procedure "******Bank Rec****"()
    begin
    end;


    procedure ReopenBankRec(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    begin
        with BankAccReconciliation do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseBankRec(var BankAccReconciliation: Record "Bank Acc. Reconciliation")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BankAccReconciliation.Status = BankAccReconciliation.Status::Released then
            exit;

        BankAccReconciliation.Status := BankAccReconciliation.Status::Released;
        BankAccReconciliation.Modify(true);
        SendApprovalNotification(BankAccReconciliation."Statement No." + ' ' + BankAccReconciliation."Bank Account No.");
    end;


    // procedure ReopenICTIssuance(ICT: Record "ICT Issuance Voucher")
    // begin
    //     with ICT do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseICTIssuance(ICT: Record "ICT Issuance Voucher")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ICT.Status = ICT.Status::Released then
    //         exit;

    //     ICT.Status := ICT.Status::Released;
    //     ICT.Modify(true);
    //     SendApprovalNotification(ICT."No.");
    // end;

    // local procedure "*************Budget Reallocation"()
    // begin
    // end;


    procedure ReopenBudgetReallocation(BudgetReallocationHeader: Record "Budget Reallocation Header")
    begin
        with BudgetReallocationHeader do begin
            if "Approval Status" = "approval status"::New then
                exit;
            "Approval Status" := "approval status"::New;
            Modify(true);
        end;
    end;


    procedure ReleaseBudgetReallocation(BudgetReallocationHeader: Record "Budget Reallocation Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BudgetReallocationHeader."Approval Status" = BudgetReallocationHeader."approval status"::Approved then
            exit;

        BudgetReallocationHeader."Approval Status" := BudgetReallocationHeader."approval status"::Approved;
        BudgetReallocationHeader.Modify(true);
    end;

    local procedure "************Handover"()
    begin
    end;


    procedure ReopenEmployeeHandover(EmployeeHandoverHeader: Record "Employee Handover Header")
    begin
        with EmployeeHandoverHeader do begin
            if "Approval Status" = "approval status"::New then
                exit;
            "Approval Status" := "approval status"::New;
            Modify(true);
        end;
    end;


    procedure ReleaseEmployeeHandover(EmployeeHandoverHeader: Record "Employee Handover Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if EmployeeHandoverHeader."Approval Status" = EmployeeHandoverHeader."approval status"::Approved then
            exit;

        EmployeeHandoverHeader."Approval Status" := EmployeeHandoverHeader."approval status"::Approved;
        EmployeeHandoverHeader.Modify(true);
        SendApprovalNotification(EmployeeHandoverHeader."Document No");
    end;

    local procedure "************Inspection"()
    begin
    end;


    procedure ReopenInspection(InspectionHeader1: Record "Inspection Header1")
    begin
        with InspectionHeader1 do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseInspection(InspectionHeader1: Record "Inspection Header1")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if InspectionHeader1.Status = InspectionHeader1.Status::Released then
            exit;
        InspectionHeader1.Status := InspectionHeader1.Status::Released;
        InspectionHeader1.Modify;
        OnAfterReleaseInspection(InspectionHeader1);
        SendApprovalNotification(InspectionHeader1."Inspection No");
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterReleaseInspection(InspectionHeader1: Record "Inspection Header1")
    begin
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterReleaseLeave(HRLeaveApplication: Record "HR Leave Application")
    begin
    end;

    local procedure "******Committee"()
    begin
    end;


    procedure ReopenCommittee(TenderCommiteeAppointment1: Record "Tender Commitee Appointment1")
    begin
        with TenderCommiteeAppointment1 do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseCommittee(TenderCommiteeAppointment1: Record "Tender Commitee Appointment1")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if TenderCommiteeAppointment1.Status = TenderCommiteeAppointment1.Status::Released then
            exit;
        TenderCommiteeAppointment1.Status := TenderCommiteeAppointment1.Status::Released;
        TenderCommiteeAppointment1.Modify;
        SendApprovalNotification(TenderCommiteeAppointment1."Appointment No");
        OnAfterReleaseCommittee(TenderCommiteeAppointment1);
    end;

    [IntegrationEvent(false, false)]

    procedure OnAfterReleaseCommittee(TenderCommiteeAppointment1: Record "Tender Commitee Appointment1")
    begin
    end;


    procedure ReopenTenderCommitte(TenderCommitte: Record "IFS Tender Committee")
    begin
        with TenderCommitte do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseTenderCommitte(TenderCommitte: Record "IFS Tender Committee")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if TenderCommitte."Approval Status" = TenderCommitte."approval status"::Released then
            exit;

        TenderCommitte."Approval Status" := TenderCommitte."approval status"::Released;
        TenderCommitte.Modify(true);
        SendApprovalNotification(TenderCommitte."Document No.");
    end;


    procedure ReopenTenderAddendum(TenderAddendum: Record "Tender Addendum Notice")
    begin
        with TenderAddendum do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseTenderAddendum(TenderAddendum: Record "Tender Addendum Notice")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if TenderAddendum.Status = TenderAddendum.Status::Released then
            exit;

        TenderAddendum.Status := TenderAddendum.Status::Released;
        TenderAddendum.Modify(true);
        SendApprovalNotification(TenderAddendum."Addendum Notice No.");
    end;

    local procedure "*******Tender Committe**********"()
    begin
    end;


    procedure ReopenBidEvaluation(BidEvaluation: Record "Bid Evaluation Register")
    begin
        with BidEvaluation do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseBidEvaluation(BidEvaluation: Record "Bid Evaluation Register")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BidEvaluation."Approval Status" = BidEvaluation."approval status"::Released then
            exit;

        BidEvaluation."Approval Status" := BidEvaluation."approval status"::Released;
        BidEvaluation.Modify(true);
        SendApprovalNotification(BidEvaluation.Code);
    end;


    procedure ReopenBidOpening(BidOpening: Record "Bid Opening Register")
    begin
        with BidOpening do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseBidOpening(BidOpening: Record "Bid Opening Register")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BidOpening."Approval Status" = BidOpening."approval status"::Released then
            exit;

        BidOpening."Approval Status" := BidOpening."approval status"::Released;
        BidOpening.Modify(true);
        SendApprovalNotification(BidOpening.Code);
    end;


    procedure ReopenBidTabulation(BidTabulation: Record "Bid Tabulation Header")
    begin
        with BidTabulation do begin
            if "Approval Status" = "approval status"::Open then
                exit;
            "Approval Status" := "approval status"::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseBidTabulation(BidTabulation: Record "Bid Tabulation Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if BidTabulation."Approval Status" = BidTabulation."approval status"::Released then
            exit;

        BidTabulation."Approval Status" := BidTabulation."approval status"::Released;
        BidTabulation.Modify(true);
        SendApprovalNotification(BidTabulation.Code);
    end;

    local procedure "*************Notification************"()
    begin
    end;

    local procedure SendApprovalNotification(ApprovalCode: Code[30])
    var
        SMTPMail: Codeunit "Email Message";

        SenderEmail: Text;
        ReceipientEmail: Text;
        UserSetup: Record "User Setup";
        SMTPMailSetup: Record "Email Account";
        SenderName: Text;
        ApprovalEntry: Record "Approval Entry";
    begin
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange("Document No.", ApprovalCode);
        if ApprovalEntry.FindLast then begin
            SMTPMailSetup.Get;
            SenderEmail := SMTPMailSetup."Email Address";
            //SenderName := SMTPMailSetup."Email Sender Name";
            UserSetup.Reset;
            UserSetup.SetRange("User ID", ApprovalEntry."Sender ID");
            if UserSetup.Find('-') then begin
                if UserSetup."E-Mail" <> '' then begin

                    // SMTPMail.Create(SenderEmail, SenderEmail, UserSetup."E-Mail", 'APPROVAL REQUEST', '', true);
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('Dear ' + UserSetup."Employee Name" + ',');
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('The approval request for the document' + ' ' + Format(ApprovalEntry."Document Type") + ':' + ApprovalEntry."Document No." + ' ' + ' has been approved');
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('Thanks & Regards');
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody(SenderEmail);
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.AppendToBody('<HR>');
                    // SMTPMail.AppendToBody('This is a system generated mail.');
                    // SMTPMail.AppendToBody('<br><br>');
                    // SMTPMail.Send;
                end;
            end
        end
    end;


    procedure ReopenSalaryHeader(ITT: Record "Payroll Header")
    begin
        with ITT do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleaseSalaryHeader(ITT: Record "Payroll Header")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ITT.Status = ITT.Status::Approved then
            exit;

        ITT.Status := ITT.Status::Approved;
        ITT.Modify(true);
        SendApprovalNotification(ITT."No.");
    end;


    procedure ReopenPY(IFP: Record Payments)
    begin
        with IFP do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;
            Modify(true);
        end;
    end;


    procedure ReleasePY(IFP: Record Payments)
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if IFP.Status = IFP.Status::Approved then
            exit;

        IFP.Status := IFP.Status::Approved;
        IFP.Modify(true);
        Message('Payment Voucher Approved');
        //SendApprovalNotification(IFP.Code);
    end;
}

