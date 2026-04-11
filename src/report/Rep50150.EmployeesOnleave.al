// report 50150 "Employees On Leave"
// {
//     Caption = 'Employees On Leave';
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;

//     dataset
//     {
//         dataitem(LeaveApp; "HR Leave Application")
//         {
//             // Only Approved leave where TODAY is between Start Date and Return Date
//             DataItemTableView =
//                 sorting("Employee No")
//                 where(Status = const(Approved),
//                       "Start Date" = filter(..Today),
//                       "Return Date" = filter(Today..));

//             column(EmployeeNo; "Employee No") { }
//             column(EmployeeName; "Employee Name") { }
//             column(LeaveType; "Leave Type") { }
//             column(StartDate; "Start Date") { }
//             column(ReturnDate; "Return Date") { }
//             column(NoOfDays; "Days Applied") { }
//             column(Status; Status) { }
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(Filter)
//                 {
//                     field(DateFilter; DateFilter)
//                     {
//                         Caption = 'Date Filter (Optional)';
//                         ApplicationArea = All;
//                     }
//                 }
//             }
//         }
//     }

//     var
//         DateFilter: Date;
// }
