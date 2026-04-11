#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50054 "pageextension50054" extends "Bank Acc. Reconciliation List"
{
    layout
    {
        addafter(StatementEndingBalance)
        {
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        modify(Post)
        {
            Visible = false;
        }
        modify(PostAndPrint)
        {
            Visible = false;
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Status, 'Open|Pending Approval');
    end;
}

#pragma implicitwith restore

