#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69066 "User Signature"
{
    Caption = 'User Signature';
    DeleteAllowed = false;
    InsertAllowed = TRUE;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = "User Setup";
    ApplicationArea = Basic;
    //SourceTableView

    layout
    {
        area(content)
        {
            field("User ID";Rec."User ID")
            {
                ApplicationArea=basic;
            }
            field(Picture; Rec.Picture)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

