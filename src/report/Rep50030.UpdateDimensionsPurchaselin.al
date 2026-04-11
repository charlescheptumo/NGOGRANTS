// report 50030 "Update Dimensions Purchase lin"
// {

//     Caption = 'Update GL Dimensions puerchase line';
//     UsageCategory = Tasks;
//     ApplicationArea = All;
//     ProcessingOnly = true;

//     // 🔒 Grant report-level permission to modify G/L Entry and read Payments
//     Permissions =
//         tabledata "G/L Entry" = m,
//         tabledata Payments = r;

//     dataset
//     {
//         dataitem(Payment; "Purch. Inv. Line")
//         {
//             RequestFilterFields = "No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";




//             trigger OnAfterGetRecord()
//             var
//                 GLEntry: Record "G/L Entry";
//                 CountUpdated: Integer;
//                 PaymentsX: Record "Purch. Inv. Line";
//             begin
//                 if not UpdateConfirm then
//                     exit;
//                 PaymentsX.Reset();
//                 PaymentsX.SetRange("Document No.", Payment."Document No.");
//                 if PaymentsX.FindSet() then begin
//                     PaymentsX.Validate("Shortcut Dimension 1 Code", Payment."Shortcut Dimension 1 Code");
//                     PaymentsX.Validate("Shortcut Dimension 2 Code", Payment."Shortcut Dimension 2 Code");
//                     PaymentsX.Validate(dimes, Payment."Shortcut Dimension 3 Code");
//                     PaymentsX.Validate("Shortcut Dimension 4 Code", Payment."Shortcut Dimension 4 Code");

//                     PaymentsX.Modify();
//                 end;
//                 GLEntry.Reset();
//                 GLEntry.SetRange("Document No.", Payment."Document No.");
//                 if GLEntry.FindSet() then begin
//                     repeat
//                         // ✅ Update dimensions only if values exist on the Payment record
//                         if Payment."Shortcut Dimension 1 Code" <> '' then
//                             GLEntry."Global Dimension 1 Code" := Payment."Shortcut Dimension 1 Code";
//                         GLEntry.Validate("Global Dimension 1 Code", Payment."Shortcut Dimension 1 Code");
//                         if Payment."Shortcut Dimension 2 Code" <> '' then
//                             GLEntry."Global Dimension 2 Code" := Payment."Shortcut Dimension 2 Code";
//                         if Payment."Shortcut Dimension 3 Code" <> '' then
//                             GLEntry."Shortcut Dimension 3 Code" := Payment."Shortcut Dimension 3 Code";
//                         if Payment."Shortcut Dimension 4 Code" <> '' then
//                             GLEntry."Shortcut Dimension 4 Code" := Payment."Shortcut Dimension 4 Code";
//                         if Payment."Dimension Set ID" <> 0 then
//                             GLEntry."Dimension Set ID" := Payment."Dimension Set ID";
//                         // Message(format(Payment."Dimension Set ID"));
//                         GLEntry.Validate("Dimension Set ID", Payment."Dimension Set ID");
//                         GLEntry.Modify();
//                         CountUpdated += 1;
//                     until GLEntry.Next() = 0;

//                     // Message('✅ Updated %1 G/L Entries for Payment %2.', CountUpdated, Payment."No.");
//                 end;
//             end;
//         }



//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(Options)
//                 {
//                     field(UpdateConfirm; UpdateConfirm)
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Confirm Update';
//                         ToolTip = 'Tick to confirm you want to update G/L Entries with dimensions from Payments.';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//             area(Processing)
//             {
//                 action(UpdateAction)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Run Update';
//                     trigger OnAction()
//                     begin
//                         if not UpdateConfirm then
//                             Error('Please confirm update before running.');
//                     end;
//                 }
//             }
//         }
//     }

//     var
//         UpdateConfirm: Boolean;
// }
