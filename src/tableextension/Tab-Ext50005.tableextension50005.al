#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50005 "tableextension50005" extends "G/L Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""User ID"(Field 27)".


        //Unsupported feature: Code Modification on ""G/L Account No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        UpdateAccountID;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //UpdateAccountID;
        */
        //end;


        //Unsupported feature: Code Modification on ""Document No."(Field 6).OnLookup".

        //trigger "(Field 6)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IncomingDocument.HyperlinkToDocument("Document No.","Posting Date");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //IncomingDocument.HyperlinkToDocument("Document No.","Posting Date");
        */
        //end;


        //Unsupported feature: Code Modification on ""User ID"(Field 27).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        UserMgt.LookupUserID("User ID");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //UserMgt.LookupUserID("User ID");
        */
        //end;
        field(50004; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(50000; "Vendor Name"; Text[200])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Source No.")));
            FieldClass = FlowField;
        }
        field(50008; "Broker/Agency Code"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50009; "Broker/Agency Name"; Text[50])
        {
        }
        field(50010; "Sales Rep. No."; Code[20])
        {
        }
        field(50011; "Sales Rep. Name"; Text[50])
        {
        }
        field(50012; "First Premium"; Decimal)
        {
        }
        field(50013; "PCF  Levy"; Decimal)
        {
        }
        field(50014; "Training Levy"; Decimal)
        {
        }
        field(50015; "Stamp Duty"; Decimal)
        {
        }
        field(50016; "Yellow Card"; Decimal)
        {
        }
        field(50017; "R/I Code"; Option)
        {
            OptionMembers = "1","2","3","4","5","6";
        }
        field(50018; "Period Start"; Date)
        {
        }
        field(50019; "Period End"; Date)
        {
        }
        field(50020; "Percentage Of Share"; Decimal)
        {
        }
        field(50021; "Total Renewable Premium"; Decimal)
        {
        }
        field(50022; "Share Of Risk (%)"; Decimal)
        {
        }
        field(50023; "Endorsement No."; Code[20])
        {
        }
        field(50024; "Commission Rate"; Decimal)
        {
        }
        field(50025; "Commission Amount"; Decimal)
        {
        }
        field(50026; "Net Premium"; Decimal)
        {
        }
        field(50027; "Business Source"; Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
        }
        field(50028; "Business Line"; Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
        }
        field(50029; "Business Class"; Code[10])
        {
        }
        field(50030; Department; Code[20])
        {
        }
        // field(50031; "Investment Code"; Code[20])
        // {
        //     TableRelation = "Investment Asset";
        // }
        field(50032; "No. Of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                /* IF "Receipt Payment Type"="Receipt Payment Type"::"Unit Trust" THEN BEGIN
                 IF Brokers.GET("Unit Trust Member No") THEN BEGIN
                
                 Brokers.CALCFIELDS("No.Of Units","Acquisition Cost","Current Value",Revaluations);
                 IF "No. Of Units">Brokers."No.Of Units" THEN
                  ERROR('You cannot redeem more units than you have!!');
                
                
                   IF  Brokers."No.Of Units" >0 THEN
                // "Current unit price":=Brokers."Current Value"/Brokers."No.Of Units" ;
                 //"Price Per Share":="Current unit price";
                VALIDATE("Price Per Share");
                VALIDATE(Amount);
                  END;
                
                 END ELSE BEGIN
                  IF "No. Of Units"<0 THEN
                  ERROR('You Cannot Sale Negative No. of Shares!!');
                
                   VALIDATE(Amount);
                 END;*/

            end;
        }
        field(50033; "Investment Transcation Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Contribution,Withdrawal';
            OptionMembers = "  ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Contribution,Withdrawal;
        }
        field(50034; "Original Currency"; Code[20])
        {
            TableRelation = Currency;
        }
        field(50035; "Original Currency Amount"; Decimal)
        {
        }
        field(50036; "AC Type"; Option)
        {
            OptionMembers = "Income Statement","Balance Sheet";
        }
        field(50037; "GL Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Loan Repayment';
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,"Loan Repayment",Subsidy;
        }
        field(50038; "UT Member No"; Code[20])
        {
        }
        field(50039; "Unit Trust Type"; Option)
        {
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
        }
        field(50040; "Books Closure Date"; Date)
        {
        }
        field(50041; "Payment Date"; Date)
        {
        }
        // field(50042; "Fund Code"; Code[20])
        // {
        //     TableRelation = "Fund Code".Code;
        // }
        // field(50043; "Custodian Code"; Code[20])
        // {
        //     TableRelation = "Custodian Code".Code;
        // }
        field(50044; "Cheque No"; Integer)
        {
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
               IF ProcurementPlan.FIND('-') THEN BEGIN
               IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                 Type:=Type::Item;
                 No:=ProcurementPlan."No.";
               END;
               IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                Type:=Type::"Non Stock";
                No:=ProcurementPlan."Source of Funds";
               END;
                 "Budget Line":=ProcurementPlan."Source of Funds";
                  Description:=ProcurementPlan."Item Description";
                 "Unit of Measure":=ProcurementPlan."Unit of Measure";
                 "Unit Price":=ProcurementPlan."Unit Price";
               END;
              */

            end;
        }
        field(70002; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70003; "Description 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(85000; "Transaction Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70004; "Job Task No."; Code[100])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            trigger OnValidate()
            var
                GLEntries: Record "G/L Entry";
            //     IsHandled: Boolean;
            begin
                // GLEntries.Modify(true);
                //     IsHandled := false;
                //     OnBeforeValidateJobTaskNo(xRec, IsHandled);
                //     if IsHandled then
                //         exit;

                //     if "Job Task No." <> xRec."Job Task No." then
                //         Validate("Job Planning Line No.", 0);
                //     if "Job Task No." = '' then begin
                //         ClearJobRelatedAmounts();
                //         exit;
                //     end;

                //     OnValidateJobTaskNoOnBeforeJobTaskIsSet(Rec);
                //     if JobTaskIsSet() then begin
                //         CreateTempJobJnlLine();
                //         CopyDimensionsFromJobTaskLine();
                //         UpdatePricesFromJobJnlLine();
                //     end;
            end;
        }
        field(70005; "Job Quantity"; Decimal)
        {
            trigger OnValidate()
            var
                GLEntries: Record "G/L Entry";
            begin
                // GLEntries.Modify(true);
                //     if JobTaskIsSet() then begin
                //         if "Job Planning Line No." <> 0 then
                //             Validate("Job Planning Line No.");
                //         CreateTempJobJnlLine();
                //         // UpdatePricesFromJobJnlLine();
                //     end;
            end;
        }
        field(70006; "Job Planning Line No."; Integer)
        {
            AccessByPermission = TableData Job = R;
            BlankZero = true;
            Caption = 'Job Planning Line No.';

            trigger OnLookup()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                JobPlanningLine.SetRange("Job No.", "Job No.");
                JobPlanningLine.SetRange("Job Task No.", "Job Task No.");
                JobPlanningLine.SetRange(Type, JobPlanningLine.Type::"G/L Account");
                JobPlanningLine.SetRange("No.", "G/L Account No.");
                JobPlanningLine.SetRange("Usage Link", true);
                JobPlanningLine.SetRange("System-Created Entry", false);

                if PAGE.RunModal(0, JobPlanningLine) = ACTION::LookupOK then
                    Validate("Job Planning Line No.", JobPlanningLine."Line No.");
            end;

            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                if "Job Planning Line No." <> 0 then begin
                    JobPlanningLine.Get("Job No.", "Job Task No.", "Job Planning Line No.");
                    JobPlanningLine.TestField("Job No.", "Job No.");
                    JobPlanningLine.TestField("Job Task No.", "Job Task No.");
                    JobPlanningLine.TestField(Type, JobPlanningLine.Type::"G/L Account");
                    // JobPlanningLine.TestField("No.", "Account No.");
                    JobPlanningLine.TestField("Usage Link", true);
                    JobPlanningLine.TestField("System-Created Entry", false);
                    "Job Line Type" := JobPlanningLine.ConvertToJobLineType();
                    Validate("Job Remaining Qty.", JobPlanningLine."Remaining Qty." - "Job Quantity");
                end else
                    Validate("Job Remaining Qty.", 0);
            end;
        }
        field(70007; "Job Line Type"; Enum "Job Line Type")
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Line Type';

            trigger OnValidate()
            begin
                if "Job Planning Line No." <> 0 then
                    Error(Text019, FieldCaption("Job Line Type"), FieldCaption("Job Planning Line No."));
            end;
        }
        field(70008; "Job Remaining Qty."; Decimal)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Remaining Qty.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                if ("Job Remaining Qty." <> 0) and ("Job Planning Line No." = 0) then
                    Error(Text018, FieldCaption("Job Remaining Qty."), FieldCaption("Job Planning Line No."));

                if "Job Planning Line No." <> 0 then begin
                    JobPlanningLine.Get("Job No.", "Job Task No.", "Job Planning Line No.");
                    if JobPlanningLine.Quantity >= 0 then begin
                        if "Job Remaining Qty." < 0 then
                            "Job Remaining Qty." := 0;
                    end else begin
                        if "Job Remaining Qty." > 0 then
                            "Job Remaining Qty." := 0;
                    end;
                end;
            end;
        }
        field(70009; "Job Currency Factor"; Decimal)
        {
            Caption = 'Job Currency Factor';
        }
        field(70010; "Job Currency Code"; Code[10])
        {
            Caption = 'Job Currency Code';

            trigger OnValidate()
            begin
                // if ("Job Currency Code" <> xRec."Job Currency Code") or ("Job Currency Code" <> '') then
                // if JobTaskIsSet() then begin
                //     CreateTempJobJnlLine();
                //     // UpdatePricesFromJobJnlLine();
                // end;
            end;
        }
        // field(18; "Currency Factor"; Decimal)
        // {
        //     Caption = 'Currency Factor';
        //     DecimalPlaces = 0 : 15;
        //     Editable = false;
        //     MinValue = 0;

        //     trigger OnValidate()
        //     begin
        //         if ("Currency Code" = '') and ("Currency Factor" <> 0) then
        //             FieldError("Currency Factor", StrSubstNo(Text002, FieldCaption("Currency Code")));
        //         Validate(Amount);
        //     end;
        // }
        field(70011; "Bal. Account Name"; Text[150])
        {
        }
        // field(70012; "Sub Award Amount"; Decimal)
        // {
        //     CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
        //                                                 "G/L Account No." = field(FILTER(Totaling)),
        //                                                 "Business Unit Code" = field("Business Unit Filter"),
        //                                                 "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
        //                                                 "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
        //                                                 "Posting Date" = field(UPPERLIMIT("Date Filter")),
        //                                                 "VAT Reporting Date" = field(UPPERLIMIT("VAT Reporting Date Filter")),
        //                                                 "Dimension Set ID" = field("Dimension Set ID Filter")));
        //     Caption = 'Balance at Date';
        //     FieldClass = FlowField;
        //     trigger OnValidate()
        //     begin

        //     end;
        // }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Modified DateTime" := CURRENTDATETIME;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //"Last Modified DateTime" := CURRENTDATETIME;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Modified DateTime" := CURRENTDATETIME;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //"Last Modified DateTime" := CURRENTDATETIME;
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Modified DateTime" := CURRENTDATETIME;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //"Last Modified DateTime" := CURRENTDATETIME;
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 4)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    "Document Type" := GenJnlLine."Document Type";
    #4..33
    "No. Series" := GenJnlLine."Posting No. Series";
    "IC Partner Code" := GenJnlLine."IC Partner Code";

    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..36
    //added for procurement plan
    "Procurement Plan":=GenJnlLine."Procurement Plan";
    "Procurement Plan Item":=GenJnlLine."Procurement Plan Item";


    OnAfterCopyGLEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    // var
    //     Text018: Label '%1 can only be set when %2 is set.';
    //     Text019: Label '%1 cannot be changed when %2 is set.';
    //     TempJobJnlLine: Record "Job Journal Line" temporary;
    //     CurrencyDate: Date;
    var
        Text000: Label '%1 or %2 must be a G/L Account or Bank Account.', Comment = '%1=Account Type,%2=Balance Account Type';
        Text001: Label 'You must not specify %1 when %2 is %3.';
        Text002: Label 'cannot be specified without %1';
        ChangeCurrencyQst: Label 'The Currency Code in the Gen. Journal Line will be changed from %1 to %2.\\Do you want to continue?', Comment = '%1=FromCurrencyCode, %2=ToCurrencyCode';
        UpdateInterruptedErr: Label 'The update has been interrupted to respect the warning.';
        Text006: Label 'The %1 option can only be used internally in the system.';
        Text007: Label '%1 or %2 must be a bank account.', Comment = '%1=Account Type,%2=Balance Account Type';
        Text008: Label ' must be 0 when %1 is %2.';
        Text009: Label 'LCY';
        Text010: Label '%1 must be %2 or %3.';
        Text011: Label '%1 must be negative.';
        Text012: Label '%1 must be positive.';
        Text013: Label 'The %1 must not be more than %2.';
        WrongJobQueueStatus: Label 'Journal line cannot be modified because it has been scheduled for posting.';
        RenumberDocNoQst: Label 'If you have many documents it can take time to sort them, and %1 might perform slowly during the process. In those cases we suggest that you sort them during non-working hours. Do you want to continue?', Comment = '%1= Business Central';
        [SecurityFiltering(SecurityFilter::Filtered)]
        GenJnlTemplate: Record "Gen. Journal Template";
        [SecurityFiltering(SecurityFilter::Filtered)]
        GenJnlBatch: Record "Gen. Journal Batch";
        [SecurityFiltering(SecurityFilter::Filtered)]
        GenJnlLine: Record "Gen. Journal Line";
        PaymentTerms: Record "Payment Terms";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        EmplLedgEntry: Record "Employee Ledger Entry";
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        VATPostingSetup: Record "VAT Posting Setup";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        GenProdPostingGrp: Record "Gen. Product Posting Group";
        GLSetup: Record "General Ledger Setup";
        Job: Record Job;
        SourceCodeSetup: Record "Source Code Setup";
        TempJobJnlLine: Record "Job Journal Line" temporary;
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit "No. Series";
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
        SalesTaxCalculate: Codeunit "Sales Tax Calculate";
        GenJnlApply: Codeunit "Gen. Jnl.-Apply";
        GenJnlShowCTEntries: Codeunit "Gen. Jnl.-Show CT Entries";
        CustEntrySetApplID: Codeunit "Cust. Entry-SetAppl.ID";
        VendEntrySetApplID: Codeunit "Vend. Entry-SetAppl.ID";
        EmplEntrySetApplID: Codeunit "Empl. Entry-SetAppl.ID";
        DimMgt: Codeunit DimensionManagement;
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        DeferralUtilities: Codeunit "Deferral Utilities";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        NonDeductibleVAT: Codeunit "Non-Deductible VAT";
        Window: Dialog;
        DeferralDocType: Enum "Deferral Document Type";
        CurrencyCode: Code[10];
        Text014: Label 'The %1 %2 has a %3 %4.\\Do you still want to use %1 %2 in this journal line?', Comment = '%1=Caption of Table Customer, %2=Customer No, %3=Caption of field Bill-to Customer No, %4=Value of Bill-to customer no.';
        TemplateFound: Boolean;
        Text015: Label 'You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post %1 %2 and then apply it to %3 %4.';
        CurrencyDate: Date;
        Text016: Label '%1 must be G/L Account or Bank Account.';
        Text018: Label '%1 can only be set when %2 is set.';
        Text019: Label '%1 cannot be changed when %2 is set.';
        GLSetupRead: Boolean;
        ExportAgainQst: Label 'One or more of the selected lines have already been exported. Do you want to export them again?';
        NothingToExportErr: Label 'There is nothing to export.';
        NotExistErr: Label 'Document number %1 does not exist or is already closed.', Comment = '%1=Document number';
        DocNoFilterErr: Label 'The document numbers cannot be renumbered while there is an active filter on the Document No. field.';
        DueDateMsg: Label 'This posting date will cause an overdue payment.';
        CalcPostDateMsg: Label 'Processing payment journal lines #1##########';
        NoEntriesToVoidErr: Label 'There are no entries to void.';
        SuppressCommit: Boolean;
        OnlyLocalCurrencyForEmployeeErr: Label 'The value of the Currency Code field must be empty. General journal lines in foreign currency are not supported for employee account type.';
        AccTypeNotSupportedErr: Label 'You cannot specify a deferral code for this type of account.';
        SalespersonPurchPrivacyBlockErr: Label 'Privacy Blocked must not be true for Salesperson / Purchaser %1.', Comment = '%1 = salesperson / purchaser code.';
        BlockedErr: Label 'The Blocked field must not be %1 for %2 %3.', Comment = '%1=Blocked field value,%2=Account Type,%3=Account No.';
        BlockedEmplErr: Label 'You cannot export file because employee %1 is blocked due to privacy.', Comment = '%1 = Employee no. ';
        InvoiceForGivenIDDoesNotExistErr: Label 'Invoice for given Applies-to Invoice Id does not exist.';
        RecurringMethodsDimFilterErr: Label 'Recurring method %1 cannot be used for the line with dimension filter setup.', Comment = '%1 - Recurring Method value';
        RecurringMethodsLineDimdErr: Label 'Recurring method %1 cannot be used for the line with dimension setup.', Comment = '%1 - Recurring Method value';
        DontShowAgainActionTxt: Label 'Don''t show again.';
        SetDimFiltersActionTxt: Label 'Set dimension filters.';
        SetDimFiltersMessageTxt: Label 'Dimension filters are not set for one or more lines that use the BD Balance by Dimension or RBD Reversing Balance by Dimension options. Do you want to set the filters?';
        SpecialSymbolsTok: Label '=|&@()<>', Locked = true;
        MustUseAllGLAccountsAsDestinationAccountsAllocAccErr: Label 'To use Allocation Accounts in combination with deferrals, the selected Allocation Account must have only G/L Accounts as destination types, no other types are allowed.';
        CannotChangePostingGroupForAccountTypeErr: Label 'Posting group cannot be changed for Account Type %1.', Comment = '%1 - account type';

    protected var
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        HideValidationDialog: Boolean;
        SkipTaxCalculation: Boolean;

    local procedure OnBeforeValidateJobTaskNo(xGenJournalLine: Record "Gen. Journal Line"; var IsHandled: Boolean)
    begin
    end;

    local procedure OnBeforeCreateTempJobJnlLine(var JobJournalLine: Record "Job Journal Line"; GenJournalLine: Record "Gen. Journal Line"; xGenJournalLine: Record "Gen. Journal Line"; CurrFieldNo: Integer; var IsHandled: Boolean)
    begin
    end;

    local procedure OnCreateTempJobJnlLimeOnBeforeValidateFields(var TempJobJnlLine: Record "Job Journal Line"; var GenJournalLine: Record "Gen. Journal Line"; var xGenJournalLine: Record "Gen. Journal Line"; FieldNumber: Integer)
    begin
    end;

    local procedure OnBeforeJobTaskIsSet(GenJournalLine: Record "Gen. Journal Line"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    local procedure OnCreateTempJobJnlLineOnBeforeFindJobCurrencyFactor(var GenJournalLine: Record "Gen. Journal Line"; var CurrExchRate: Record "Currency Exchange Rate")
    begin
    end;

    // procedure JobTaskIsSet() Result: Boolean
    // var
    //     IsHandled: Boolean;
    // begin
    //     IsHandled := false;
    //     OnBeforeJobTaskIsSet(Rec, Result, IsHandled);
    //     if IsHandled then
    //         exit(Result);

    //     exit(("Job No." <> '') and ("Job Task No." <> '') and ("Account Type" = "Account Type"::"G/L Account"));
    // end;

    // procedure UpdatePricesFromJobJnlLine()
    // begin
    //     "Job Unit Price" := TempJobJnlLine."Unit Price";
    //     "Job Total Price" := TempJobJnlLine."Total Price";
    //     "Job Line Amount" := TempJobJnlLine."Line Amount";
    //     "Job Line Discount Amount" := TempJobJnlLine."Line Discount Amount";
    //     "Job Unit Cost" := TempJobJnlLine."Unit Cost";
    //     "Job Total Cost" := TempJobJnlLine."Total Cost";
    //     "Job Line Discount %" := TempJobJnlLine."Line Discount %";

    //     "Job Unit Price (LCY)" := TempJobJnlLine."Unit Price (LCY)";
    //     "Job Total Price (LCY)" := TempJobJnlLine."Total Price (LCY)";
    //     "Job Line Amount (LCY)" := TempJobJnlLine."Line Amount (LCY)";
    //     "Job Line Disc. Amount (LCY)" := TempJobJnlLine."Line Discount Amount (LCY)";
    //     "Job Unit Cost (LCY)" := TempJobJnlLine."Unit Cost (LCY)";
    //     "Job Total Cost (LCY)" := TempJobJnlLine."Total Cost (LCY)";

    //     OnAfterUpdatePricesFromJobJnlLine(Rec, TempJobJnlLine);
    // end;



    procedure CreateTempJobJnlLine()
    var
        TmpJobJnlOverallCurrencyFactor: Decimal;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        // OnBeforeCreateTempJobJnlLine(TempJobJnlLine, Rec, xRec, CurrFieldNo, IsHandled);
        // if IsHandled then
        //     exit;

        TestField("Posting Date");

        Clear(TempJobJnlLine);
        TempJobJnlLine.DontCheckStdCost();
        // OnCreateTempJobJnlLimeOnBeforeValidateFields(TempJobJnlLine, Rec, XRec, CurrFieldNo);

        TempJobJnlLine.Validate("Job No.", "Job No.");
        TempJobJnlLine.Validate("Job Task No.", "Job Task No.");
        if CurrFieldNo <> FieldNo("Posting Date") then
            TempJobJnlLine.Validate("Posting Date", "Posting Date")
        else
            TempJobJnlLine.Validate("Posting Date", xRec."Posting Date");
        TempJobJnlLine.Validate(Type, TempJobJnlLine.Type::"G/L Account");

        "Job Currency Factor" := 0;
        if "Job Currency Code" <> '' then begin
            if "Posting Date" = 0D then
                CurrencyDate := WorkDate()
            else
                CurrencyDate := "Posting Date";

            // OnCreateTempJobJnlLineOnBeforeFindJobCurrencyFactor(Rec, CurrExchRate);
            // if "Currency Code" = "Job Currency Code" then
            //     "Job Currency Factor" := "Currency Factor"
            // else
            //     "Job Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Job Currency Code");
            TempJobJnlLine.SetCurrencyFactor("Job Currency Factor");
        end;
        // TempJobJnlLine.Validate("No.", "Account No.");
        TempJobJnlLine.Validate(Quantity, "Job Quantity");

        // if "Currency Factor" = 0 then begin
        //     if "Job Currency Factor" = 0 then
        //         TmpJobJnlOverallCurrencyFactor := 1
        //     else
        //         TmpJobJnlOverallCurrencyFactor := "Job Currency Factor";
        // end else begin
        //     if "Job Currency Factor" = 0 then
        //         TmpJobJnlOverallCurrencyFactor := 1 / "Currency Factor"
        //     else
        //         TmpJobJnlOverallCurrencyFactor := "Job Currency Factor" / "Currency Factor"
        // end;

        // UpdateAmountsOnTempJobJnlLine(TmpJobJnlOverallCurrencyFactor);

        // OnAfterCreateTempJobJnlLine(TempJobJnlLine, Rec, xRec, CurrFieldNo);
    end;
}

