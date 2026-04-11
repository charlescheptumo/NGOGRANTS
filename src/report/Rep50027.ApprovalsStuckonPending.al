report 50027 ApprovalsStuckonPending
{
    ApplicationArea = All;
    Caption = 'Approvals Stuck on Pending Approval';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    AllowScheduling = true;
    Permissions = tabledata "Approval Entry" = RIMD;

    dataset
    {
        dataitem(ApprovalEntry; "Approval Entry")
        {

            trigger OnAfterGetRecord()
            begin
                ApprovalEntry.Reset();
                ApprovalEntry.SetRange("Document No.", DocumentNo);
                // ApprovalEntry.SetRange("Document No.", 'SUR00021');
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Created);
                if ApprovalEntry.FindSet then begin
                    Sequence2 := 4;
                end else begin
                    Error('Document number %1 has no open approval entries', DocumentNo);
                end;

                //Sequence2 := Sequence + 1;

                ApprovalEntry.Reset();
                ApprovalEntry.SetRange(ApprovalEntry."Document No.", DocumentNo);
                ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Approved);
                ApprovalEntry.SetRange(ApprovalEntry."Sequence No.", Sequence);
                if ApprovalEntry.FindSet then begin
                    //Message('Here');
                    //if ApprovalEntry2.Status = ApprovalEntry2.Status::Created then begin
                    ApprovalEntry.Status := ApprovalEntry.Status::Created;
                    ApprovalEntry.Modify(true);
                    Message('Document %1 approvals unlocked successfully', ApprovalEntry."Document No.");
                end else begin
                    Message('There are no stuck approvals for document number %1 for entry no %2', ApprovalEntry."Document No.", Sequence);
                    //end;
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
                group(Options)
                {
                    Caption = 'Options';
                    field(DocumentNo; DocumentNo)
                    {
                        ApplicationArea = Basic;
                    }
                    field(Sequence; Sequence)
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }

        actions
        {
        }
    }

    var
        Sequence: Integer;
        Sequence2: Integer;
        Present: Boolean;
        DocumentNo: Code[1000];
        ApprovalEntry2: Record "Approval Entry";

}
