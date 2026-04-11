page 50114 "Employees On Leave"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Leave Application";
    UsageCategory = Lists;
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code") { ApplicationArea = HumanResources; }
                field("Employee No"; Rec."Employee No") { ApplicationArea = HumanResources; }
                field("Employee Name"; Rec."Employee Name") { ApplicationArea = HumanResources; }
                field("Leave Type"; Rec."Leave Type") { ApplicationArea = HumanResources; }
                field("Days Applied"; Rec."Days Applied") { ApplicationArea = HumanResources; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = HumanResources; }
                field("End Date"; Rec."End Date") { ApplicationArea = HumanResources; }
                field(Supervisor; Rec.Supervisor) { ApplicationArea = HumanResources; }
                field("Supervisor Email"; Rec."Supervisor Email") { ApplicationArea = HumanResources; }
            }
        }
    }

    trigger OnOpenPage();
    var
        TodayDate: Date;
    begin
        TodayDate := Today;
        // Apply dynamic filter to show only leaves that include today
        Rec.SetRange(Posted, true);
        Rec.SetFilter("Start Date", '<=%1', TodayDate);
        Rec.SetFilter("End Date", '>=%1', TodayDate);
    end;


}
