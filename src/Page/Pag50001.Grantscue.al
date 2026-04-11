page 50001 "Grants Cue"
{
    ApplicationArea = All;
    Caption = 'Grants Cue';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Grants Cue";

    layout
    {
        area(content)
        {
            cuegroup(General)
            {
                Caption = 'General';

                field("Total Awards"; Rec."Total Awards")
                {
                    ToolTip = 'Specifies the value of the Total Awards field.';
                    DrillDownPageId = "Projects List";
                }
                field("Project: Fixed-Price"; Rec."Project: Fixed-Price")
                {
                    ToolTip = 'Specifies the value of the Project: Fixed-Price field.';
                    DrillDownPageId = Projects;
                }
                field("Project: Milestone-Based"; Rec."Project: Milestone-Based")
                {
                    ToolTip = 'Specifies the value of the Project: Milestone-Based field.';
                    DrillDownPageId = Projects;
                }
                field("Open SubAwards"; Rec."Open SubAwards")
                {
                    ToolTip = 'Specifies the value of the Open SubAwards field.';
                    DrillDownPageId = "Open Sub Award Contracts";
                }
                field("SubAwards Under Drafting"; Rec."Drafting SubAwards")
                {
                    ToolTip = 'Specifies the value of the SubAwards under Drafting field.';
                    DrillDownPageId = "Open Sub Award Contracts";

                }
                field("Ongoing SubAwards"; Rec."Ongoing SubAwards")
                {
                    ToolTip = 'Specifies the value of the Ongoing SubAwards field.';
                    DrillDownPageId = "Ongoing Sub Award Contracts";
                }
                field("Closed SubAwards"; Rec."Closed SubAwards")
                {
                    ToolTip = 'Specifies the value of the Closed SubAwards field.';
                    DrillDownPageId = "Completed Sub Award Contracts";

                }
                // field("Primary Key"; Rec."Primary Key")
                // {
                //     ToolTip = 'Specifies the value of the Primary Key field.';
                // }
                field("Total SubAwards"; Rec."Total SubAwards")
                {
                    ToolTip = 'Specifies the value of the Total SubAwards field.';

                }
                field("Total Subgranted Amount"; Rec."Total Subgranted Amount")
                {
                    ToolTip = 'Specifies the value of the Total Subgranted Amount field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;


        //  SetFilter("User ID Filter", UserId);

        // SetFilter("User ID Filter", '=%1', UserId);
        ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total Awards");
        Rec.CalcFields("Project: Fixed-Price");
        Rec.CalcFields("Project: Milestone-Based");
        Rec.CalcFields("Open SubAwards");
        Rec.CalcFields("Drafting SubAwards");
        Rec.CalcFields("Ongoing SubAwards");
        Rec.CalcFields("Closed SubAwards");
        Rec.CalcFields("Total SubAwards");
        Rec.CalcFields("Total Subgranted Amount");
    end;

    var
        OCRServiceMgt: Codeunit "OCR Service Mgt.";
        ShowCheckForOCR: Boolean;
}
