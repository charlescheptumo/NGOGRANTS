report 50029 "Update GL Dimensions Receipts"
{
    Caption = 'Update GL Dimensions Receipt';
    UsageCategory = Tasks;
    ApplicationArea = All;
    ProcessingOnly = true;

    // 🔒 Grant report-level permission to modify G/L Entry and read Payments
    Permissions =
        tabledata "G/L Entry" = m,
        tabledata Payments = r;

    dataset
    {


        dataitem("Receipt Lines1"; "Receipt Lines1")
        {
            RequestFilterFields = "Receipt No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";

            column(PCPTNo; "Receipt No.")
            {
            }

            trigger OnAfterGetRecord()
            var
                GLEntry: Record "G/L Entry";
                CountUpdated: Integer;
                PaymentsX: Record "Receipt Lines1";
            begin
                
                if not UpdateConfirm then
                    exit;

                PaymentsX.Reset();
                PaymentsX.SetRange("Receipt No.", "Receipt Lines1"."Receipt No.");
                if PaymentsX.FindSet() then begin
                    PaymentsX.Validate("Shortcut Dimension 1 Code", "Receipt Lines1"."Shortcut Dimension 1 Code");
                    PaymentsX.Validate("Shortcut Dimension 2 Code", "Receipt Lines1"."Shortcut Dimension 2 Code");
                    PaymentsX.Validate("Shortcut Dimension 3 Code", "Receipt Lines1"."Shortcut Dimension 3 Code");
                    // PaymentsX.Validate("Shortcut Dimension 4 Code", "Receipt Lines1"."Shortcut Dimension 4 Code");

                    PaymentsX.Modify();
                end;

                GLEntry.Reset();
                GLEntry.SetRange("Document No.", "Receipt Lines1"."Receipt No.");
                if GLEntry.FindSet() then begin
                    repeat
                        // Message('Processing G/L Entry %1 for Receipt %2', GLEntry."Entry No.", "Receipt Lines1"."Receipt No.");
                        // ✅ Update dimensions only if values exist on the Payment record
                        if "Receipt Lines1"."Global Dimension 1 Code" <> '' then begin
                            "Receipt Lines1".validate("Global Dimension 1 Code", "Receipt Lines1"."Global Dimension 1 Code");
                            GLEntry."Global Dimension 1 Code" := "Receipt Lines1"."Global Dimension 1 Code";
                        end;
                        //GLEntry.Validate("Global Dimension 1 Code", "Receipt Lines1"."Shortcut Dimension 1 Code");
                        if "Receipt Lines1"."Global Dimension 2 Code" <> '' then begin
                            "Receipt Lines1".validate("Global Dimension 2 Code", "Receipt Lines1"."Global Dimension 2 Code");
                            GLEntry."Global Dimension 2 Code" := "Receipt Lines1"."Global Dimension 2 Code";
                        end;
                        if "Receipt Lines1"."Shortcut Dimension 3 Code" <> '' then begin
                            "Receipt Lines1".validate("Shortcut Dimension 3 Code", "Receipt Lines1"."Shortcut Dimension 3 Code");
                            GLEntry."Shortcut Dimension 3 Code" := "Receipt Lines1"."Shortcut Dimension 3 Code";
                        end;
                        if "Receipt Lines1"."Dimension Set ID" <> 0 then
                            GLEntry."Dimension Set ID" := "Receipt Lines1"."Dimension Set ID";

                        GLEntry.Validate("Dimension Set ID", "Receipt Lines1"."Dimension Set ID");
                        GLEntry.Modify();
                        CountUpdated += 1;
                    until GLEntry.Next() = 0;

                    // Message('✅ Updated %1 G/L Entries for Payment %2.', CountUpdated, Payment."No.");
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(UpdateConfirm; UpdateConfirm)
                    {
                        ApplicationArea = All;
                        Caption = 'Confirm Update';
                        ToolTip = 'Tick to confirm you want to update G/L Entries with dimensions from Payments.';
                    }
                }
            }
        }

        actions
        {
            area(Processing)
            {
                action(UpdateAction)
                {
                    ApplicationArea = All;
                    Caption = 'Run Update';
                    trigger OnAction()
                    begin
                        if not UpdateConfirm then
                            Error('Please confirm update before running.');
                    end;
                }
            }
        }
    }

    var
        UpdateConfirm: Boolean;
}
