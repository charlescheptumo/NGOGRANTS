#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50001 "pageextension50001" extends "Company Information"
{
    Caption = 'Organization Information';

    layout
    {
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN.';
        }
        addafter(Picture)
        {
            field("N.S.SF. No."; Rec."N.S.SF. No.")
            {
                ApplicationArea = Basic;
            }
            field("N.H.I.F No."; Rec."N.H.I.F No.")
            {
                ApplicationArea = Basic;
            }
            field(RubberStamp; Rec.RubberStamp)
            {
                ApplicationArea = Basic;
            }
            field("KRA Pic"; Rec."KRA Pic")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the KRA Picture field.';
            }
        }
        addafter("Home Page")
        {
            field("Headed By"; Rec."Headed By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Headed By field.';
            }
            field("Current Head"; Rec."Current Head")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Personal Number field.';
            }
            field("Current Head Name"; Rec."Current Head Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Current Head Name field.';
            }

            field("Brand Color Code"; Rec."Brand Color Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Brand Color Code field.';
            }
            field("Brand Color Value"; Rec."Brand Color Value")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Brand Color Value field.';
            }
        }
        addafter(Payments)
        {
            group("Outgoing Emails")
            {
                Caption = 'Outgoing Emails';
                field("Procurement Support E-mail"; Rec."Procurement Support E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Legal Head Email"; Rec."Legal Head Email")
                {
                    ApplicationArea = Basic;
                }
                field("Administrator Email"; Rec."Administrator Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Files)
            {
                Caption = 'Files';
                field("HR Document Link"; Rec."HR Document Link")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        modify("Company Badge")
        {
            Caption = 'Organization Badge';
        }
        modify("System Indicator")
        {
            Caption = 'Organization Badge';
        }
        modify("System Indicator Style")
        {
            Caption = 'Organization Badge Style';
        }
        modify("System Indicator Text")
        {
            Caption = 'Organization Badge Text';
        }
    }
    actions
    {
        addafter("Responsibility Centers")
        {
            action("Rules and Regulations")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Hr Guiding Principle";
            }
            action("Company Activities")
            {
                ApplicationArea = Basic;
                Caption = 'Organization Activities';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Medical Examination Type";
            }
            action("HR Committees")
            {
                ApplicationArea = Basic;
                Caption = 'Committees';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Disciplinary Committe";
            }
            action("Base Calendar")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Base Calendar List";
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page Dimensions;
            }
        }
    }
}

#pragma implicitwith restore

