#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65154 "Grant Admin Team"
{
    PageType = ListPart;
    SourceTable = "Grant Admin Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AdminNo; Rec.code)
                {
                    ApplicationArea = Basic;
                }
                field(AdminName; Rec."Name")
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
