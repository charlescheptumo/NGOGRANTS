#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50004 "tableextension50004" extends "G/L Account"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Account Subcategory Descript."(Field 81)".

        // modify("Balance at Date")
        // {
        //     // trigger OnAfterValidate()
        //     // var
        //     //     BankAccount: Record "Bank Account";
        //     // begin
        //     //     if BankAccount."Currency Code" <> '' then begin
        //     //         // "Balance at Date" := BankAccount.Balance;
        //     //         "Balance at Date" := BankAccount."Balance at Date";
        //     //     end else begin
        //     //         "Balance at Date" := BankAccount."Balance at Date (LCY)";
        //     //     end;
        //     // end;

        //     // trigger OnBeforeValidate()
        //     // var
        //     //     BankAccount: Record "Bank Account";
        //     // begin
        //     //     if BankAccount."Currency Code" <> '' then begin
        //     //         // "Balance at Date" := BankAccount.Balance;
        //     //         "Balance at Date" := BankAccount."Balance at Date";
        //     //     end else begin
        //     //         "Balance at Date" := BankAccount."Balance at Date (LCY)";
        //     //     end;
        //     // end;
        // }

        field(50000; "Budget Controlled"; Boolean)
        {
        }
        field(50001; "Account Category 1"; Option)
        {
            Description = '//ALREADY EXIST IN 2017';
            OptionMembers = " ","Capital Fund","Revaluation Reserve","Revenue Reserve","Year PL ","Prior year","Long Term Liability","Current Liability","Fixed Asset","Current Asset",Revenue,"Direct Costs",Expense;

            trigger OnValidate()
            begin
                //Prevent Changing once entries exist
                //{TestNoEntriesExist(FIELDCAPTION("Account Category"));
            end;
        }
        field(50002; "Global Dimension 3 Filter"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50004; "Expense Code"; Code[10])
        {

            trigger OnValidate()
            begin
                /* //Expense code only applicable if account type is posting and Budgetary control is applicable
                 TESTFIELD("Account Type","Account Type"::Posting);
                 TESTFIELD("Budget Controlled",TRUE);

               */

            end;
        }
        field(50005; "Global Dimension 4 Filter"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50006; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ///ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(50007; "Global Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Global Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(50008; "Global Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Global Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(50009; "Balance at Date Cust"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("No."),
                                                        "G/L Account No." = field(FILTER(Totaling)),
                                                        "Business Unit Code" = field("Business Unit Filter"),
                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                        "Posting Date" = field(UPPERLIMIT("Date Filter")),
                                                        "VAT Reporting Date" = field(UPPERLIMIT("VAT Reporting Date Filter")),
                                                        "Dimension Set ID" = field("Dimension Set ID Filter")));
            Caption = 'Balance at Date Cust';
            Editable = false;
            FieldClass = FlowField;

            // trigger OnValidate()
            // var
            //     BankAccount: Record "Bank Account";
            // begin
            //     if BankAccount."Currency Code" <> '' then begin
            //         // "Balance at Date" := BankAccount.Balance;
            //         "Balance at Date" := BankAccount."Balance at Date";
            //     end else begin
            //         "Balance at Date" := BankAccount."Balance at Date (LCY)";
            //     end;
            // end;
        }
    }
}

