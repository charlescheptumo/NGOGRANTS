table 65063 "Sub Award Budget Summary"
{
    Caption = 'Sub Award Services';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sub Award No"; Code[30])
        {
            Caption = 'Sub Award No';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = ToBeClassified;
        }
        field(3; "Budget Category"; Code[30])
        {
            Caption = 'Budget Category';
            DataClassification = ToBeClassified;
            TableRelation = "Budget Category";

        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(5; "Amount LCY"; Decimal)
        {
            Caption = 'Amount LCY';
            DataClassification = ToBeClassified;
        }
        field(6; "Currency Code"; Code[50])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
    }
    keys
    {
        key(PK; "Sub Award No", "Line No")
        {
            Clustered = true;
        }
    }
}
