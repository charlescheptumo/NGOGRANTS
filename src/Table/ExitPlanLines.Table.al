table 69744 "Exit Plan Lines"
{

    fields
    {
        field(1; "Exit Header No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Exit Voucher,Hand Over Voucher,Final Dues Voucher';
            OptionMembers = " ","Exit Voucher","Hand Over Voucher","Final Dues Voucher";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" WHERE("Operating Unit Type" = CONST(Directorate));
        }
        field(5; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" WHERE("Operating Unit Type" = CONST("Department/Center"),
                                                           "Direct Reports To" = FIELD("Primary Directorate"));
        }
        field(7; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Responsible Employee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(9; "Planned Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Actual Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Cleared';
            OptionMembers = Open,Cleared;
        }
        field(12; "cleared By"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Hand Doc Over No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Final Due Doc No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Department; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Supervisor,Asset,ICT,Finance,Operations,CEO,HR;
            OptionCaption = 'Supervisor,Asset,ICT,Finance,Operations,CEO,HR';
        }
    }

    keys
    {
        key(Key1; "Exit Header No", "Document Type", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

