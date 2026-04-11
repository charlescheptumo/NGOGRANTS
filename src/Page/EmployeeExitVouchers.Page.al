#pragma implicitwith disable
page 50093 "Employee Exit Vouchers"
{
    CardPageID = "Employee Exit Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Employee Exit header";
    SourceTableView = WHERE("Document Type" = CONST("Exit Voucher"));
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Names"; Rec."Employee Names")
                {
                }
                field("Exit Method"; Rec."Exit Method")
                {
                }
                field("Job Id"; Rec."Job Id")
                {
                }
                field("Reasons Code"; Rec."Reasons Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

