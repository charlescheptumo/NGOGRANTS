table 50029 "Employee Beneficiaries"
{
    Caption = 'Employee Beneficiaries';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
            Caption = 'Employee No.';
            DataClassification = ToBeClassified;

        }
        field(2; "Beneficiary No."; Integer)
        {
            Caption = 'Beneficiary No.';
            DataClassification = ToBeClassified;
        }
        field(3; "First Name"; Text[80])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Middle Name"; Text[80])
        {
            Caption = 'Middle Name';
            DataClassification = ToBeClassified;
        }
        field(5; "Last Name"; Text[80])
        {
            Caption = 'Last Name';
            DataClassification = ToBeClassified;
        }
        field(6; Relationship; Code[20])
        {
            Caption = 'Relationship';
            DataClassification = ToBeClassified;
        }
        field(7; Percentage; Decimal)
        {
            Caption = 'Percentage';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                TotalPercentage: Decimal;
            begin
                TotalPercentage := 0;
                Beneficiary.Reset();
                Beneficiary.SetRange("Employee No.", "Employee No.");
                if Beneficiary.FindSet() then
                    repeat
                        TotalPercentage += Beneficiary.Percentage;
                    until Beneficiary.Next() = 0;
                if TotalPercentage > 100 then
                    Error('The total beneficiary Percentage exceeds 100%');
            end;
        }
    }

    keys
    {
        key(PK; "Employee No.", "Beneficiary No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        Beneficiary.Reset();
        Beneficiary.SetRange("Employee No.", "Employee No.");
        if not Beneficiary.FindLast() then
            "Beneficiary No." := 1
        else
            "Beneficiary No." += Beneficiary."Beneficiary No.";

    end;

    var
        Employee: Record Employee;
        Beneficiary: Record "Employee Beneficiaries";
}
