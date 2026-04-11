#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50076 "tableextension50076" extends "Approval Entry"
{

    fields
    {

        field(50000; "From Date"; Date)
        {
            DataClassification = ToBeClassified;
            
        }
        field(50001; "To Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Original Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Statement No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Employee No."; Code[50])
        {
            TableRelation = Employee;
        }
    }

}

