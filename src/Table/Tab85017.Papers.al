// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Table 85017 "Papers"
// {
//     DrillDownPageID = Subjects;
//     LookupPageID = Subjects;

//     fields
//     {
//         field(1;"Code";Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(2;Course;Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Courses;
//         }
//         field(3;Section;Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Section where (Course=field(Course));
//         }
//         field(4;Level;Code[30])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Level where (Course=field(Course));
//         }
//         field(5;Description;Text[150])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(6;"No. of Passed Students";Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7;"No. of  Failed Students";Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8;Blocked;Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(9;Status;Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionCaption = 'Mandatory,Optional';
//             OptionMembers = Mandatory,Optional;
//         }
//         field(10;Practical;Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85400;"No. of Required Questions";Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }

//     keys
//     {
//         key(Key1;"Code")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }
// }

