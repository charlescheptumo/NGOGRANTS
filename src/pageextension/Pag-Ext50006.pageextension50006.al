#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// PageExtension pageextension50006 (ID 50006) extends Record General Ledger Entries.
/// </summary>
#pragma implicitwith disable
PageExtension 50006 "pageextension50006" extends "General Ledger Entries"
{
    layout
    {
        modify("Document No.")
        {
            Editable = true;
        }
        modify("Job No.")
        {
            Visible = true;
            Caption = 'Project No.';
            Editable = true;
        }
        addafter("Job No.")
        {
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = Basic;
                Caption = 'Project Activity Code';
                Editable = true;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = Basic;
                Caption = 'Project Activity Quantity';
                Editable = true;
            }
            field("Source Currency"; Rec."Source Currency Code")
            {
                ApplicationArea = Basic;
                Caption = 'Source Currency';
                Editable = false;
            }
            field("Currency"; Rec."Original Currency")
            {
                ApplicationArea = Basic;
                Caption = 'Currency';
                Editable = false;
            }
        }

        //Unsupported feature: Property Modification (Visible) on ""Debit Amount"(Control 17)".


        //Unsupported feature: Property Modification (Visible) on ""Credit Amount"(Control 19)".

        addafter(Description)
        {
            field(Name; Rec.Name)
            {
                ApplicationArea = Basic;
            }
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Credit Amount")
        {
            // field("Source No.";"Source No.")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Transaction Type"; Rec."Transaction Type")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Bal. Account No.")
        {
            field("Bal. Account Name"; Rec."Bal. Account Name")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Promoted) on "ReverseTransaction(Action 63)".


        //Unsupported feature: Property Insertion (Visible) on "ReverseTransaction(Action 63)".
        addafter("&Navigate")
        {
            // action(PostJobs)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Post Projects';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Image = CalculateBalanceAccount;

            //     trigger OnAction()
            //     var
            //         PostJobs: Codeunit "Post Jobs";
            //     begin
            //         PostJobs.PostJobs(Rec);
            //     end;
            // }
            action(UpdateJobs)
            {
                ApplicationArea = All;
                Caption = 'Update Projects';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CalculateBalanceAccount;

                trigger OnAction()
                var
                    // PostJobs: Codeunit "Post Jobs";
                    GLEntry: Record "G/L Entry";
                    DimensionCorrection: Record "Update GL Entries";
                    DimensionCorrectionMgt: Codeunit "GL Entry Mgt";

                begin
                    CurrPage.SetSelectionFilter(GLEntry);
                    if GLEntry.Count() > 1000 then
                        Error('Too Many GLEntries Selected Err');
                    DimensionCorrectionMgt.CreateCorrectionFromSelection(GLEntry, DimensionCorrection);
                    Page.Run(PAGE::"GL Entry Update Draft", DimensionCorrection);
                end;
            }
            // action(UpdateGLEntry)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Update G/L Entry';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Image = Image;
            //     RunObject = report "Update GL Entry";

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }

    trigger OnAfterGetRecord()
    var
        Vend: record Vendor;
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Emp: Record Employee;
    begin
        case Rec."Bal. Account Type" of
            Rec."Bal. Account Type"::"G/L Account":
                begin
                    if GLAccount.Get(Rec."Bal. Account No.") then begin
                        Rec."Bal. Account Name" := GLAccount.Name;
                    end;
                end;
            Rec."Bal. Account Type"::Customer:
                begin
                    if Customer.Get(Rec."Bal. Account No.") then begin
                        Rec."Bal. Account Name" := Customer.Name;
                    end;
                end;


            Rec."Bal. Account Type"::Employee:
                begin
                    if Emp.Get(Rec."Bal. Account No.") then begin
                        Rec."Bal. Account Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    end;
                end;
            Rec."Bal. Account Type"::Vendor:
                begin
                    if Vend.Get(Rec."Bal. Account No.") then begin
                        Rec."Bal. Account Name" := Vend.Name;
                    end;
                end;
            Rec."Bal. Account Type"::"Bank Account":
                begin
                    if Bank.Get(Rec."Bal. Account No.") then begin
                        Rec."Bal. Account Name" := Bank.Name;
                    end;
                end;
            Rec."Bal. Account Type"::"Fixed Asset":
                begin
                    if FixedAsset.Get(Rec."Bal. Account No.") then begin
                        Rec."Bal. Account Name" := FixedAsset.Description;
                    end;
                end;

        end;
    end;

    //Unsupported feature: Code Modification on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CODEUNIT.RUN(CODEUNIT::"G/L Entry-Edit",Rec);
    EXIT(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {CODEUNIT.RUN(CODEUNIT::"G/L Entry-Edit",Rec);
    EXIT(FALSE);}
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetControlVisibility;

    IF GETFILTERS <> '' THEN
      IF FINDFIRST THEN;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4


    // IF ObjUserSetup.GET(USERID) THEN BEGIN
    //  SETRANGE("Global Dimension 1 Code",ObjUserSetup."Region Code");
    //  END;
    */
    //end;
    // trigger OnModifyRecord(): Boolean
    // var
    //     GLEntry: Record "G/L Entry";
    // begin
    //     GLEntry.Init();
    //     // GLEntry.Get();
    // end;
}

#pragma implicitwith restore

