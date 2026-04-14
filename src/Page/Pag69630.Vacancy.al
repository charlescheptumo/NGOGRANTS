#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69630 "Vacancy"
{
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Home,Reopen';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vacancy No.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition ID"; Rec."Requisition ID")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position Category"; Rec."Position Category")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("No of Openings"; Rec."No of Openings")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    Importance = Additional;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Department';
                    Importance = Additional;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Justification"; Rec."Recruitment Justification")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            part("Roles & Responsibilities"; "Vacancy Responsibilities")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                ApplicationArea = Basic;
            }
            group("Recruitment Timelines")
            {
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Planned Recruitment Start Date"; Rec."Planned Recruitment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment End Date"; Rec."Planned Recruitment End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                }
                field("Application Closing Time"; Rec."Application Closing Time")
                {
                    ToolTip = 'Specifies the value of the Application Closing Time field.';
                }
                field("Planned Employment Start Date"; Rec."Planned Employment Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Employment End Date"; Rec."Planned Employment End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Recruitment Budget")
            {
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Financial Year Code';
                }
                field("Recruitment Line Budget Cost"; Rec."Recruitment Line Budget Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Average Cost/Hire"; Rec."Average Cost/Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project No';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Activity No';
                }
            }
            group("Job Information")
            {
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                }
                field("Hierarchically Reports To"; Rec."Hierarchically Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Functionally  Reports To"; Rec."Functionally  Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Annual Salary"; Rec."Estimate Annual Salary")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Document No.");
                Caption = 'Attachments';
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Caption = 'Publish to E-Recruitment Portal';
                Image = PostedPutAway;
                Promoted = true;
                PromotedCategory = Process;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Rec.TestField(Published, false);
                    if Confirm('Are you sure you want to advertise the vacancies on this document?') = true then begin
                        Recruitment.AdvertiseVacancy(Rec);
                    end
                    //create ledger entries
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Message('Approval Request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Approved;
                    Rec.Modify(true);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.SetRecordFilters(DATABASE::"Purchase Header","Document Type","No.");
                    ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Document No.");
                    ApprovalEntries.Run;
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Visible = false;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Message('Approval Request has been cancelled');
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
            separator(Action84)
            {
            }
            separator(Action85)
            {
            }

            action("Cancel/Terminate Recruitment")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec."Vacancy Status" := Rec."vacancy status"::Cancelled;
                    Rec.Modify(true);
                end;
            }
            action("Close Recruitment Project")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec."Vacancy Status" := Rec."vacancy status"::Cancelled;
                    Rec.Modify(true);
                end;
            }

        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69605, true, false, Rec);
                end;
            }
        }
        area(navigation)
        {
            group("Vacancy Details")
            {
                action("Position Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    Promoted = true;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No.");
                }
                action("Vacancy Substitutes")
                {
                    ApplicationArea = Basic;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    Promoted = true;
                    RunObject = Page "Vacancy Substitutes";
                }
                action("Position Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    Promoted = true;
                    RunObject = Page "Vacancy Responsibilities";
                }
                action("Position Work Condition")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    Promoted = true;
                    RunObject = Page "Vacancy Work Condition";
                }
                action("Position Benefits")
                {
                    ApplicationArea = Basic;
                    Image = BankAccountLedger;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Benefit Plan Grade";
                    RunPageLink = "Job Grade ID" = field("Job Grade ID");
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Replan;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Requisition Required Documents";
                    RunPageLink = "Document No." = field("Requisition ID");
                }
            }
            group(Applications)
            {

                action("Job Applications")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action(Longlist)
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Longlisted Candidates";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action(Shortlist)
                {
                    ApplicationArea = Basic;
                    Image = CheckRulesSyntax;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "ShortListed Candidates";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action("Written Assessment")
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Written Assessment";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action("First Interview")
                {
                    ApplicationArea = Basic;
                    Caption = 'First Round';
                    Image = NewSparkle;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "First Interview";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }
                action("Second Interview")
                {
                    ApplicationArea = Basic;
                    Image = NewSparkle;
                    Caption = 'Final Round';
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Second Interview";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                }

            }
            group(Activities)
            {
                action(SendAssessment)
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    Caption = 'Send Assessment';
                    trigger OnAction()
                    var
                        erecruit: Codeunit Recruitment;
                        Apps: Record "Job Applications";
                        Recepients: List of [Text];
                    begin
                        Apps.Reset();
                        Apps.SetRange("Vacancy Id", Rec."Document No.");
                        Apps.SetRange("Invite Written Assessment", true);
                        if Apps.FindSet() then begin
                            repeat
                                Recepients.Add(Apps."E-Mail");

                            until Apps.Next() = 0;
                        end else begin
                            Error('There are no candidates qualified for the written assessment.');
                        end;
                        sendAssessmentEmail(Recepients);
                    end;
                }
                action(SendInterviewInvite)
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    Caption = 'Send First Interview Invite';
                    trigger OnAction()
                    var
                        erecruit: Codeunit Recruitment;
                        Apps: Record "Job Applications";
                        Recepients: List of [Text];
                    begin
                        Apps.Reset();
                        Apps.SetRange("Vacancy Id", Rec."Document No.");
                        Apps.SetRange("Invite interview", true);
                        if Apps.FindSet() then begin
                            repeat
                                Recepients.Add(Apps."E-Mail");

                            until Apps.Next() = 0;
                        end else begin
                            Error('There are no candidates qualified for the First Interview');
                        end;
                        sendFirstInterview(Recepients);
                    end;
                }
                action(SendSecondInterviewInvite)
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Caption = 'Send Second Interview Invite';
                    Promoted = true;
                    PromotedCategory = Category7;
                    trigger OnAction()
                    var
                        erecruit: Codeunit Recruitment;
                        Apps: Record "Job Applications";
                        Recepients: List of [Text];
                    begin
                        Apps.Reset();
                        Apps.SetRange("Vacancy Id", Rec."Document No.");
                        Apps.SetRange("Second interview", true);
                        if Apps.FindSet() then begin
                            repeat
                                Recepients.Add(Apps."E-Mail");

                            until Apps.Next() = 0;
                        end else begin
                            Error('There are no candidates qualified for the Second Interview');
                        end;
                        sendFirstInterview(Recepients);
                    end;
                }


            }
            group(History)
            {
                action("Vacancy Posting")
                {
                    ApplicationArea = Basic;
                    Image = VendorPayment;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Vacancy Posting";
                    RunPageLink = "Vacancy ID" = field("Document No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Job Vacancy";
    end;

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        //SetControlAppearance;

        DocType := DocType::Vacancy;
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."Document No.");

    end;

    var

        Recruitment: Codeunit Recruitment;

    procedure sendAssessmentEmail(Recepnt: List of [Text])
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        CC: List of [Text];
        BCC: List of [Text];
        Body: Text;
        Ins: InStream;
        TempBlob: Codeunit "Temp Blob";
        Filename: Text;
        Contenttype: Text;
        EmailScenario: Enum "Email Scenario";
        Sharepoint: Page "Sharepoint File List";
        Url: Text;
        DMS: Codeunit SharepointDMS;
        GlobalDocType: Enum "Approval Document Type";
    begin
        // Body := 'Please find attached the written assessment';
        // EmailMsg.Create(BCC, 'RECRUITMENT ASSESSMENT', Body, false, CC, Recepnt);
        // UploadIntoStream('Upload', '', '', Filename, Ins);
        // EmailMsg.AddAttachment(Filename, 'PDF', Ins);
        // EmailScenario := EmailScenario::HR;
        // GlobalDocType := "Approval Document Type"::Vacancy;
        // if Email.Send(EmailMsg, EmailScenario) then begin
        //     //Url := DMS.UploadDocument(Rec."Document No.", GlobalDocType);
        //     //Sharepoint.CreateMetaData(Filename, Url);
        // end;

        Body := 'Please find attached the written assessment';

        EmailMsg.Create(BCC, 'INTERVIEW ASSESSMENT', Body, false, CC, Recepnt);
        EmailScenario := EmailScenario::Recruitment;
        Email.OpenInEditor(EmailMsg);

    end;

    procedure sendFirstInterview(Recepnt: List of [Text])
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        CC: List of [Text];
        BCC: List of [Text];
        Body: Text;
        Ins: InStream;
        TempBlob: Codeunit "Temp Blob";
        Filename: Text;
        Contenttype: Text;
        EmailScenario: Enum "Email Scenario";
        Sharepoint: Page "Sharepoint File List";
        Url: Text;
        DMS: Codeunit SharepointDMS;
        GlobalDocType: Enum "Approval Document Type";
    begin

        EmailMsg.Create(BCC, 'INTERVIEW INVITE', Body, false, CC, Recepnt);
        EmailScenario := EmailScenario::Recruitment;
        Email.OpenInEditor(EmailMsg);

    end;
}

#pragma implicitwith restore

