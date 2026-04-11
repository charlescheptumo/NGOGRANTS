tableextension 50145 "Time Sheet Header Ext" extends "Time Sheet Header"
{
    fields
    {
        field(50000; "Pay Period"; Date)
        {
            Caption = 'Pay Period';
            Editable = false;
            TableRelation = "Payroll PeriodX";
            DataClassification = ToBeClassified;
        }
        field(50001; Status; Enum "Document Approval Status")
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Status = Status::Approved then begin
                    TimeSheetLine.Reset();
                    TimeSheetLine.SetRange("Time Sheet No.", "No.");
                    if TimeSheetLine.FindSet() then
                        TimeSheetLine.ModifyAll(Status, TimeSheetLine.Status::Approved);

                end;
                if Status = Status::Open then begin
                    TimeSheetLine.Reset();
                    TimeSheetLine.SetRange("Time Sheet No.", "No.");
                    if TimeSheetLine.FindSet() then
                        TimeSheetLine.ModifyAll(Status, TimeSheetLine.Status::Open);
                end;
            end;
        }
    }
    var
        TimeSheetLine: Record "Time Sheet Line";
}
