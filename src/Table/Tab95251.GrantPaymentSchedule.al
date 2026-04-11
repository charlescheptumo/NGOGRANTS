table 95251 "Grant Payment Schedule"
{
    Caption = 'Grant Payment Schedule';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Grant No"; Code[30])
        {
            Caption = 'Award No';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(3; "Milestone Code"; Code[30])
        {
            Caption = 'Milestone Code';
            DataClassification = ToBeClassified;
        }
        field(4; "Milestone Description"; text[255])
        {
            Caption = 'Milestone Description';
            DataClassification = ToBeClassified;
        }
        field(5; "Milestone Start Date"; date)
        {
            Caption = 'Milestone Start Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Milestone End Date" := CalcDate('+' + Format("Notification Period"), "Milestone Start Date");
            end;
        }
        field(6; "Milestone End Date"; date)
        {
            Caption = 'Milestone End Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Notification Period"; DateFormula)
        {
            Caption = 'Notification Period';
            DataClassification = ToBeClassified;
        }
        field(8; "Milestone Status"; Option)
        {
            OptionMembers = "","Open","In-progress","Received","Not Due","Overdue";
            OptionCaption = ' ,Open,In-progress,Received,Not Due,Overdue';
            Caption = 'Milestone Status';
            DataClassification = ToBeClassified;
        }
        field(9; "Disbursement"; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Payment tranche"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Grant No", "Line No")
        {
            Clustered = true;
        }
    }
}
