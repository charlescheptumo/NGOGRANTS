#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50087 "tableextension50087" extends Contact
{
    fields
    {
        modify("Company No.")
        {
            TableRelation = Contact."No." where(Type = const(Company));
        }

        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          RMSetup.GET;
          NoSeriesMgt.TestManual(RMSetup."Contact Nos.");
          "No. Series" := '';
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "No." <> xRec."No." THEN BEGIN
          IF "Portal Request"=FALSE THEN BEGIN
        #2..4
          END ELSE BEGIN
            ProcSetup.GET;
          NoSeriesMgt.TestManual(ProcSetup."Request For Registration Nos");
          "No. Series" := '';

            END;
        END;
        */
        //end;
        // field(70908; "Application Type"; Code[30])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Acc Fee Schedules" where(Blocked = filter(false));

        //     trigger OnValidate()
        //     var
        //         AccreditationType: Record "Accreditation Type Series";
        //     begin
        //         // AccreditationType.RESET;
        //         // AccreditationType.SETRANGE(Code,"Application Type");
        //         // IF AccreditationType.FINDFIRST THEN BEGIN
        //         // "Application Type Name":=AccreditationType.Description;
        //         //  AccFeeSchedules.RESET;
        //         //  AccFeeSchedules.SETRANGE(Service,AccreditationType.Code);
        //         //  IF AccFeeSchedules.FINDFIRST THEN BEGIN
        //         //    "Application Fee LCY":=AccFeeSchedules.Amount;
        //         //    "Application Fee":="Application Fee LCY"*1;
        //         //
        //         //    END;
        //         //
        //         // END
        //     end;
        // }
        // field(70909; "Institution Type Code"; Code[30])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Institution Types";

        //     trigger OnValidate()
        //     begin
        //         InstitutionTypes.Reset;
        //         InstitutionTypes.SetRange(Code, "Institution Type Code");
        //         if InstitutionTypes.FindFirst then begin
        //             "Institution Type" := InstitutionTypes.Description;
        //         end
        //     end;
        // }
        field(70911; "Institution Type"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(70912; contactName; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50111; test; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50112; password; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50113; "KRA PIN"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50202; "Tax Compliance Certificate No"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50203; "Director 1 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50204; "Director 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50205; "Director 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50206; Group; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Group".Code;
        }
        field(50207; "Sub-Group"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Sub-Group".Code where("Stakeholder Group" = field(Group));
        }
        field(50208; "Parent Contact ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(50209; "Entity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Organization,Individual';
            OptionMembers = Organization,Individual;
        }
        field(50210; UserVerified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50211; "ID Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50212; "Portal Request"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85100; "Course ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85101; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85102; "NCPWD No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85103; "Kasneb Reference No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85104; "Training Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85105; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(85106; Created; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85107; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(85108; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Male,Female,Other;
        }
        field(85109; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85110; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(85111; "Assigned Registration No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85112; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(85113; "Highest Academic QCode"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85114; "Highest Academic Qualification"; Text[200])
        {
            CalcFormula = lookup(Qualification.Description);
            FieldClass = FlowField;
        }
        field(85115; "Course Description"; Text[200])
        {
            CalcFormula = lookup(Qualification.Description);
            FieldClass = FlowField;
        }
        field(85116; "Reason for Rejection"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(85117; "Assigned Customer No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(85118; "Applicant Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Type";
        }
        field(85019; "Exam Transaction Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85020; "Training Institution"; Text[50])
        {
            CalcFormula = lookup(Customer.Name);
            FieldClass = FlowField;
        }
        field(85021; Student; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = New,Existing;
        }
        field(85022; "Record Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Contact,Student,Job Applicant';
            OptionMembers = Contact,Student,"Job Applicant";
        }
        field(85023; Generated; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        ProcSetup: Record "Procurement Setup";
        // InstitutionTypes: Record "Institution Types";
}

