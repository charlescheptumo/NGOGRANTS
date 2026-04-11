#pragma implicitwith disable
page 50094 "Employee Exit Voucher"
{
    PageType = Card;
    SourceTable = "Employee Exit header";
    ApplicationArea = all;

    layout
    {

        area(content)
        {
            
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    Editable = false;
                }
                field("Exit Method"; Rec."Exit Method")
                {
                }
                field("Job Id"; Rec."Job Id")
                {
                    Editable = false;
                }
                field("Reasons Code"; Rec."Reasons Code")
                {
                }
                field("Created On"; Rec."Created On")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
            group("Important Dates")
            {
                field("Date of Join"; Rec."Date of Join")
                {
                    Editable = false;
                }
                field("Last working Date"; Rec."Last working Date")
                {
                }
                field("Notice Date"; Rec."Notice Date")
                {
                }
                field("Employee Exit Date"; Rec."Employee Exit Date")
                {
                }
            }
            group(Statistics)
            {
                field("No of Hand Over Notes"; Rec."No of Hand Over Notes")
                {
                    Editable = false;
                }
                field("No of Open Hand Over Notes"; Rec."No of Open Hand Over Notes")
                {
                    Editable = false;
                }
                field("No of Open Hand Cleared Notes"; Rec."No of Open Hand Cleared Notes")
                {
                    Editable = false;
                }
            }
            part(Control23; "Exit Plan Lines")
            {
                SubPageLink = "Exit Header No" = FIELD("Document No."),
                              "Document Type" = FIELD("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
            }
            /* action("Create Hand Over Vouchers")
            {
                Image = BusinessRelation;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Recruitment.FnCreateHandOverVoucher(Rec);
                end;
            } */
            action("&Approvals")
            {
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
            }
            action("&Send Approval Request")
            {
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
            }
            action("&Cancel Approval Request")
            {
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //ApprovalMgt.SendFATRANSFERRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Print)
            {
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec."Document Type" := Rec."Document Type"::"Exit Voucher";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Exit Voucher";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."Document Type"::"Exit Voucher";
    end;

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

