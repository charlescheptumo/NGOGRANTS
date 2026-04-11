#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50040 "tableextension50040" extends "Standard Vendor Purchase Code"
{
    fields
    {

        //Unsupported feature: Property Insertion (DataClassification) on ""Vendor No."(Field 1)".


        //Unsupported feature: Property Insertion (DataClassification) on "Code(Field 2)".


        //Unsupported feature: Property Insertion (DataClassification) on "Description(Field 3)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Quotes"(Field 15)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Orders"(Field 16)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Invoices"(Field 17)".


        //Unsupported feature: Property Modification (DataClassification) on ""Insert Rec. Lines On Cr. Memos"(Field 18)".


        //Unsupported feature: Code Insertion on ""Vendor No."(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        Vend.RESET;
        Vend.SETRANGE("No.","Vendor No.");
        IF Vend.FINDSET THEN BEGIN
          "Vendor Name":=Vend.Name;
           "Primary Email":=Vend."E-Mail";
          END;
        */
        //end;


        field(70700; "IFS Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code".Code;
        }
        field(70701; "Bid No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70702; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70703; "Primary Email"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(70704; "Positive Intent To Bid"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is updated based on the invited bidder''s acknowledgement of their intent to participate in the IFS';
        }
        field(70705; "Invitation Email Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70706; "Date/Time Notified"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70707; "No. of Posted Addendum Notices"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70708; "Posted Addendum Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Last Posted Addendum Notice No.';
        }
        field(70709; "Bid Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(70710; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70711; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70712; "Prebid Register No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register".Code;
        }
        field(70713; "Prebid Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70714; "Bid Opening Register No."; Code[10])
        {
            Caption = 'Bid Opening Register No.  (Technical)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Technical)';
            TableRelation = "Bid Opening Register".Code;
        }
        field(70715; "Bid Opening Date (Technical)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70716; "Late Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70717; "Withdrawn Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70718; "Bid Withdrawal Notice No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70719; "Modified Bid (Opening Stage)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70720; "Bid Opening Result"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70721; "Bid Opening Committee Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70722; "Preliminary Evaluation Reg"; Code[20])
        {
            Caption = 'Preliminary Evaluation Register No.';
            DataClassification = ToBeClassified;
            Description = 'Preliminary Evaluation Register No.';
        }
        field(70723; "Preliminary Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70724; "Preliminary Evaluation Outcome"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70725; "Preminary Evaluation Committee"; Text[100])
        {
            Caption = 'Evaluation Committee Remarks (Preminary Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Preminary Evaluation)';
        }
        field(70726; "Technical Evaluation Reg"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Technical Evaluation Register No.';
        }
        field(70727; "Technical Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70728; "Min Weighted Tech Pass Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Minimum Weighted Tech Pass Score %';
        }
        field(70729; "Weighted Technical  Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70730; "Technical Evaluation  Outcome"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70731; "Evaluation Committee Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Technical Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Technical Evaluation)';
        }
        field(70732; "Technical Evaluation Committee"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70733; "Bid Opening Finance Register"; Code[20])
        {
            Caption = 'Bid Opening Register No.  (Financial)';
            DataClassification = ToBeClassified;
            Description = 'Bid Opening Register No.  (Financial)';
        }
        field(70734; "Bid Opening Date (Financial)"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70735; "Financial Eval Register No"; Code[20])
        {
            Caption = 'Financial Evaluation Register No';
            DataClassification = ToBeClassified;
            Description = 'Financial Evaluation Register No';
        }
        field(70736; "Financial Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70737; "Read-out Bid Price (A)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70738; "Arithmetic Corrections (B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70739; "Corrected Bid Price (C=A+B)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70740; "Unconditional Discount % (D)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70741; "Unconditional Disc Amount (E)"; Decimal)
        {
            Caption = 'Unconditional Discount Amount (E)';
            DataClassification = ToBeClassified;
            Description = 'Unconditional Discount Amount (E)';
        }
        field(70742; "Corrected & Disc Bid Price"; Decimal)
        {
            Caption = 'Corrected & Discounted Bid Price (F=C-E)';
            DataClassification = ToBeClassified;
            Description = 'Corrected & Discounted Bid Price (F=C-E)';
        }
        field(70743; "Any Additional Adjustments (G)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70744; "Any Priced Deviations (H))"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70745; "Final Evaluated Bid Price"; Decimal)
        {
            Caption = 'Final Evaluated Bid Price (I=F+G+H)';
            DataClassification = ToBeClassified;
            Description = 'Final Evaluated Bid Price (I=F+G+H)';
        }
        field(70746; "Weighted Financial Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70747; "Financial Evaluation Ranking"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70748; "Financial Evaluation Comm Rem"; Text[250])
        {
            Caption = 'Evaluation Committee Remarks (Financial Evaluation)';
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Remarks (Financial Evaluation)';
        }
        field(70749; "Aggregate Weighted Score %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70750; "Evaluation Committee Recomm"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Evaluation Committee Recommendation';
            OptionCaption = ',Award,Unsuccesful';
            OptionMembers = ,Award,Unsuccesful;
        }
        field(70751; "Final Evaluation Report"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70752; "Final Evaluation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70753; "Professional Opion ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Tabulation Header".Code;
        }
        field(70754; "Professional Opion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70755; "Due Dilgence Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70756; "Due Diligence Rating"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Due Diligence Assessment Rating';
        }
        field(70757; "Due Diligence Report ID"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(70758; "Due Diligence Voucher"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70759; "Procurement Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
        }
        field(70760; "Vendor 2"; Code[20])
        {
            TableRelation = "Vendor Prequalification Entry"."Vendor No.";
            trigger OnValidate()
            begin
                "Vendor No." := "Vendor 2";

                // if Vend.Find('-') then begin
                if Vend.Get("Vendor 2") then begin
                    "Vendor Name" := Vend.Name;
                    "Primary Email" := Vend.Email;
                end;
            end;
        }
    }
    keys
    {
        key(Key1; "Procurement Category")
        {

        }
    }
    /* trigger OnAfterInsert()
    begin
        "IFS Code" := Code;
        if IFS.Get(Code) then begin
            "Procurement Category" := IFS."Procurement Category ID";
        end;
        Modify();
    end; */

    var
        Vend: Record Vendor;
        IFS: Record "Standard Purchase Code";
}

