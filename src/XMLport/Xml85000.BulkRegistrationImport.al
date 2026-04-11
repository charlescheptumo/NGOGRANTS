// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// XmlPort 85000 "BulkRegistrationImport"
// {
//     Direction = Import;
//     // Encoding = UTF8;
//     Format = VariableText;
//     FormatEvaluate = Legacy;
//     TextEncoding = WINDOWS;

//     schema
//     {
//         textelement(Root)
//         {
//             tableelement("Bulk Processing Lines"; "Bulk Processing Lines")
//             {
//                 XmlName = 'StudentData';
//                 fieldelement(IDNo; "Bulk Processing Lines"."ID Number")
//                 {
//                 }
//                 fieldelement(FirstName; "Bulk Processing Lines"."First Name")
//                 {
//                 }
//                 fieldelement(MiddleName; "Bulk Processing Lines"."Middle Name")
//                 {
//                 }
//                 fieldelement(SurName; "Bulk Processing Lines".Surname)
//                 {
//                 }
//                 fieldelement(CourseID; "Bulk Processing Lines"."Course ID")
//                 {
//                 }
//                 fieldelement(TrainingInstitutionCode; "Bulk Processing Lines"."Training Institution Code")
//                 {
//                 }
//                 fieldelement(HighestQualificationCode; "Bulk Processing Lines"."Highest Academic QCode")
//                 {
//                 }
//                 fieldelement(Gender; "Bulk Processing Lines".Gender)
//                 {
//                 }
//                 fieldelement(DOB; "Bulk Processing Lines"."Date of Birth")
//                 {
//                 }
//                 fieldelement(Disabled; "Bulk Processing Lines".Disabled)
//                 {
//                 }
//                 fieldelement(NWCPWDNo; "Bulk Processing Lines"."NCPWD No.")
//                 {
//                 }
//                 fieldelement(Email; "Bulk Processing Lines".Email)
//                 {
//                 }
//                 fieldelement(PhoneNo; "Bulk Processing Lines"."Phone No.")
//                 {
//                 }

//                 trigger OnBeforeInsertRecord()
//                 begin
//                     "Bulk Processing Lines"."Bulk Header No." := HeaderNo;
//                     Customer.Reset;
//                     Customer.SetRange("ID. No.", "Bulk Processing Lines"."ID Number");
//                     if Customer.FindFirst then begin
//                         "Bulk Processing Lines"."Student No." := Customer."No.";
//                         "Bulk Processing Lines".Validate("Student No.");
//                     end;
//                 end;
//             }
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     var
//         HeaderNo: Code[30];
//         CourseID: Code[30];
//         HRDates: Codeunit "HR Dates";
//         Customer: Record Customer;

//     procedure GetVariables(BulkProcessingHeader: Record "Bulk Processing Header") UniversityCodes: Code[30]
//     begin
//         HeaderNo := BulkProcessingHeader."No.";
//     end;
// }

