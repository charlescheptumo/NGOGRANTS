page 50086 EmployeeListHR2
{
    ApplicationArea = All;
    Caption = 'Employee List';
    CardPageId = "Employee Card-HR1";
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(FullName; Rec.FullName())
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                    ToolTip = 'Specifies the full name of the employee.';
                    Editable = false;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s middle name.';
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Current Position ID"; Rec."Current Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Position ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Date';
                    ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Join field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control3; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = Basic;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Visible = false;
                SubPageLink = "Table ID" = const(Database::Employee), "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }

        }
    }
    actions
    {
        area(navigation)
        {
            // group(Signature)
            // {
            //     Caption = 'Employee Signature';
            //     Image = Signature;
            //     action("Signatures")
            //     {
            //         trigger OnAction();
            //         begin
            //             Page.Run(69066, UserSetup);

            //         end;
            //     }


            // }

            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(5200),
                                      "No." = field("No.");
                        ShortCutKey = 'Alt+D';
                        ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            Employee: Record Employee;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Employee);
                            DefaultDimMultiple.SetMultiRecord(Employee, Rec.FieldNo("No."));
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View or add a picture of the employee or, for example, the company''s logo.';
                }
                action(AlternativeAddresses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Alternate Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Open the list of addresses that are registered for the employee.';
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Open the list of relatives that are registered for the employee.';
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Open the list of miscellaneous articles that are registered for the employee.';
                }
                action("Co&nfidential Information")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Co&nfidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Open the list of any confidential information that is registered for the employee.';
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Open the list of qualifications that are registered for the employee.';
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'View absence information for the employee.';
                }
                separator(Action51)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                    ToolTip = 'View categorized absence information for the employee.';
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                    ToolTip = 'View miscellaneous articles that are registered for the employee.';
                }
                action("Con&fidential Info. Overview")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'View confidential information that is registered for the employee.';
                }
                action(Contact)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Contact';
                    Image = ContactPerson;
                    ToolTip = 'View or edit detailed information about the contact person at the employee.';

                    trigger OnAction()
                    var
                        ContBusRel: Record "Contact Business Relation";
                        Contact: Record Contact;
                    begin
                        if ContBusRel.FindByRelation(ContBusRel."Link to Table"::Employee, Rec."No.") then begin
                            Contact.Get(ContBusRel."Contact No.");
                            Page.Run(Page::"Contact Card", Contact);
                        end;
                    end;
                }
                action("Create Resource A/C")
                {
                    ApplicationArea = Basic;
                    // Enabled = ShowResource;
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Create Resource A/C action.';
                    trigger OnAction()
                    begin
                        if Rec.CreateResource then
                            Message(Text008, 'Resource')
                        else
                            Message(Text009, 'Resource');
                    end;
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Sent Emails")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sent Emails';
                    Image = ShowList;
                    ToolTip = 'View a list of emails that you have sent to this employee.';

                    trigger OnAction()
                    var
                        Email: Codeunit Email;
                    begin
                        Email.OpenSentEmails(Database::Employee, Rec.SystemId);
                    end;
                }
            }
        }
        area(processing)
        {
            action("Absence Registration")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Absence Registration';
                Image = Absence;
                RunObject = Page "Absence Registration";
                ToolTip = 'Register absence for the employee.';
            }
            action("Ledger E&ntries")
            {
                ApplicationArea = Basic;
                Caption = 'Ledger E&ntries';
                Image = VendorLedger;
                RunObject = Page "Employee Ledger Entries";
                RunPageLink = "Employee No." = field("No.");
                RunPageView = sorting("Employee No.")
                              order(Descending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'View the history of transactions that have been posted for the selected record.';
            }
            action(PayEmployee)
            {
                ApplicationArea = Basic;
                Caption = 'Pay Employee';
                Image = SuggestVendorPayments;
                RunObject = Page "Employee Ledger Entries";
                RunPageLink = "Employee No." = field("No."),
                              "Remaining Amount" = filter(< 0),
                              "Applies-to ID" = filter('');
                ToolTip = 'View employee ledger entries for the selected record with remaining amount that have not been paid yet.';
            }
            action(ApplyTemplate)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Apply Template';
                Ellipsis = true;
                Image = ApplyTemplate;
                ToolTip = 'Apply a template to update one or more entities with your standard settings for a certain type of entity.';

                trigger OnAction()
                var
                    Employee: Record Employee;
                    EmployeeTemplMgt: Codeunit "Employee Templ. Mgt.";
                begin
                    CurrPage.SetSelectionFilter(Employee);
                    EmployeeTemplMgt.UpdateEmployeesFromTemplate(Employee);
                end;
            }
            action(Email)
            {
                ApplicationArea = All;
                Caption = 'Send Email';
                Image = Email;
                ToolTip = 'Send an email to this employee.';
                Enabled = CanSendEmail;

                trigger OnAction()
                var
                    TempEmailItem: Record "Email Item" temporary;
                    EmailScenario: Enum "Email Scenario";
                begin
                    TempEmailItem.AddSourceDocument(Database::Employee, Rec.SystemId);
                    if Rec."Company E-Mail" <> '' then
                        TempEmailitem."Send to" := Rec."Company E-Mail"
                    else
                        TempEmailitem."Send to" := Rec."E-Mail";
                    TempEmailItem.Send(false, EmailScenario::Default);
                end;
            }
        }
        // area(Promoted)
        // {
        //     group(Category_Process)
        //     {
        //         Caption = 'Process';

        //         actionref(Email_Promoted; Email)
        //         {
        //         }
        //         actionref(ApplyTemplate_Promoted; ApplyTemplate)
        //         {
        //         }
        //         actionref("Absence Registration_Promoted"; "Absence Registration")
        //         {
        //         }
        //         actionref(PayEmployee_Promoted; PayEmployee)
        //         {
        //         }
        //         actionref("Ledger E&ntries_Promoted"; "Ledger E&ntries")
        //         {
        //         }
        //     }
        //     group(Category_Employee)
        //     {
        //         Caption = 'Employee';

        //         group(Category_Dimensions)
        //         {
        //             Caption = 'Dimensions';
        //             ShowAs = SplitButton;

        //             actionref("Dimensions-&Multiple_Promoted"; "Dimensions-&Multiple")
        //             {
        //             }
        //             actionref("Dimensions-Single_Promoted"; "Dimensions-Single")
        //             {
        //             }
        //         }
        //         actionref("Co&mments_Promoted"; "Co&mments")
        //         {
        //         }
        //         actionref(Contact_Promoted; Contact)
        //         {
        //         }
        //     }
        // }
    }

    trigger OnAfterGetRecord()
    begin
        // HumanResourcesSetup.GET;
        //  IF "Date Of Birth">0D THEN BEGIN
        // Rage:=CALCDATE(HumanResourcesSetup."Retirement Age","Date Of Birth");
        //    "Retirement Date":=CALCDATE('<+1D>',Rage);
        //    MODIFY(TRUE);
        //  END;
        Rec.SetRange("No.");
    end;

    trigger OnAfterGetCurrRecord()
    var
        Employee: Record Employee;
    begin
        CurrPage.SetSelectionFilter(Employee);
        CanSendEmail := Employee.Count() = 1;
    end;

    trigger OnOpenPage()
    begin
        HumanResourcesSetup.Get;
        if Rec."Date Of Birth" > 0D then begin
            Rage := CalcDate(HumanResourcesSetup."Retirement Age", Rec."Date Of Birth");
            Rec."Retirement Date" := CalcDate('<+1D>', Rage);
            Rec.Modify(true);
        end;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        Rage: Date;
        Text008: label '%1 has been created successully';
        Text009: label '%1 already exists';
        CanSendEmail: Boolean;
        UserSetup: Record "User Setup";


}
