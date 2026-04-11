page 50113 "Admin Approval Entry"
{
    ApplicationArea = All;
    Caption = 'Approval Entries Admin';
    PageType = List;
    SourceTable = "Approval Entry";
    Editable = true;
    UsageCategory = Lists;
    Permissions = TableData "Approval Entry" = RIMD;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.") { Editable = false; }
                field("Document No."; Rec."Document No.") { Editable = false; }
                field("Approver ID"; Rec."Approver ID") { Editable = true; }
                field(Status; Rec.Status) { Editable = true; }
                field(Comment; Rec.Comment) { Editable = true; }
                field("Approval Type"; Rec."Approval Type") { Editable = false; }
                field("Amount (LCY)"; Rec."Amount (LCY)") { Editable = false; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SaveChanges)
            {
                Caption = 'Apply Changes';
                ApplicationArea = All;
                Image = Save;
                ToolTip = 'Apply changes from the editable temporary page to the real Approval Entry table.';

                trigger OnAction()
                var
                    RealRec: Record "Approval Entry";
                begin
                    RealRec.Reset();
                    RealRec.Get(Rec."Entry No.");
                    RealRec."Approver ID" := Rec."Approver ID";
                    RealRec.Status := Rec.Status;
                    RealRec.Comment := Rec.Comment;
                    RealRec.Modify();
                    Message('Changes applied successfully.');
                end;
            }
        }
    }



}
