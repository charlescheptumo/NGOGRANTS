page 95406 ApprovedRecruitmentRequisition
{
    ApplicationArea = All;
    Caption = 'Approved Recruitment Requisition';
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"), "Approval Status" = filter(Approved));
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate,Dimensions';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                    ApplicationArea = Basic;
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ToolTip = 'Specifies the value of the Requester Staff No field.';
                    ApplicationArea = Basic;
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ToolTip = 'Specifies the value of the Requester Name field.';
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ToolTip = 'Specifies the value of the Recruitment Plan Type field.';
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ToolTip = 'Specifies the value of the Recruitment Plan ID field.';
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ToolTip = 'Specifies the value of the Position ID field.';
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ToolTip = 'Specifies the value of the Positions field.';
                    ApplicationArea = Basic;
                    Caption = 'Positions';
                }
                field("No of Openings"; Rec."No of Openings")
                {
                    ToolTip = 'Specifies the value of the No of Openings field.';
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Sub Department field.';
                    ApplicationArea = Basic;
                    Caption = 'Sub Department';
                    Importance = Additional;
                }
                field(Region; Rec.Region)
                {
                    ToolTip = 'Specifies the value of the Region field.';
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ToolTip = 'Specifies the value of the Primary Recruitment Reason field.';
                    ApplicationArea = Basic;
                }
                field("Recruitment Justification"; Rec."Recruitment Justification")
                {
                    ToolTip = 'Specifies the value of the Recruitment Justification field.';
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ToolTip = 'Specifies the value of the Target Candidate Source field.';
                    ApplicationArea = Basic;
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ToolTip = 'Specifies the value of the Sourcing Method field.';
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ToolTip = 'Specifies the value of the Created Time field.';
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
            }
            group("Recruitment Timelines")
            {
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ToolTip = 'Specifies the value of the Recruitment Cycle Type field.';
                    ApplicationArea = Basic;
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ToolTip = 'Specifies the value of the Recruitment Lead Time field.';
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment Start Date"; Rec."Planned Recruitment Start Date")
                {
                    ToolTip = 'Specifies the value of the Planned Recruitment Start Date field.';
                    ApplicationArea = Basic;
                }
                field("Planned Recruitment End Date"; Rec."Planned Recruitment End Date")
                {
                    ToolTip = 'Specifies the value of the Planned Recruitment End Date field.';
                    ApplicationArea = Basic;
                }
                field("Planned Employment Start Date"; Rec."Planned Employment Start Date")
                {
                    ToolTip = 'Specifies the value of the Planned Employment Start Date field.';
                    ApplicationArea = Basic;
                }
                field("Planned Employment End Date"; Rec."Planned Employment End Date")
                {
                    ToolTip = 'Specifies the value of the Planned Employment End Date field.';
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                    ApplicationArea = Basic;
                }
            }
            group("Recruitment Budget")
            {
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                    ApplicationArea = Basic;
                    Caption = 'Financial Year Code';
                }
                field("Recruitment Line Budget Cost"; Rec."Recruitment Line Budget Cost")
                {
                    ToolTip = 'Specifies the value of the Recruitment Line Budget Cost(LCY) field.';
                    ApplicationArea = Basic;
                }
                field("Average Cost/Hire"; Rec."Average Cost/Hire")
                {
                    ToolTip = 'Specifies the value of the Average Cost/Hire field.';
                    ApplicationArea = Basic;
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                    ApplicationArea = Basic;
                    Caption = 'Project No.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                    ApplicationArea = Basic;
                    Caption = 'Project Activity No.';
                }
                field(Budget; Rec.Budget)
                {
                    ToolTip = 'Specifies the value of the Budget Status field.';
                    ApplicationArea = Basic;
                    Caption = 'Budget Status';
                }
            }
            group("Vacancy Details")
            {
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ToolTip = 'Specifies the value of the Staff Establishment field.';
                    ApplicationArea = Basic;
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ToolTip = 'Specifies the value of the Current Headcount field.';
                    ApplicationArea = Basic;
                }
                field("Hierarchically Reports To"; Rec."Hierarchically Reports To")
                {
                    ToolTip = 'Specifies the value of the Hierarchically Reports To field.';
                    ApplicationArea = Basic;
                }
                field("Functionally  Reports To"; Rec."Functionally  Reports To")
                {
                    ToolTip = 'Specifies the value of the Functionally  Reports To field.';
                    ApplicationArea = Basic;
                }
                field("Estimate Annual Salary"; Rec."Estimate Annual Salary")
                {
                    ToolTip = 'Specifies the value of the Estimate Annual Salary field.';
                    ApplicationArea = Basic;
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ToolTip = 'Specifies the value of the Overall Appointment Authority field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                    ApplicationArea = Basic;
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ToolTip = 'Specifies the value of the Default Terms of Service Code field.';
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ToolTip = 'Specifies the value of the Employment Type field.';
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vacancy No"; Rec."Vacancy No")
                {
                    ToolTip = 'Specifies the value of the Vacancy No field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vacancy Status"; Rec."Vacancy Status")
                {
                    ToolTip = 'Specifies the value of the Vacancy Status field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vacancy Announcement ID"; Rec."Vacancy Announcement ID")
                {
                    ToolTip = 'Specifies the value of the Vacancy Announcement ID field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Date Published"; Rec."Date Published")
                {
                    ToolTip = 'Specifies the value of the Date Published field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Application Closing Time"; Rec."Application Closing Time")
                {
                    ToolTip = 'Specifies the value of the Application Closing Time field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Applications"; Rec."No. of Applications")
                {
                    ToolTip = 'Specifies the value of the No. of Applications field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No of Filled Posts"; Rec."No of Filled Posts")
                {
                    ToolTip = 'Specifies the value of the No of Filled Posts field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }

                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ToolTip = 'Specifies the value of the Work Location Details field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Published; Rec.Published)
                {
                    ToolTip = 'Specifies the value of the Published field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vacancy Created"; Rec."Vacancy Created")
                {
                    ToolTip = 'Specifies the value of the Vacancy Created field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requisition ID"; Rec."Requisition ID")
                {
                    ToolTip = 'Specifies the value of the Requisition ID field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Position Category"; Rec."Position Category")
                {
                    ToolTip = 'Specifies the value of the Position Category field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ToolTip = 'Specifies the value of the Contract Type field.';
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contract Type2"; Rec."Contract Type2")
                {
                    ToolTip = 'Specifies the value of the Contract Type2 field.';
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Position Requirements")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No.");
            }
            action("Requirements Substitutes")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Requisition Substitutes";
                RunPageLink = "Document No." = field("Document No.");
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Requisition Responsibilities";
                RunPageLink = "Document No." = field("Document No.");
            }
            action("Work Condition")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Recruitment Work Condition";
                RunPageLink = "Document No" = field("Document No.");
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
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
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                Visible = Rec."Approval Status" = Rec."Approval Status"::Open;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    // if ApprovalsMgmt.CheckRecruitmentRequisitionHeaderApprovalsWorkflowEnabled(Rec) then
                    //     ApprovalsMgmt.OnSendRecruitmentRequisitionHeaderForApproval(Rec);
                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                Visible = Rec."Approval Status" = Rec."Approval Status"::"Pending Approval";

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    // if ApprovalsMgmt.CheckRecruitmentRequisitionHeaderApprovalsWorkflowEnabled(Rec) then
                    //     ApprovalsMgmt.OnCancelRecruitmentRequisitionHeaderApprovalRequest(Rec);
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Create Vacancy")
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //create the vacancy based on vacancies available
                    Rec.TestField("No of Openings");
                    Rec.TestField("Vacancy Created", false);
                    Rec.TestField("Approval Status", Rec."approval status"::Approved);
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Recruitment.TransferRequisitionToVacancy(Rec);
                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(50010, true, true, Rec)
                end;
            }
            action("Suggest Position Requirements")
            {
                ApplicationArea = Basic;
                Image = SuggestPayment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Recruitment.CopyPositionDetails(Rec);
                end;
            }
            action("Position Benefits")
            {
                ApplicationArea = Basic;
                Image = BankAccountLedger;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Benefit Plan Grade";
                RunPageLink = "Job Grade ID" = field("Job Grade ID");
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}
