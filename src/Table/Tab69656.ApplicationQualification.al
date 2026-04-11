#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69656 "Application Qualification"
{
    Caption = 'Applicant Qualification';

    fields
    {
        field(1; "Candidate No."; Code[20])
        {
            Caption = 'Candidate No.';
            NotBlank = true;
            TableRelation = Applicant;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; "Qualification Code"; Code[50])
        {
            Caption = 'Qualification Code';
            TableRelation = Qualification where("Qualification Category" = field("Qualification Category"));

            trigger OnValidate()
            begin
                Qualification.Get("Qualification Code");
                Description := Qualification.Description;
            end;
        }
        field(4; "From Date"; Date)
        {
            Caption = 'From Date';
            // trigger OnValidate()
            // var
            //     JobApplications: Record "Job Applications";
            // begin
            //     JobApplications."Work Experience (Years)" := CalcDate('-' + Format("To Date"), "From Date");
            // end;
        }
        field(5; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Internal,External,Previous Position';
            OptionMembers = " ",Internal,External,"Previous Position";
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Institution/Company"; Text[100])
        {
            Caption = 'Institution/Company';
        }
        field(9; Cost; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost';
        }
        field(10; "Course Grade"; Text[50])
        {
            Caption = 'Course Grade';
        }
        field(11; "Applicant Status"; Option)
        {
            Caption = 'Applicant Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }

        field(13; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(14; Year; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Specialization; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Specialized Domain Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Area";
        }
        field(17; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Professional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Professional Bodies";
        }
        field(18; "Academic Hierarchy Code"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
        field(22; "Education Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Post Doctorate,PHD,Masters,Degree,Post Graduate Diploma,Diploma,Certificate';
            OptionMembers = " ","Post Doctorate",PHD,Masters,Degree,"Post Graduate Diploma",Diploma,Certificate;
        }
        field(23; Country; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(24; "Attained Score"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,First Class Hons,Second Class Upper,Second Class Lower,Destinction,Pass,Credit,Others';
            OptionMembers = " ","First Class Hons","Second Class Upper","Second Class Lower",Destinction,Pass,Credit,Others;
        }
        field(25; "Graduation Year"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Membership Registration No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Membership Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Member Renewal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Licensing Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Licensing Renewal Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Job Description/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Terms of Service"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Permanent and Pensionable,Contract,Casual,Internship';
            OptionMembers = " ","Permanent and Pensionable",Contract,Casual,Internship;
            TableRelation = "Terms of Service";
        }
        field(33; "Experience Years"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Duties and Resposibilities"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Proffessional Qualification"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Professional Qualification';
        }
        // field(36; "Completion Year"; Date)
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(36; "Completion Year"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Government,Private';
            OptionMembers = " ",Government,Private;
        }
        field(38; "Ongoing"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Proffessional Qualifications"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application No.", "Candidate No.", "Line No.", "Qualification Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

    end;

    var
        Text000: label 'You cannot delete employee qualification information if there are comments associated with it.';
        Qualification: Record Qualification;
        Employee: Record Employee;
}

