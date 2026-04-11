#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50092 "Employee Card Ext" extends "Employee Card"
{
    layout
    {
        modify("No.")
        {
            Caption = 'Personal No.';
        }

        //Unsupported feature: Property Modification (SourceExpr) on ""Grounds for Term. Code"(Control 58)".


        //Unsupported feature: Property Modification (Name) on ""Grounds for Term. Code"(Control 58)".

        modify(Control13)
        {
            Visible = false;
        }
        // modify(Payments)
        // {
        //     Visible = false;
        // }
        addafter(Gender)
        {
            field(Balance; Rec.Balance)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Phone No.2")
        {
            field(Disabled; Rec.Disabled)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Company E-Mail")
        {
            field("Employee Type"; Rec."Employee Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Type field.';
            }
            field("User Signature"; Rec."User Signature")
            {
                ApplicationArea = Basic;
                Caption = 'Signature';
            }
            field("Advance Account"; Rec."Advance Account")
            {
                ApplicationArea = Basic;
                Caption = 'Advance Account';
            }
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the User ID field.';
            }
        }
        addafter("Last Date Modified")
        {
            field(HOD; Rec.HOD)
            {
                ApplicationArea = Basic;
            }
            field(HODIR; Rec.HODIR)
            {
                ApplicationArea = Basic;
            }
            field(Supervisor; Rec.Supervisor)
            {
                ApplicationArea = Basic;
            }
            field(CEO; Rec.CEO)
            {
                ApplicationArea = Basic;
            }
        }
        addfirst("Address & Contact")
        {
            group(Control1367)
            {
            }
        }
        // addafter("Salespers./Purch. Code")
        // {
        //     // field("Research Center"; Rec."Research Center")
        //     // {
        //     //     ApplicationArea = Basic;
        //     // }
        //     field("Directorate Code"; Rec."Directorate Code")
        //     {
        //         ApplicationArea = Basic;
        //     }
        //     field("Department Code"; Rec."Department Code")
        //     {
        //         ApplicationArea = Basic;
        //     }
        // }
        addafter("Birth Date")
        {
            field(Age; Rec.Age)
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
        addafter(Personal)
        {
            // group(Payments)
            // {
            //     Caption = 'Payments';
            // }
        }
        addafter("Bank Branch No.")
        {
            // field("Currency Code"; Rec."Currency Code")
            // {
            //     ApplicationArea = Basic;
            // }
            group(Administration1)
            {
                Caption = 'Administration';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                // field(Age; Rec.Age)
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Age field.';
                // }
                // field("Employment Date"; Rec."Employment Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the date when the employee began to work for the company.';
                // }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Promotion Date';
                    ToolTip = 'Specifies the value of the Last Promotion Date field.';
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Scheme Join Date';
                    ToolTip = 'Specifies the value of the Pension Scheme Join Date field.';
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Scheme Join Date';
                    ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full / Part Time field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Alert to field.';
                }
                // field(Status; Rec.Status)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employment status of the employee.';
                // }
                // field("Inactive Date"; Rec."Inactive Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the date when the employee became inactive, due to disability or maternity leave, for example.';
                // }
                // field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies a code for the cause of inactivity by the employee.';
                // }
                // field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employment contract code for the employee.';
                // }
                // field("Statistics Group Code"; Rec."Statistics Group Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies a statistics group code to assign to the employee for statistical purposes.';
                // }
                // field("Resource No."; Rec."Resource No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies a resource number for the employee.';
                // }
                // field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                //     ToolTip = 'Specifies a salesperson or purchaser code for the employee.';
                // }
                // field("Union Code"; Rec."Union Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employee''s labor union membership code.';
                // }
                // field("Union Membership No."; Rec."Union Membership No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employee''s labor union membership number.';
                // }
                // field("Disciplinary status"; Rec."Disciplinary status")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                //     ToolTip = 'Specifies the value of the Disciplinary status field.';
                // }
            }
            group("Separation Details")
            {
                // field("Reason for termination Code"; "Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Grounds for Exit';
                //     ToolTip = 'Specifies the value of the Grounds for Exit field.';
                // }
                field("Reason for termination"; Rec."Reason for termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Exit';
                    ToolTip = 'Specifies the value of the Reason for Exit field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Interview Conducted field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    // Editable = ExitDateEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    // Editable = ExitByEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Done by field.';
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Re-Employment In Future field.';
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                // field("Currency Code"; Rec."Currency Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Currency Code field.';
                // }
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays tax? field.';
                }
                field("Pay Wages"; Rec."Pay Wages")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Wages field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                // field("Social Security No."; Rec."Social Security No.")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'N.S.S.F No.';
                //     ToolTip = 'Specifies the social security number of the employee.';
                // }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ID Number field.';
                    Caption = 'ID Number/Passport Number';
                }
                // field("Employee Posting Group"; Rec."Employee Posting Group")
                // {
                //     ApplicationArea = Basic;
                //     ShowMandatory = true;
                //     ToolTip = 'Specifies the employee''s type to link business transactions made for the employee with the appropriate account in the general ledger.';
                // }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Bank Account Number"; Rec."Bank Account Number")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account Number field.';
                    }
                    field("Employee's Bank"; Rec."Employee's Bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank field.';
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name field.';
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch field.';
                    }
                    field("Bank Branch Name"; Rec."Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name field.';
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Employee's Bank 2"; Rec."Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank 2 field.';
                    }
                    field("Bank Name 2"; Rec."Bank Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name 2 field.';
                    }
                    field("Bank Branch 2"; Rec."Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch 2 field.';
                    }
                    field("Bank Branch Name 2"; Rec."Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name 2 field.';
                    }
                    field("Bank Account No. 2"; Rec."Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account No. field.';
                    }
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Allow Negative Leave"; Rec."Allow Negative Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Negative Leave field.';
                }
                field("Off Days"; Rec."Off Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Off Days field.';
                }
                field("Leave Days B/F"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Days B/F field.';
                }
                field("Annual Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total (Leave Days) field.';
                }
                field("Total Leave Days Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Annual Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Acrued Leave Days field.';
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash per Leave Day field.';
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash - Leave Earned field.';
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Status field.';
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Type Filter field.';
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Period Filter field.';
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Leave field.';
                }
            }
        }
    }
    actions
    {
        addafter("&Confidential Information")
        {
            action("Attendance Clocking Entries")
            {
                ApplicationArea = Basic;
                Image = Entries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Clocking Entries";
                RunPageLink = "Employee No" = field("No.");
            }
        }
        addafter(PayEmployee)
        {
            action("Create Customer Imprest A/C")
            {
                ApplicationArea = Basic;
                Enabled = ShowCust;
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Cust: Record Customer;
                begin
                    if Rec.CreateCustomer then
                        Message(Text000, 'Imprest A/C')
                    else
                        Message(Text001, 'Imprest A/C');
                end;
            }
            action(Timesheet)
            {
                ApplicationArea = Basic;
                Caption = 'Timesheet';
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    TimeSheetHeader: Record "Time Sheet Header";
                begin
                    TimeSheetHeader.Reset();
                    TimeSheetHeader.SetRange("Resource No.", Rec."No.");
                    TimeSheetHeader.SetRange("Pay Period", Rec."Pay Period Filter");
                    Report.Run(Report::"Timesheet Report", true, true, TimeSheetHeader);
                end;
            }
            action(EmployeeStatement)
            {
                ApplicationArea = Basic;
                Caption = 'Employee Statement';
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    EmployeeRecord: Record Employee;
                begin
                    EmployeeRecord.Reset();
                    EmployeeRecord.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Employee Statement", true, true, EmployeeRecord);
                end;
            }
            action("Create Resource A/C")
            {
                ApplicationArea = Basic;
                Enabled = ShowResource;
                Image = Resource;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.CreateResource then
                        Message(Text000, 'Resource')
                    else
                        Message(Text001, 'Resource');
                end;
            }
            // action("ICT Inventory Assigned")
            // {
            //     ApplicationArea = Basic;
            //     Image = AllLines;
            //     Promoted = true;
            //     PromotedCategory = Category4;
            //     RunObject = Page "ICT Inventory List";
            //     RunPageLink = "Current Assigned Employee" = field("No.");
            // }

        }
        addafter("&Relatives")
        {
            action(Beneficiaries)
            {
                ApplicationArea = Basic;
                Image = Relatives;
                RunObject = Page "Employee Beneficiaries List";
                RunPageLink = "Employee No." = field("No.");
            }
        }

    }



    //Unsupported feature: Property Modification (Id) on "FormatAddress(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //FormatAddress : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //FormatAddress : 1553;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsCountyVisible(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsCountyVisible : 1002;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsCountyVisible : 1552;
    //Variable type has not been exported.

    var

        ShowCust: Boolean;

        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
}

#pragma implicitwith restore

