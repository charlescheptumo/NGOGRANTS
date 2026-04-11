table 97126 "WorkPlan Sub Activities"
{
    Caption = 'WorkPlan Sub Activities';
    DataClassification = ToBeClassified;
    DrillDownPageId = "WorkPlan Sub Activities";
    LookupPageId = "WorkPlan Sub Activities";
    
    fields
    {
        field(1; "Sub Activity ID"; Code[50])
        {
            Caption = 'Sub Activity ID';
        }
        field(2; "Sub Activity Description"; Text[2048])
        {
            Caption = 'Sub Activity Description';
        }
    }
    keys
    {
        key(PK; "Sub Activity ID")
        {
            Clustered = true;
        }
    }
}
