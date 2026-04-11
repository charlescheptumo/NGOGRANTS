reportextension 50018 "Bank Acc Recon" extends "Bank Acc. Recon. - Test"
{
    dataset
    {
        add("Bank Acc. Reconciliation")
        {
            column(BankAccountNo; "Bank Account No.")
            {
            }
            column(PreparedBy; Approver[1])
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; Approver[2])
            {
            }
            column(DateApproved; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; Approver[3])
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; Approver[4])
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(Approver; Approver[5])
            {
            }
            column(ApproverDate; ApproverDate[5])
            {
            }
            column(Approver_Signature; UserSetup4.Picture)
            {
            }
        }

        modify("Bank Acc. Reconciliation")
        {
            // modify the new, added field
            trigger OnBeforeAfterGetRecord()
            begin
                //Approvals
                docno := "Bank Acc. Reconciliation"."Bank Account No." + ' ' + "Bank Acc. Reconciliation"."Statement No.";
                //Message('docno = %1', docno);
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 273);
                ApprovalEntries.SetRange("Document No.", docno);
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
                        if i = 4 then begin
                            Approver[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup4.Get(Approver[5]) then
                                UserSetup4.CalcFields(Picture);
                        end;
                    until
                        ApprovalEntries.Next = 0;
                end;

            end;
        }
    }

    var
        bankrec: Record "Bank Acc. Reconciliation";
        ApprovalEntries: Record "Approval Entry";
        docno: Code[50];
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
}
