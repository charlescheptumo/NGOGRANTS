#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69076 "HR Manager Role Center"
{
    ApplicationArea = Basic;
    Caption = 'Human Resource Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

        }
    }

    actions
    {
        area(reporting)
        {
            separator(Action1000000008)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group(Payslip)
            {
                Caption = 'Payslip';
                action("1 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '1 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "New Payslipx";
                    ToolTip = 'Executes the 1 Page Payslip action.';
                }
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "New 2 page Payslip";
                    ToolTip = 'Executes the 2 Page Payslip action.';
                }
                action("3 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '3 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "New 3 page Payslipx";
                    ToolTip = 'Executes the 3 Page Payslip action.';
                }
                // action("HR Leave Applications List")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Report "HR Leave Applications List";
                //     ToolTip = 'Executes the HR Leave Applications List action.';
                // }
                action(EmailPayslips)
                {
                    Caption = 'Email Payslips';
                    ApplicationArea = Basic;
                    ToolTip = 'Sends payslips to all employees for the given pay period';
                    RunObject = report "Email All Payslips";
                }
            }
            separator(Action1000000041)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group("Management Reports")
            {
                Caption = 'Management Reports';
                action("Master Roll Excel Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = "Report";
                    //RunObject = Report "Master Roll Excel Export";
                    ToolTip = 'Executes the Master Roll Excel Export action.';
                }
            }
            group(Statutory)
            {
                Caption = 'Statutory';
                action(P9A)
                {
                    ApplicationArea = Basic;
                    Caption = 'P9A';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "P9A Report";
                    ToolTip = 'Executes the P9A action.';
                }
            }
            group("Payroll Reports")
            {
                Caption = 'Payroll Reports';
                action(Action43)
                {
                    ApplicationArea = Basic;
                    Caption = '1 Page Payslip';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "1 Page Payslip";
                    ToolTip = 'Executes the 1 Page Payslip action.';
                }
                action(Action42)
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    //RunObject = Report "New Payslip";
                    ToolTip = 'Executes the 2 Page Payslip action.';
                }
                action(Action41)
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = "Report";
                    // RunObject = Report "Master Roll Excel Export";
                    ToolTip = 'Executes the Master Roll Excel Export action.';
                }
                action("Detailed E/D Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed E/D Report';
                    Image = "Report";
                    RunObject = Report "Master reporterx";
                    ToolTip = 'Executes the Detailed E/D Report action.';
                }
                action("Loans Detailed Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans Detailed Report';
                    Image = "Report";
                    Promoted = false;
                    Visible = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Loans Detailed Report1";
                    ToolTip = 'Executes the Loans Detailed Report action.';
                }
                action("Loan Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Balances';
                    Image = "Report";
                    Promoted = false;
                    Visible = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Loan Balances";
                    ToolTip = 'Executes the Loan Balances action.';
                }
                action("Employee Payroll Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Payroll Analysis';
                    Image = "Report";
                    RunObject = Report "Payroll Cost Analysis";
                    ToolTip = 'Executes the Employee Payroll Analysis action.';
                }
                action("Employee Pay Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Pay Details';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Employee Pay Details";
                    ToolTip = 'Executes the Employee Pay Details action.';
                }
                action(NHIF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NHIF';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report NHIF;
                    ToolTip = 'Executes the NHIF action.';
                }
                action(NSSF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "NSSF Reporting";
                    ToolTip = 'Executes the NSSF action.';
                }
                action("Monthly PAYE Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Monthly PAYE Export';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Monthly PAYE Export";
                    ToolTip = 'Executes the Monthly PAYE Export action.';
                }
                action("NITA")
                {
                    ApplicationArea = Basic;
                    Caption = 'NITA';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "NITA Report";
                    ToolTip = 'Executes the Monthly PAYE Export action.';
                }
                action(Pension)
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Pension Report";
                    ToolTip = 'Executes the Monthly PAYE Export action.';
                }
                action(Action32)
                {
                    ApplicationArea = Basic;
                    Caption = 'P9A';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "P9A Report";
                    ToolTip = 'Executes the P9A action.';
                }
                action("Housing Levy")
                {
                    ApplicationArea = Basic;
                    Caption = 'Housing Levy';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Housing Levy";
                }
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Earnings Report";
                    ToolTip = 'Executes the Zero Earnings Report action.';
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Deductions Report";
                    ToolTip = 'Executes the Zero Deductions Report action.';
                }
                action("New Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employees';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New Employees";
                    ToolTip = 'Executes the New Employees action.';
                }
                action("Employees Removed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Removed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employees Removed";
                    ToolTip = 'Executes the Employees Removed action.';
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    RunObject = Report "Employee Master Roll";
                    ToolTip = 'Executes the Master Roll action.';
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Summary";
                    ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                }
                action("Payroll Reconciliation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Details';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Earnin";
                    ToolTip = 'Executes the Payroll Reconciliation Details action.';
                }
            }

        }
        area(embedding)
        {
            action("HRLeaveEntries")
            {
                ApplicationArea = Basic;
                Image = Employee;
                Visible = false;
                RunObject = Page "Hr Leave Ledger Entries";
            }
            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-HR";
                Visible = false;
                ToolTip = 'Executes the Employee List action.';
            }
            action("Test")
            {
                ApplicationArea = Basic;
                Caption = 'Test';
                Image = Employee;
                RunObject = Codeunit HRPortal;
                Visible = false;
                ToolTip = 'Executes the Employee List action.';
            }
            action("Employee List2")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List2';
                Image = Employee;
                RunObject = Page EmployeeListHR2;
                Visible = false;
                ToolTip = 'Executes the Employee List action.';
            }
            action("EmployeeStandard")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List";
                // Visible = false;
                ToolTip = 'Executes the Employee List action.';
            }

            group(Leave)
            {
                Caption = 'Leave';
                action("Leave Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balances';
                    Image = Employee;
                    RunObject = Page "Leave Balances";
                    ToolTip = 'Executes the Leave Balances action.';
                }
                action("Posted Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Leave Days';
                    Image = Employee;
                    RunObject = Page "Posted Leave Days";
                    ToolTip = 'Executes the Posted Leave Days action.';
                }
                action("Leave Recall")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Recall';
                    Image = Employee;
                    RunObject = Page "Leave Application Recall";
                    ToolTip = 'Executes the Leave Recall action.';
                }

            }
            action("Approval Tester")
            {
                ApplicationArea = Basic;
                Caption = 'Approval Test';
                Image = Employee;
                Visible = false;
                RunObject = Page "Approval Test List";
                ToolTip = 'This is for testing the approvals';
            }
        }
        area(sections)
        {
            group("Employee Self Service")
            {
                Caption = 'Employee Self Service';
                Image = HumanResources;
                action("Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Leave Applications List";
                    RunPageView = sorting("Application Code")
                                  order(descending);
                    ToolTip = 'Executes the Leave Applications action.';
                }
                action("Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Approved Leave Applications";
                    ToolTip = 'Executes the Approved Leave Applications action.';
                }
                action("Posted Leave Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Leave Applications';
                    Image = ServiceAgreement;
                    RunObject = Page "Posted Leave Applications..";
                    ToolTip = 'Executes the Approved Leave Applications action.';
                }
            }
            group(Establishment)
            {
                Caption = 'Establishment';
                Image = Confirm;
                action("Members of the Board")
                {
                    ApplicationArea = Basic;
                    Caption = 'Council Members';
                    Image = Balance;
                    RunObject = Page "Board List";
                    ToolTip = 'Council Members';
                }

                action("Legal Entities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Legal Entities';
                    Image = Balance;
                    RunObject = Page "Legal Entity List";
                    ToolTip = 'Executes the Legal Entities.';
                }
                action("Directorate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    Image = Balance;
                    RunObject = Page "Directorate List";
                    ToolTip = 'Executes the Department List.';
                }

                action("Departments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Department';
                    RunObject = Page "Department List";

                }
                action("Positions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Positions';
                    Image = Balance;
                    RunObject = Page "Positions";
                    ToolTip = 'Executes the Positions.';
                }
                action("Duty Stations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Duty Stations';
                    Image = Balance;
                    RunObject = Page "Duty Station";
                    ToolTip = 'Executes the Duty Stations.';
                }
                action("Organization Hierarchy")
                {
                    ApplicationArea = Basic;
                    Caption = 'Organization Hierarchy';
                    Image = Balance;
                    RunObject = Page "Organization Hierarchy";
                    ToolTip = 'Executes the Organization Hierarchy.';
                }

                action("Approved Staff Establishment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Establishment';
                    Image = Balance;
                    RunObject = Page "Staff Establishment Plans";
                    ToolTip = 'Executes the Approved Staff Establishment.';
                }

                action("Designation Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation Groups';
                    Image = Balance;
                    RunObject = Page "Designation Groups";
                    ToolTip = 'Executes the Designation Groups.';
                }
                action("Employee Work Shift")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Work Shift';
                    Image = Balance;
                    RunObject = Page "Employee Work Shift";
                    ToolTip = 'Executes the Employee Work Shift.';
                }




            }
            group(Training)
            {
                Caption = 'Training';
                Image = Confirm;
                action("Training Needs requests")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs requests';
                    Image = Balance;
                    RunObject = Page "Training Need Requests";
                    ToolTip = 'Executes the Training Needs requests action.';
                }
                action("Training Needs")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs';
                    Image = Balance;
                    RunObject = Page "Training Needs Lines";
                    ToolTip = 'Executes the Training Needs action.';
                }
                action("Training plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training plan';
                    Image = Balance;
                    RunObject = Page "Training Plans";
                    ToolTip = 'Executes the Training plan action.';
                }
                action(Courses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Courses';
                    Image = Balance;
                    RunObject = Page "Training Courses Setup";
                    ToolTip = 'Executes the Courses action.';
                }
                action("Approved Training plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Training plan';
                    Image = Balance;
                    RunObject = Page "Approved Training Plans";
                    ToolTip = 'Executes the Approved Training plan action.';
                }
                action("Training applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training applications';
                    Image = Balance;
                    RunObject = Page "Training Applications";
                    ToolTip = 'Executes the Training applications action.';
                }
            }
            group(Recruitment)
            {
                Caption = 'Recruitment';
                Image = HumanResources;

                action("Functional Recruitment Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Functional Recruitment Plan';
                    Image = Balance;
                    RunObject = Page "Functional Recruitment Plans";
                    ToolTip = 'Executes the Functional Recruitment Plan action.';
                }

                action("Annual recruitment plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual recruitment plan';
                    Image = Balance;
                    RunObject = Page "Recruitment Plans";
                    ToolTip = 'Executes the Annual recruitment plan action.';
                }
                action("Recruitment Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Recruitment Requisition';
                    Image = Balance;
                    RunObject = Page "Recruitment Requisitions";
                    ToolTip = 'Executes the Recruitment Requisition action.';
                }
                action("Approved Recruitment Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Recruitment Requisitions';
                    Image = Balance;
                    RunObject = Page ApproveRecruitmentRequisitions;
                    ToolTip = 'Executes the Approved Recruitment Requisitions action.';
                }

                action("Vacancies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacancies';
                    Image = Balance;
                    RunObject = Page Vacancies;
                    ToolTip = 'View Open Vacancies';
                }
                action("Published Vacancies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Published Vacancies';
                    RunObject = Page "Published Vacancies";

                }
                action("Closed Vacancies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Vacancies';
                    RunObject = Page "Closed Vacancies";

                }
                action(Candidates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Candidates';
                    Image = Balance;
                    RunObject = Page Candidates;
                    ToolTip = 'Executes the Candidates action.';
                }
                action("Shortlisting Voucher")
                {
                    ApplicationArea = Basic;
                    Caption = 'Shortlisting Voucher';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "Candidate Shortlist Vouchers";
                    ToolTip = 'Executes the Shortlisting Voucher action.';
                }
                action("Panelists")
                {
                    ApplicationArea = Basic;
                    Caption = 'Candidate Selection Panels';
                    Image = Balance;
                    RunObject = Page "Candidate Selection Panels";

                }
                action("Interview Invitations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interview Invitations';
                    Image = Balance;
                    RunObject = Page "Interview Invitations";
                    ToolTip = 'Executes the Interview Invitations action.';
                }
                action("Job Applications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Applications';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "Job Applications";
                    ToolTip = 'Executes the Job Applications action.';
                }
                action("Long List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Longlisted Candidates';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "Longlisted Candidates";
                    ToolTip = 'Executes the Job Applications action.';
                }
                action("ShortList")
                {
                    ApplicationArea = Basic;
                    Caption = 'ShortListed Candidates';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "ShortListed Candidates";
                    ToolTip = 'Executes the Job Applications action.';
                }
                action(WrittenAssessment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Written Assessment';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "Written Assessment";
                    ToolTip = 'Executes the Job Applications action.';
                }
                action(FirstInterview)
                {
                    ApplicationArea = Basic;
                    Caption = 'First Interview';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "First Interview";
                    ToolTip = 'Executes the Job Applications action.';
                }
                action(SecondInterview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Interview';
                    Image = Balance;
                    Visible = false;
                    RunObject = Page "Second Interview";
                    ToolTip = 'Executes the Job Applications action.';
                }

                action("Employment Offers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Offers';
                    Image = Balance;
                    RunObject = Page "Employment Offers";
                    ToolTip = 'Executes the Employment Offers action.';
                }
                group(Setups)
                {
                    action("Recruitment Reasons")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Recruitment Reasons';
                        Image = HumanResources;
                        RunObject = Page "Recruitment Reasons";

                    }
                }
            }
            group("Management Approvals")
            {
                Caption = 'Management Approvals';
                Image = Confirm;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = ServiceAgreement;
                    RunObject = Page "Approval Entries";
                    ToolTip = 'Executes the Approval Entries action.';
                }
            }
            group("HR Administration")
            {
                Caption = 'HR Administration';
                Image = Administration;

                action("Human Resources Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Resources Setup';
                    Image = AccountingPeriods;
                    RunObject = Page "HR Setup List";
                    ToolTip = 'Executes the Human Resources Setup action.';
                }
                action("Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Posting Group';
                    Image = AccountingPeriods;
                    RunObject = Page "Employee Posting Group";
                    ToolTip = 'Executes the Employee Posting Group action.';
                }
                action("Leave Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Types';
                    Image = AccountingPeriods;
                    RunObject = Page "Leave Types";
                    ToolTip = 'Executes the Leave Types action.';
                }
                action("Human Res. Units of Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Res. Units of Measure';
                    Image = AccountingPeriods;
                    RunObject = Page "Human Res. Units of Measure";
                    ToolTip = 'Executes the Human Res. Units of Measure action.';
                }
                action("Registration Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Codes';
                    RunObject = Page "Causes of Absence";
                    ToolTip = 'Executes the Registration Codes action.';
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Causes of Inactivity';
                    Image = Currency;
                    RunObject = Page "Causes of Inactivity";
                    ToolTip = 'Executes the Causes of Inactivity action.';
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounds for Termination';
                    Image = AccountingPeriods;
                    RunObject = Page "Grounds for Termination";
                    ToolTip = 'Executes the Grounds for Termination action.';
                }
                action(Unions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Unions';
                    RunObject = Page Unions;
                    ToolTip = 'Executes the Unions action.';
                }
                action("Employment Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Contracts';
                    Image = Currency;
                    RunObject = Page "Employment Contracts";
                    ToolTip = 'Executes the Employment Contracts action.';
                }
                action(Relatives)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relatives';
                    Image = Employee;
                    RunObject = Page Relatives;
                    ToolTip = 'Executes the Relatives action.';
                }
                action("Misc. Articles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles';
                    RunObject = Page "Misc. Articles";
                    ToolTip = 'Executes the Misc. Articles action.';
                }
                action(Confidential)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confidential';
                    RunObject = Page Confidential;
                    ToolTip = 'Executes the Confidential action.';
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = Currency;
                    RunObject = Page Qualifications;
                    ToolTip = 'Executes the Qualifications action.';
                }
                action("Pay Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pay Periods';
                    Image = Currency;
                    RunObject = Page "Pay Periods";
                    ToolTip = 'Executes the Pay Periods action.';
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Statistics Groups';
                    Image = Employee;
                    RunObject = Page "Employee Statistics Groups";
                    ToolTip = 'Executes the Employee Statistics Groups action.';
                }
                action("Human Resource Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Resource Setup';
                    Image = Employee;
                    RunObject = Page "HR Setup List";
                    ToolTip = 'Executes the Human Resource Setup action.';
                }
                action("Base Calendar")
                {
                    ApplicationArea = Basic;
                    Caption = 'Base Calendar';
                    Image = Employee;
                    RunObject = Page "Base Calendar List";
                    ToolTip = 'Executes the Base Calendar action.';
                }
                action("Terms of Service")
                {
                    ApplicationArea = Basic;
                    Caption = 'Terms of Service';

                    RunObject = Page "Terms of Service";

                }
                action("HR Leave Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Types';
                    Image = Employee;
                    RunObject = Page "HR Leave Types";
                    ToolTip = 'Executes the HR Leave Types action.';
                }
                action("HR Leave Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Periods';
                    Image = Employee;
                    RunObject = Page "HR Leave Periods";
                    ToolTip = 'Executes the HR Leave Periods action.';
                }
            }
            group("Welfare Management")
            {
                Caption = 'Welfare Management';
                Image = HumanResources;
                action("Request Welfare Membership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare Membership';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Membership";
                    ToolTip = 'Executes the Request Welfare Membership action.';
                }
                action("Welfare Members List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Members List';
                    Image = Employee;
                    RunObject = Page "Welfare Members List";
                    ToolTip = 'Executes the Welfare Members List action.';
                }
                action("Request Welfare benefit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare benefit';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Benefit";
                    ToolTip = 'Executes the Request Welfare benefit action.';
                }
                action("Welfare Contributions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Contributions';
                    Image = Employee;
                    RunObject = Page "Welfare Contributions";
                    ToolTip = 'Executes the Welfare Contributions action.';
                }
            }
            // group(Administration)
            // {
            //     Caption = 'Administration';
            //     Image = HumanResources;
            //     action("Fleet Vehicles")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Fleet Vehicles';
            //         Image = Employee;
            //         RunObject = Page "Fleet Vehicles List";
            //         ToolTip = 'Executes the Fleet Vehicles action.';
            //     }
            //     action("Fleet Drivers")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Fleet Drivers';
            //         Image = Employee;
            //         RunObject = Page "Fleet Drivers List";
            //         ToolTip = 'Executes the Fleet Drivers action.';
            //     }
            //     action("Approved Fleet Requests")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Approved Fleet Requests';
            //         Image = Employee;
            //         RunObject = Page "Approved Fleet Requests List";
            //         ToolTip = 'Executes the Approved Fleet Requests action.';
            //     }
            //     action("Approved Work Tickets")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Approved Work Tickets';
            //         Image = Employee;
            //         RunObject = Page "Approved Daily Work Ticket Lis";
            //         ToolTip = 'Executes the Approved Work Tickets action.';
            //     }
            //     action("Registry List")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Registry List';
            //         Image = Employee;
            //         RunObject = Page "Registry List";
            //         ToolTip = 'Executes the Registry List action.';
            //     }
            //     action("File Types")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'File Types';
            //         Image = Employee;
            //         RunObject = Page "File Types";
            //         ToolTip = 'Executes the File Types action.';
            //     }
            //     action("File Movement List")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'File Movement List';
            //         Image = Employee;
            //         RunObject = Page "File Movement List";
            //         ToolTip = 'Executes the File Movement List action.';
            //     }
            //     action("Issued File Requisition")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Issued File Requisition';
            //         Image = Employee;
            //         RunObject = Page "Issued File Requisition";
            //         ToolTip = 'Executes the Issued File Requisition action.';
            //     }
            //     action("Approved File Requisition")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Approved File Requisition';
            //         Image = Employee;
            //         RunObject = Page "Approved File Requisition";
            //         ToolTip = 'Executes the Approved File Requisition action.';
            //     }
            // }
            // group(OSH)
            // {
            //     Caption = 'OSH';
            //     Image = HumanResources;
            //     action("Hazard Types")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Hazard Types';
            //         Image = Employee;
            //         RunObject = Page "Hazard Types";
            //         ToolTip = 'Executes the Hazard Types action.';
            //     }
            //     action("Hazard Identification Methods")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Hazard Identification Methods';
            //         Image = Employee;
            //         RunObject = Page "Hazard Identification Methods";
            //         ToolTip = 'Executes the Hazard Identification Methods action.';
            //     }
            //     action("Evacuation Event")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Evacuation Event';
            //         Image = Employee;
            //         RunObject = Page "Evacuation Events";
            //         ToolTip = 'Executes the Evacuation Event action.';
            //     }
            //     action("OSH Mgt Roles")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'OSH Mgt Roles';
            //         Image = Employee;
            //         RunObject = Page "HSE Roles";
            //         ToolTip = 'Executes the OSH Mgt Roles action.';
            //     }
            //     action("OSH mgt Plan")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'OSH mgt Plan';
            //         Image = Employee;
            //         RunObject = Page "HSE Plans";
            //         ToolTip = 'Executes the OSH mgt Plan action.';
            //     }
            //     action("Safety Equipments Register")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Safety Equipments Register';
            //         Image = Employee;
            //         RunObject = Page "Safety Equipment Registers";
            //         ToolTip = 'Executes the Safety Equipments Register action.';
            //     }
            //     action("OSH Training register")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'OSH Training register';
            //         Image = Employee;
            //         RunObject = Page "HSE Training Register";
            //         ToolTip = 'Executes the OSH Training register action.';
            //     }
            //     action(" Meeting Register")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = ' Meeting Register';
            //         Image = Employee;
            //         RunObject = Page "HSE Meeting Register";
            //         ToolTip = 'Executes the  Meeting Register action.';
            //     }
            //     action("Safety Equipment Registers")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Safety Equipment Registers';
            //         Image = Employee;
            //         RunObject = Page "Safety Equipment Registers";
            //         ToolTip = 'Executes the Safety Equipment Registers action.';
            //     }
            //     action("Safe Work Permits")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Safe Work Permits';
            //         Image = Employee;
            //         RunObject = Page "Safe Work Permits";
            //         ToolTip = 'Executes the Safe Work Permits action.';
            //     }
            //     action("Safe Work Permits CO")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Safe Work Permits CO';
            //         Image = Employee;
            //         RunObject = Page "Safe Work Permits COM";
            //         ToolTip = 'Executes the Safe Work Permits CO action.';
            //     }
            //     action("Emergency Drill Logs")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Emergency Drill Logs';
            //         Image = Employee;
            //         RunObject = Page "Emergency Drill Logs";
            //         ToolTip = 'Executes the Emergency Drill Logs action.';
            //     }
            // }
            group("Payroll Processing")
            {
                Caption = 'Payroll Processing';
                action(Action24)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee List';
                    Image = Employee;
                    RunObject = Page "Employee List-P";
                    ToolTip = 'Executes the Employee List action.';
                }
                action(Action23)
                {
                    ApplicationArea = Basic;
                    Caption = 'Pay Periods';
                    Image = Employee;
                    RunObject = Page "Pay Periods";
                    ToolTip = 'Executes the Pay Periods action.';
                }
                action(Earnings)
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings';
                    Image = Employee;
                    RunObject = Page Earnings;
                    ToolTip = 'Executes the Earnings action.';
                }
                action(Deductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions';
                    Image = Employee;
                    RunObject = Page Deductions;
                    ToolTip = 'Executes the Deductions action.';
                }
                action("Salary Processing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Processing';
                    Image = Loaners;
                    RunObject = Page "Payroll Processing List";
                    ToolTip = 'Executes the Salary Processing action.';
                }
                action("Salary Processing1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Salary Vouchers';
                    Image = Loaners;
                    RunObject = Page "Approved Salary Vouchers";
                    ToolTip = 'Executes the Salary Processing action.';
                }

                action("Brackets Table")
                {
                    ApplicationArea = Basic;
                    Caption = 'Brackets Table';
                    Image = Employee;
                    RunObject = Page "Brackets Table";
                    ToolTip = 'Executes the Brackets Table action.';
                }
                action(Loans)
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans';
                    Image = Loaners;
                    RunObject = Page Loans;
                    ToolTip = 'Executes the Loans action.';
                }

                action(Action15)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Posting Group';
                    Image = Employee;
                    RunObject = Page "Employee Posting Groups";
                    ToolTip = 'Executes the Employee Posting Group action.';
                }
                action("Employee PGroups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee PGroups';
                    RunObject = Page "Employee PGroups";
                    ToolTip = 'Executes the Employee PGroups action.';
                }

                action("Employee Bank List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Bank List';
                    Image = Employee;
                    RunObject = Page "Employee Bank List";
                    ToolTip = 'Executes the Employee Bank List action.';
                }
                action("Loans Products")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans Products';
                    Image = Loaners;
                    RunObject = Page "Loan Products";
                    ToolTip = 'Executes the Loans Products action.';
                }
                // action("Timesheets")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Timesheets';
                //     Image = Currency;
                //     RunObject = Page "Timesheets";
                //     ToolTip = 'Executes the Timesheets action.';
                // }
            }
            group(Performance)
            {
                Caption = 'Performance Management';
                action(Appraisal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Page "Standard Perfomance Appraisal";

                }
                action(SelfSupAppraisal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Page "Self-Supervisor Appraisals";
                    Visible = false;
                }
                action(SelfSupAppraisal1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Page "Self-Supervisor Appraisals-E";
                    Visible = false;
                }
                // action(WorkPlan)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employee Workplans';
                //     RunObject = Page "Departments\Centers PCs";
                // }
                action(Setup)
                {
                    ApplicationArea = Basic;
                    Caption = 'SPM Setup';
                    RunObject = Page "Strategy General Setup";

                }
            }
            group(ExitMgt)
            {
                Caption = 'Exit Management';
                action(ExitMethods)
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Reasons';
                    RunObject = Page "Reasons for Exit";

                }
                action(ExitVoucher)
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Voucher';
                    RunObject = Page "Employee Exit Vouchers";

                }

            }
            group("Timesheet")
            {
                action("Resources")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resources';
                    RunObject = Page "Resource List";
                }
                action("Create Time Sheets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Time Sheets';
                    Visible = false;
                    RunObject = Report "Create Time Sheets 2";
                }
                action("Time Sheets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time Sheets';
                    RunObject = Page "Time Sheet List";
                }
                action("Manager Time Sheets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manager Time Sheets';
                    RunObject = Page "Manager Time Sheet List";
                }
                action("Manager Archived Time Sheets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manager Time Sheets';
                    RunObject = Page "Manager Time Sheet Arc. List";
                }
                action("Timesheet Card")
                {
                    ApplicationArea = Basic;
                    Caption = 'Timesheet Card';
                    RunObject = Page "Time Sheet Card";
                    Visible = false;
                }
                action("Time Sheet Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time Sheet Allocation';
                    RunObject = Page "Time Sheet Allocation";
                    Visible = false;
                }
            }
            group("Self Service")
            {
                group("My Request")
                {
                    Caption = 'My Request';
                    action("Imprest Memos")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Memos';
                        RunObject = Page "Imprest Memos";
                        Visible = false;
                        ToolTip = 'Executes the Imprest Memos action.';
                    }
                    action("<Page Project Imprest Requisition>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'My Advance Requests';
                        Image = Quote;
                        RunObject = Page "Imprest Requisitions";
                        ToolTip = 'Executes the My Imprest Requisitions action.';
                    }
                    action("My Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'My Store Requisitions';
                        Visible = false;
                        Image = Document;
                        RunObject = Page "Store Requisitions";
                        ToolTip = 'Executes the My Store Requisitions action.';
                    }
                    action("My Imprest Surrenders")
                    {
                        ApplicationArea = Basic;
                        Caption = 'My Advance Surrenders';
                        Image = Document;
                        RunObject = Page "Imprest Surrenders";
                        ToolTip = 'Executes the My Imprest Surrenders action.';
                    }
                    action("My Leave Applications")
                    {
                        ApplicationArea = Basic;
                        Caption = 'My Leave Applications';
                        Image = ServiceCode;
                        RunObject = Page "Leave Applications List";
                        ToolTip = 'Executes the My Leave Applications action.';
                    }
                    // action("ICT Helpdesk Request")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'ICT Helpdesk Request';
                    //     Enabled = false;
                    //     Image = SendTo;
                    //     RunObject = Page "ICT Helpdesk Request List";
                    //     Visible = false;
                    //     ToolTip = 'Executes the ICT Helpdesk Request action.';
                    // }
                    action("My Purchase Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'My Purchase Requisitions';
                        Image = Loaners;
                        RunObject = Page "Purchase Requisitions";
                        Visible = false;
                        ToolTip = 'Executes the My Purchase Requisitions action.';
                    }
                    // action("Fleet Requisition List")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Page "Fleet Requisition List";
                    //     ToolTip = 'Executes the Fleet Requisition List action.';
                    // }
                    action(Items)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Items';
                        Image = Item;
                        Visible = false;
                        RunObject = Page "Item List";
                        ToolTip = 'Executes the Items action.';
                    }
                }
            }
        }
        area(processing)
        {
            group("Salary Advance")
            {
                action("Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Salary Advance List";
                    ToolTip = 'Executes the Salary Advance List action.';
                }
                action("Approved Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Salary Advance List";
                    ToolTip = 'Executes the Approved Salary Advance List action.';
                }
                action("Posted  Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted  Salary Advance List";
                    ToolTip = 'Executes the Posted  Salary Advance List action.';
                }
            }
            group("Company Information")
            {
                Caption = 'Company Information';
                action(Action1000000020)
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Information';
                    Image = "company information";
                    Promoted = false;
                    RunObject = Page "Company Information";
                    ToolTip = 'Executes the Company Information action.';
                }
                // action(Comittees)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Comittees';
                //     Image = Customer;
                //     Promoted = false;
                //     RunObject = Page Committees;
                //     ToolTip = 'Executes the Comittees action.';
                // }
                action("Committee Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committee Members';
                    Image = Relatives;
                    Promoted = false;
                    RunObject = Page "Requests Welfare Membership";
                    ToolTip = 'Executes the Committee Members action.';
                }
                action("Rules and Regulations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rules and Regulations';
                    Image = Permission;
                    Promoted = false;
                    RunObject = Page "Benefits Attachments";
                    ToolTip = 'Executes the Rules and Regulations action.';
                }
                action("Company Activities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Activities';
                    Image = "Action";
                    Promoted = false;
                    RunObject = Page "Request Welfare  Membership";
                    ToolTip = 'Executes the Company Activities action.';
                }
                action("Company Calendar")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company Calendar';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    RunObject = Page "Base Calendar Card";
                    ToolTip = 'Executes the Company Calendar action.';
                }
            }
            group("Man Power Planning")
            {

                action(Action1000000028)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Establishment';
                    Image = Hierarchy;
                    Promoted = false;
                    RunObject = Page "Closed Welfare Memberships";
                    ToolTip = 'Executes the Staff Establishment action.';
                }
                action("Man power list")
                {
                    ApplicationArea = Basic;
                    Caption = 'Man power list';
                    Image = Skills;
                    Promoted = false;
                    RunObject = Page "Matanga Contribution Header";
                    ToolTip = 'Executes the Man power list action.';
                }
                action("Manpower task lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manpower task lines';
                    Image = ResourceSkills;
                    Promoted = false;
                    RunObject = Page "Welfare Contributions";
                    ToolTip = 'Executes the Manpower task lines action.';
                }
                action("Manpower plan statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manpower plan statistics';
                    Image = Allocations;
                    Promoted = false;
                    RunObject = Page "Beneficiary Categories";
                    ToolTip = 'Executes the Manpower plan statistics action.';
                }
            }
            group("Leave Management")
            {
                Caption = 'Leave Management';
                Image = Calculator;
                action(Action1000000061)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balances';
                    Image = Balance;
                    RunObject = Page "Leave Balances";
                    ToolTip = 'Executes the Leave Balances action.';
                }
                action("Accrue Annual Leave")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accrue Annual Leave';
                    Image = Calculate;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Accrue Leave";
                    ToolTip = 'Executes the Accrue Annual Leave action.';
                }
                action("Leave Posting Journal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Posting Journal';
                    Image = GLJournal;
                    RunObject = Page "Leave Posting Journal";
                    Visible = false;
                    ToolTip = 'Executes the Leave Posting Journal action.';
                }
                action("Leave Application Recall")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application Recall';
                    Image = GLJournal;
                    RunObject = Page "Leave Application Recall";
                    ToolTip = 'Executes the Leave Application Recall action.';
                }
                action("HR Leave Adjustment")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "HR Leave Adjustment";
                    ToolTip = 'Executes the HR Leave Adjustment action.';
                }
            }
            group("Disciplinary Management")
            {
                Caption = 'Disciplinary Management';
                Image = Calculator;
            }
            group(Absence)
            {
                Caption = 'Absence';
                action("Absence Registration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absence Registration';
                    Image = Absence;
                    RunObject = Page "Absence Registration";
                    ToolTip = 'Executes the Absence Registration action.';
                }
            }
            group(ActionGroup1000000009)
            {
                Caption = 'Training';
                action(Action1000000012)
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Needs';
                    Image = Forecast;
                    RunObject = Page "Employee Training Feedback";
                    ToolTip = 'Executes the Training Needs action.';
                }
            }
            group(ActionGroup44)
            {
                Caption = 'Payroll Processing';
                action("Earnings Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings Import';
                    Image = Import;
                    RunObject = XMLport "Earnings Import";
                    ToolTip = 'Executes the Earnings Import action.';
                }
                action("Deductions Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions Import';
                    Image = Import;
                    RunObject = XMLport "Ded Import";
                    ToolTip = 'Executes the Deductions Import action.';
                }
                action("Current Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Current Earnings/Deductions";
                    ToolTip = 'Executes the Current Earnings/Deductions action.';
                }
                action("Run Payroll Run")
                {
                    ApplicationArea = Basic;
                    Caption = 'Run Payroll Run';
                    Image = Calculate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Payroll Run";
                    ToolTip = 'Executes the Run Payroll Run action.';
                }
                action("Process Loan Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Loan Interest';
                    Image = Suggest;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Process Loan Interest";
                    ToolTip = 'Executes the Process Loan Interest action.';
                }
                action("Assign Default Earnings/Ded")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report "Assign Default Earning/Deducti";
                    ToolTip = 'Executes the Assign Default Earnings/Ded action.';
                }
                action("Closed Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Earnings/Deductions';
                    Image = CashReceiptJournal;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Closed Earnings/Deductions";
                    ToolTip = 'Executes the Closed Earnings/Deductions action.';
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'EFT';
                    Image = Export;
                    //RunObject = Report "EFT/SFI-Admin";
                    ToolTip = 'Executes the EFT action.';
                }
                action("Send PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send PDF Payslips';
                    Image = Export;
                    // = Report "Send PDF Payslips";
                    ToolTip = 'Executes the Send PDF Payslips action.';
                }
            }
        }
    }
}

