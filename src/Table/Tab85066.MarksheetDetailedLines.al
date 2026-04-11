// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Table 85066 "Marksheet Detailed Lines"
// {

//     fields
//     {
//         field(1;"Document No.";Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(2;"Line No.";Integer)
//         {
//             AutoIncrement = true;
//             DataClassification = ToBeClassified;
//         }
//         field(3;"Student Reg No.";Code[30])
//         {
//             DataClassification = ToBeClassified;

//             trigger OnValidate()
//             var
//                 Customer: Record "Examination Account";
//             begin
//                 BookingEntries.Reset;
//                 BookingEntries.SetRange("Student Reg No.","Student Reg No.");
//                 BookingEntries.SetRange(Status,BookingEntries.Status::Ongoing);
//                 if BookingEntries.FindFirst then begin
//                  Examination:=BookingEntries.Examination;
//                   Part:=BookingEntries.Part;
//                   Section:=BookingEntries.Section;
//                   Paper:=BookingEntries.Paper;
//                 end;
//                 Customer.Reset;
//                 Customer.SetRange("Registration No.","Student Reg No.");
//                 if Customer.FindFirst then begin
//                   "Student Name":=Customer."First Name"+' '+Customer."Middle Name"+' '+Customer.Surname;
//                 end;
//             end;
//         }
//         field(4;"Student Name";Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(5;Examination;Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Courses;
//         }
//         field(6;"Part";Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Level.Code where (Course=field(Examination));
//         }
//         field(7;Section;Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Section.Code where (Course=field(Examination),
//                                                 Part=field(Part));
//         }
//         field(8;Paper;Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Papers.Code;

//             trigger OnValidate()
//             begin
//                 Papers.Reset;
//                 Papers.SetRange(Code,Paper);
//                 if Papers.FindFirst then begin
//                   Section:=Papers.Section;
//                   Part:=Papers.Level;
//                   Examination:=Papers.Course;
//                   "Paper Name":=Papers.Description;
//                   end
//             end;
//         }
//         field(9;Mark;Decimal)
//         {
//             DataClassification = ToBeClassified;

//             trigger OnValidate()
//             begin
//                 PapersGradingSystem.Reset;
//                 PapersGradingSystem.SetRange(Blocked,false);
//                 PapersGradingSystem.SetRange(Examination,Examination);
//                 PapersGradingSystem.SetRange(Part,Part);
//                 PapersGradingSystem.SetRange(Section,Section);
//                 PapersGradingSystem.SetRange(Paper,Paper);
//                 if PapersGradingSystem.FindSet then begin
//                   repeat
//                     if ((Mark>PapersGradingSystem."From Marks") or (Mark=PapersGradingSystem."From Marks")) and
//                          ((Mark<PapersGradingSystem."To Marks") or (Mark=PapersGradingSystem."To Marks")) then
//                           begin
//                           GradeCode:=PapersGradingSystem."Grade Code";
//                           Passed:= not(PapersGradingSystem.Failed);
//                          end;

//                   until PapersGradingSystem.Next=0;
//                 end;
//                 Grade:=GradeCode;
//             end;
//         }
//         field(10;Grade;Code[30])
//         {
//             Caption = 'Results';
//             DataClassification = ToBeClassified;
//         }
//         field(11;Passed;Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(12;"Examination Center";Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Examination Centres";
//         }
//         field(13;"Paper Name";Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(14;"Examination Sitting ID";Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(21;"Envelope Serial No.";Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(22;Submitted;Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(23;"Marker No";Code[30])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(24;"Marker Name";Text[200])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//     }

//     keys
//     {
//         key(Key1;"Document No.","Line No.","Student Reg No.","Examination Sitting ID")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     var
//         BookingEntries: Record "Exam Booking Entries";
//         PapersGradingSystem: Record "Papers Grading System";
//         GradeCode: Code[30];
//         Papers: Record Papers;
// }

