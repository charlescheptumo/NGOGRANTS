#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69810 "Selection Panelist"
{
    PageType = ListPart;
    SourceTable = "Candidate Selection Panelist";
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Panel ID"; Rec."Panel ID")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Appointed Selection"; Rec."Appointed Selection")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }

                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
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

#pragma implicitwith restore

