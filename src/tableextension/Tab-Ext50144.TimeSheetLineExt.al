tableextension 50144 "Time Sheet Line Ext" extends "Time Sheet Line"
{
    fields
    {
        field(50000; "Customer"; Code[50])
        {
            Caption = 'Donor';
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(50001; "Distribution Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TimeSheetLine.Reset();
                TimeSheetLine.SetRange("Time Sheet No.", Rec."Time Sheet No.");
                TimeSheetLine.SetFilter("Line No.", '<>%1', "Line No.");
                if TimeSheetLine.FindSet() then begin
                    TimeSheetLine.CalcSums("Distribution Percentage");
                    if TimeSheetLine."Distribution Percentage" + Rec."Distribution Percentage" > 100 then
                        Error('The total distribution percentage per timesheet cannot exceed 100');
                end;

            end;
        }
        field(50002; "Absent Reason Code"; Code[30])
        {
            TableRelation = "HR Leave Types".Code;
 
            trigger OnValidate()
            var
                HRLeaveType:Record "HR Leave Types";
            begin
                HRLeaveType.Reset();;
                HRLeaveType.SetRange(code,rec."Absent Reason Code");
                if HRLeaveType.FindSet then begin
                    "Absent reason Description":=HRLeaveType.Description;
                end
            end;
        }
        field(50003; "Absent reason Description"; Text[200])
        {
 
        }
        modify("Job No.")
        {
            trigger OnAfterValidate()

            begin
                Job.Reset();
                if Job.Get(Rec."Job No.") then begin
                    Job.TestField("Shortcut Dimension 3 Code");
                    Customer := Job."Shortcut Dimension 3 Code";


                    TimeSheetLine.Reset();
                    TimeSheetLine.SetRange("Time Sheet No.", Rec."Time Sheet No.");
                    if TimeSheetLine.FindSet() then begin
                        TimeSheetLine.CalcSums("Distribution Percentage");
                        if TimeSheetLine."Distribution Percentage" = 0 then
                            Rec."Distribution Percentage" := 100
                        else begin
                            Rec."Distribution Percentage" := 100 - TimeSheetLine."Distribution Percentage";

                        end;
                    end;
                end;
            end;
        }
        modify("Job Task No.")
        {
            trigger OnAfterValidate()
            var
                Jobs: Record Job;
            begin
                Jobs.Get("Job No.");
                Description := Jobs.Description;
            end;
        }
    }
    var
        Job: Record Job;
        TimeSheetLine: Record "Time Sheet Line";
}
