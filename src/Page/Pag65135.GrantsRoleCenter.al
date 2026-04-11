#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65135 "Grants  Role Center"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'Manager''s  Role Center', Comment = '{Dependency=Match,"ProfileDescription_SMALLBUSINESS"}';
    PageType = RoleCenter;
    ApplicationArea = Basic;

    layout
    {
        area(rolecenter)
        {
            part(Control23; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            // part(Control22; "Grant Activities")
            // {
            //     AccessByPermission = TableData "Activities Cue" = I;
            //     ApplicationArea = Basic, Suite;
            // }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Grantscue; "Grants Cue")
            {
                ApplicationArea = Suite;
            }
            /* part(Control21; "Help And Chart Wrapper")
            {
                //AccessByPermission = TableData "Assisted Setup" = I;
                ApplicationArea = Basic, Suite;
                Caption = '';
                ToolTip = 'Specifies the view of your business assistance';
            }
            part(Control19; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Favorite Accounts';
            }
            part(Control18; "Trial Balance")
            {
                AccessByPermission = TableData "G/L Entry" = R;
                ApplicationArea = Basic, Suite;
            } */

        }
    }

    actions
    {
        area(creation)
        {
            action("User Task List")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Tasks';
                RunObject = Page "User Task List";
                ToolTip = 'Executes the Assign Tasks action.';
            }
            group("&SelfService")
            {
                Caption = '&SelfService';
                Image = Tools;
                action("Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    Image = New;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Memo";
                    Visible = false;
                    RunPageMode = Create;
                    ToolTip = 'Executes the Imprest Memo action.';
                }
                action("Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Requisition';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Requisition";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Advance Requisition action.';
                }
                action("Imprest Surrender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Surrender';
                    Image = NewDocument;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Imprest Surrender";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Advance Surrender action.';
                }
                action("Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Document;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Leave Application";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Leave Application action.';
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Document;
                    Promoted = false;
                    Visible = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Purchase Requisition Card";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Purchase Requisition action.';
                }
                action(FunctionalRecruitmentPlan)
                {
                    ApplicationArea = Basic;
                    Caption = 'Functional Recruitment Plan';
                    Image = Employee;
                    RunObject = Page "Functional Recruitment Plans";
                    ToolTip = 'Executes the Functional Recruitment Requisition action.';
                }
                // action(RecruitmentRequisition)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Recruitment Requisitions';
                //     Image = Employee;
                //     RunObject = Page "Recruitment Requisitions";
                //     ToolTip = 'Executes the Recruitment Requisitions action.';
                // }
                // action(ShortListedCandidates)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Short-Listed Candidates';
                //     Image = Employee;
                //     RunObject = Page "Job Applications";
                //     RunPageLink = Shortlist = const(true), Directorate = const('GM'), Department = const('GRANTS');
                //     ToolTip = 'Executes the Short-Listed Candidates action.';
                // }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = New;
                action("Funding Agencies")
                {
                    AccessByPermission = TableData Customer = IMD;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Funding Agencies';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageMode = Create;
                    RunPageView = where("Funding Class" = const(Grant));
                    ToolTip = 'Register a new Donor';
                }
                action("Collaborator & Partners")
                {
                    ApplicationArea = Basic;
                    Caption = 'Collaborator & Partners';
                    RunObject = Page "Contact Card";
                    ToolTip = 'Executes the Collaborator & Partners action.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                group("Grants Reports")
                {
                    Caption = 'Grants Reports';
                    Image = ReferenceData;
                    action("Research Centers List")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "Research Center List";
                        ToolTip = 'Executes the Research Centers action.';
                    }
                    action("Funding Announcements")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "FOA List";
                        ToolTip = 'Executes the Funding Announcements action.';
                    }
                    action("Research Center Grants")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Grants Per Research Center';
                        RunObject = Report "Research Center Grants";
                        ToolTip = 'Executes the Grants Per Research Center action.';
                    }
                    action("Research Center Projects")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Projects Per Research Center';
                        RunObject = Report "Research Center Projects";
                        ToolTip = 'Executes the Projects Per Research Center action.';
                    }
                    action("Research Center Assets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Projects Per Research Center';
                        RunObject = Report "Research Center Assets";
                        ToolTip = 'Executes the Projects Per Research Center action.';
                    }
                    action("Payroll FTE")
                    {
                        ApplicationArea = Basic;
                        RunObject = Report "Payroll FTE Report";
                        ToolTip = 'Executes the Research Centers action.';
                    }
                }
                group("Self Service Reports")
                {
                    Caption = 'Self Service Reports';
                    Image = ReferenceData;
                    action(Action37)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Memo';
                        Image = "Report";
                        //RunObject = Report "Imprest Memo";
                        ToolTip = 'Executes the Imprest Memo action.';
                    }
                    // action("Imprest Requisition")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Imprest Requisition';
                    //     Image = "Report";
                    //     //RunObject = Report "Imprest Requisition";
                    //     ToolTip = 'Executes the Imprest Requisition action.';
                    // }
                    action(Action35)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Imprest Surrender';
                        Image = "Report";
                        RunObject = Report "Imprest Surrender";
                        ToolTip = 'Executes the Imprest Surrender action.';
                    }
                    separator(Action33)
                    {
                    }
                    action(" Leave Application Print Out")
                    {
                        ApplicationArea = Basic;
                        Caption = ' Leave Application Print Out';
                        Image = "Report";
                        //RunObject = Report "Leave Application";
                        ToolTip = 'Executes the  Leave Application Print Out action.';
                    }
                    separator(Action31)
                    {
                    }
                }
            }
        }
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action("GrantFund")
            {
                ApplicationArea = Basic;
                Caption = 'Grant Funding Application List';
                Image = Loaners;
                RunObject = Page "Grant Funding Application List";
                ToolTip = 'List of all grants awarded';
            }
            action(ProjectsList)
            {
                ApplicationArea = Basic;
                Caption = 'Projects Funding Contracts';
                Image = Loaners;
                RunObject = Page "Projects List";
                ToolTip = 'Executes the Loans action.';
            }
            action(Projects)
            {
                ApplicationArea = Basic;
                Caption = 'Projects';
                Image = Loaners;
                RunObject = Page Projects;
                ToolTip = 'Executes the Loans action.';
            }
            // action("Fixed Price Billing  List")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Fixed Price Billing  List';
            //     Image = Loaners;
            //     Visible = false;
            //     RunObject = Page "Fixed Price Billing  List";
            //     ToolTip = 'Executes the Loans action.';
            // }
            // action("Cost Reimbursement Billings")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Cost Reimbursement Billings';
            //     Image = Loaners;
            //     Visible = false;
            //     RunObject = Page "Cost Reimbursement Billings";
            //     ToolTip = 'Executes the Loans action.';
            // }
            action(Donors)
            {
                ApplicationArea = Basic;
                Caption = 'Donor List';
                Image = Loaners;
                RunObject = Page "Customer List";
                RunPageView = where("Funding Class" = const(Grant));
            }
            action(ImplementingPartners)
            {
                ApplicationArea = Basic;
                Caption = 'Implementing Partners';
                Image = Loaners;
                RunObject = Page "Property Customer List";
            }
            action(PortalUser)
            {
                ApplicationArea = Basic;
                Caption = 'APHF Implementing Partners Portal';
                RunObject = Page "Dynasoft Portal User";
            }

        }
        area(sections)
        {

            group("Grants Setup")
            {
                action("GrantsSetup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Grants Setup Card";
                    ToolTip = 'Set up Grants Management Module';
                    Caption = 'Grants Setup';
                }
                group(Research)
                {
                    action("Research Centers")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Research Center List";

                    }
                    action("Research Program")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Research Program List";

                    }
                    action("Research Output Categories")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Research Output Categories";

                    }
                    action("Research Approval Committee")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Research Approval Comm List";

                    }
                    action("Research Team Roles")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Research Team Roles List";

                    }
                    group("Grants Management Setup")
                    {
                        action("Grants Management No.")
                        {
                            ApplicationArea = Basic;
                            RunObject = Page "Grants Setup Card";

                        }
                    }

                }
                group("Stakeholders")
                {
                    action("Research Investigators")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Research Investigators";

                    }
                    action("Collaborators")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Contact List";


                    }
                }
            }
            group("Pre-Award Phase Planning")
            {
                action("Researchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Researcher List";
                    Caption = 'Researchers';

                }
                action("Grant Administrators")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Admin List";
                    Caption = 'Grant Administrators';

                }
                action("Collaborators & Partners")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Contact List";
                    Caption = 'Collaborators & Partners';

                }
                action("Funding Agencie")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Funding Agency List";
                    Caption = 'Funding Agencies';

                }
                action("Funding Opportunity Announcements")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Funding Opportunity List";


                }
                action("Open External Calls")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open External Calls";


                }
                action("Open Internal Calls")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open Internal Calls";
                }
                action("FOA List")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "FOA List";
                }
                action("Closed External Calls")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Closed External Calls";
                }
                action("Closed Internal Calls")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Closed Internal Calls";
                }
            }
            group("Pre-Award Grant Funding Proposals")
            {
                action("Open External")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open External Calls";
                    Caption = 'Open External Calls';

                }
                action("Open Internal")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open Internal Calls";
                    Caption = 'GOpen Internal Calls';

                }
                action("External Research Proposals")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "External Research Proposals";
                    Caption = 'External Research Proposals';

                }
                action("Internal Research Proposals")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Internal Research Proposals";
                    Caption = 'Internal Research Proposals';

                }
                action("My Research Proposals")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Research Proposals";


                }
                action("Submitted External Proposals")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Submitted External Proposals";


                }
                action("Submitted Internal Proposals")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Submitted Internal Proposals";
                }
                // action("Research Center List")
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Report 65010;
                // }

            }
            group(Award)
            {
                Caption = 'Award';
                action("CExtension Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Contract Amendment";
                    Caption = 'Award Addendum Vouchers';
                    ToolTip = 'Award Addendum Project Contracts';
                }
                action("Approved Award Addendum")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Award Addendums";
                    Caption = 'Approved Award Addendums';
                    ToolTip = 'Approved Addendum Project Contracts';
                }
                action("Posted Award Addendum")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Award Addendums";
                    Caption = 'Posted Award Addendums';
                    ToolTip = 'Posted Addendum Project Contracts';
                }
                group("Funding Calls Register")
                {
                    action("Closed Eternal Calls")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Closed External Calls";
                        Caption = 'Closed Enternal Calls';
                        ToolTip = 'Posted Addendum Project Contracts';
                    }
                    action("Closed Iternal Calls")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Closed Internal Calls";
                        Caption = 'Closed Internal Calls';
                        ToolTip = 'Posted Addendum Project Contracts';
                    }
           
                    action("Unsuccessful Proposals")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Lost Grants Opportunities";
                        Caption = 'Unsuccessful Proposals';
                      
                    }
                    action("Successful Proposals")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Won Grants Opportunities";
                        Caption = 'Successful Proposals';
             
                    }
                }


            }
            group("Sub Award")
            {
                action("Recepient Fund Request")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Recipient Fund Requests";
                    ToolTip = 'Request for funds';
                }
                action("Approved Recepient Fund Request")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "A_SubRecepient Fund Requests";
                    ToolTip = 'Approved Request for funds';
                }
                action("Posted Recepient Fund Request")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "P_SubRecepient Fund Requests";
                    ToolTip = ' Posted Request for funds';
                }
                action("Recepient Surrender")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Recepient Surrenders";
                    ToolTip = 'Account for funds';
                }
                action("Approved Recepient Surrender")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Recepient Surrenders";
                    ToolTip = 'Account for funds';
                }
                action("Posted Recepient Surrender")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Recepient Surrenders";
                    ToolTip = 'Account for funds';
                }
                action("Open Contracts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Open Sub Award Contracts";
                    ToolTip = 'Open Sub Award Contracts';
                }
                action("Ongoing Contracts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Ongoing Sub Award Contracts";
                    ToolTip = 'Ongoing Sub Award Contracts';
                }
                action("Extension Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Extension Vouchers";
                    Caption = 'Sub Award Addendum Vouchers';
                    ToolTip = 'Sub Award Addendum Vouchers';
                }
                action("Approved Extension Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Sub Award Addendums";
                    Caption = 'Approved Sub Award Addendum Vouchers';
                    ToolTip = 'Approved Sub Award Addendum Vouchers';
                }
                action("Posted Extension Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Sub Award Addendums";
                    Caption = 'Posted Sub Award Addendum Vouchers';
                    ToolTip = 'Posted Sub Award Addendum Vouchers';
                }
                action("Extension Sub Award Contracts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Extension Sub Award Contracts";
                    ToolTip = 'Amended Sub Award Contracts';
                }
                action("Closeout Sub Award Contracts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Closeout Sub Award Contracts";
                    ToolTip = 'Closeout Sub Award Contracts';
                }
                action("Completed Contracts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Completed Sub Award Contracts";
                    ToolTip = 'Completed Sub Award Contracts';
                }
            }
            group("Self Service")
            {
                // group("My Request")
                // {
                //     Caption = 'My Request';
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
                    ToolTip = 'Executes the My Advance Requisitions action.';
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
                    ToolTip = 'Executes the My Advance Surrenders action.';
                }
                action("Claims Refund")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claims Refund';
                    RunObject = Page "Staff Claims";
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
                action(RecruitmentRequisition)
                {
                    ApplicationArea = Basic;
                    Caption = 'Recruitment Requisitions';
                    Image = Employee;
                    RunObject = Page "Recruitment Requisitions";
                    ToolTip = 'Executes the Recruitment Requisitions action.';
                }
                action(ShortListedCandidates)
                {
                    ApplicationArea = Basic;
                    Caption = 'Short-Listed Candidates';
                    Image = Employee;
                    RunObject = Page "Job Applications";
                    RunPageLink = Shortlist = const(true), Directorate = const('GM'), Department = const('GRANTS');
                    ToolTip = 'Executes the Short-Listed Candidates action.';
                }
                action("My Approved Leave Applications")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Approved Leave Applications";
                    ToolTip = 'Executes the My Approved Leave Applications action.';
                }

                // }
                //     group("My Approved Requests")
                // {
                //     action("My Approved Leave Applications")
                //     {
                //         ApplicationArea = Basic;
                //         RunObject = Page "My Approved Leave Applications";
                //         ToolTip = 'Executes the My Approved Leave Applications action.';
                //     }
                //     action("Approved Advance Request")
                //     {
                //         ApplicationArea = Basic;
                //         Caption = 'Approved Advance Requests';
                //         RunObject = Page "Approved Imprest Requisitions";
                //         ToolTip = 'Executes the Approved Advance Request action.';
                //     }
                //     action("Approved Imprest Memos")
                //     {
                //         ApplicationArea = Basic;
                //         RunObject = Page "Approved Imprest Memos";
                //         Visible = false;
                //         ToolTip = 'Executes the Approved Imprest Memos action.';
                //     }
                //     action("Approved Imprest Surrenders")
                //     {
                //         ApplicationArea = Basic;
                //         RunObject = Page "Approved Imprest Surrenders";
                //         ToolTip = 'Executes the Approved Imprest Surrenders action.';
                //     }
                //     action("Approved Purchase Requisition")
                //     {
                //         ApplicationArea = Basic;
                //         Visible = false;
                //         RunObject = Page "Approved Purchase Requisition";
                //         ToolTip = 'Executes the Approved Purchase Requisition action.';
                //     }
                // }
            }
        }
    }
}
