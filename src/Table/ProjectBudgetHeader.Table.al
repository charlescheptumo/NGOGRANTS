#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 65038 "Project Budget Header"
{
    DrillDownPageID = "Projects Budget Plans-Original";
    LookupPageID = "Projects Budget Plans-Original";

    fields
    {
        field(1;"Project Budget ID";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                if "Project Budget ID" <> xRec."Project Budget ID" then begin
                  JobsSetup.Get;
                  NoSeriesMgt.TestManual(JobsSetup."Budget Plan Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Budget Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Revision,Suplementary';
            OptionMembers = Original,Revision,Suplementary;
        }
        field(3;"Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if Jobs.Get("Project ID") then begin
                  "Currency Code":=Jobs."Currency Code";
                  Description:=Jobs.Description;
                  Jobs.CalcFields("Unbudgeted Amount");
                  "Total Unbudgeted Amount":=Jobs."Unbudgeted Amount";
                end;
            end;
        }
        field(4;"Financial Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(5;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(6;"No. Series";Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(7;"Currency Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(8;"External Document No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Original Budget Cost";Decimal)
        {
            CalcFormula = sum("Project Budget Planning Line"."Total Cost" where ("Project Budget ID"=field("Project Budget ID")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                TestField("Budget Category");
                if "Budget Category"="budget category"::"Receipt Budget" then begin
                   TestField("Receipt To Bugdet");
                   CalcFields("Original Budget Cost (LCY)");
                   if ("Original Budget Cost (LCY)"<>"Receipt Amount To Budget") then
                      Error('Amount Budgeted must be equal to receipt amount');
                end;
            end;
        }
        field(11;"Original Budget Cost (LCY)";Decimal)
        {
            CalcFormula = sum("Project Budget Planning Line"."Total Cost (LCY)" where ("Project Budget ID"=field("Project Budget ID")));
            FieldClass = FlowField;
        }
        field(12;"Revision Budget Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Revision Budget Cost(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Supplementary Budget Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Supplementary Budget Cost(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Created On";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Funding Source";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(19;"Procurement Plan";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Update Procurement Plan";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Total Unbudgeted Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Budget Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Receipt Budget,Special Budget';
            OptionMembers = " ","Receipt Budget","Special Budget";
        }
        field(24;"Receipt To Bugdet";Code[30])
        {
            //DataClassification = ToBeClassified;
           // TableRelation = if ("Budget Category"=const("Receipt Budget")) "Receipts Header1"."No." where ("Project No"=field("Project ID"),
                                                                                                        //    Posted=const(true),
                                                                                                        //    Budgeted=const(false));

           // trigger OnValidate()
            //begin
               // ReceiptJobLedgerentry.Reset;
                //ReceiptJobLedgerentry.SetRange("Document No","Receipt To Bugdet");
                // ReceiptJobLedgerentry.SetRange(Type,ReceiptJobLedgerentry.Type::Receipt);
                // ReceiptJobLedgerentry.SetRange(Allocated,false);
              //  if ReceiptJobLedgerentry.FindFirst then begin
            //       "Receipt Amount To Budget":=ReceiptJobLedgerentry.Amount;
            //       end else
            //        Error('This Receipt does not contain any unbudgeted Entries for Project %1',"Project ID");
          //  end;
    }
        field(25;"Receipt Amount To Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project Budget ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        JobsSetup.Get();
        if "Project Budget ID" = '' then begin
          JobsSetup.TestField("Budget Plan Nos");
          NoSeriesMgt.InitSeries(JobsSetup."Budget Plan Nos",xRec."No. Series",0D,"Project Budget ID","No. Series");
        end;

        "Created By":=UserId;
        //"Created On":=TODAY;
        //"External Document No.":="Project Budget ID";
    end;

    var
        JobsSetup: Record "Jobs Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Jobs: Record Job;
        //ReceiptJobLedgerentry: Record "Packing Records";
}
