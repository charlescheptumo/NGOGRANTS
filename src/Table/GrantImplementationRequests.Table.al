#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60181 "Grant Implementation Requests"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Created By"; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Project No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";//where ("Grant Nature"=const(External));

            trigger OnValidate()
            begin
                if Job.Get("Project No.") then begin
                    "Project Name" := Job.Description;
                    Validate("PI No.", Job."Researcher Code");
                    Validate("Project Accountant", Job."Person Responsible");
                  //  Validate(Grantor, Job."Awarding Agency");
                end;
            end;
        }
        field(5; "Project Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "PI No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("PI No.") then
                    "PI Name" := Employee.FullName;
            end;
        }
        field(7; "PI Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Invoicing';
            OptionMembers = Invoicing;
        }
        field(9; "Initiated By"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,PI,PAC';
            OptionMembers = " ",PI,PAC;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Submitted,Invoice Created';
            OptionMembers = New,Submitted,"Invoice Created";
        }
        field(11; "Project Accountant"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Project Accountant") then
                    "Accountant Name" := Employee.FullName;
            end;
        }
        field(12; "Accountant Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Datetime Submitted"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Datetime Actioned"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Invoice No Created"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Amount To Invoice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18; Grantor; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Customer.Get(Grantor) then
                    "Grantor Name" := Customer.Name;
            end;
        }
        field(19; "Grantor Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            //ExtGrantMgmntSetup.Get;
            //  ExtGrantMgmntSetup.TestField("Implementation Requests");
            // "No.":=NoSeriesManagement.GetNextNo(ExtGrantMgmntSetup."Implementation Requests",Today,true);
            "Created On" := CurrentDatetime;
            if GuiAllowed then
                "Created By" := UserId;
        end;
    end;

    var
        NoSeriesManagement: Codeunit "No. Series";
      //  ExtGrantMgmntSetup: Record "Ext. Grant Mgmnt. Setup";
        Job: Record Job;
        Employee: Record Employee;
        Customer: Record Customer;
}
