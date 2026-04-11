#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69029 "HR Applicant Accounts"
{

    fields
    {
        field(1;ID;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;FirstName;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;LastName;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Password;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Salt;Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

