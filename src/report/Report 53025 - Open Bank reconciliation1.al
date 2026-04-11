report 53025 "Open Bank reconciliation1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Open Bank reconciliation1.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {

            trigger OnAfterGetRecord()
            begin
                if (("Bank Account Ledger Entry".Open = true) and ("Bank Account Ledger Entry"."Statement No." = '')) then begin
                    "Bank Account Ledger Entry".Open := false;
                    "Bank Account Ledger Entry"."Statement No." := '1';
                    //"Bank Account Ledger Entry"."Statement Status":="Bank Account Ledger Entry"."Statement Status"::Closed;
                    // "Bank Account Ledger Entry"."Remaining Amount":="Bank Account Ledger Entry".Amount;
                    "Bank Account Ledger Entry".Modify(true);
                end
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
}

