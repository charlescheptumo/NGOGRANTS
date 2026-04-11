report 50010 "Recruitment Requisition"
{
    ApplicationArea = All;
    Caption = 'Recruitment Requisition';
    RDLCLayout = 'Layouts/Recruitment Requisition.rdlc';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(RecruitmentRequisitionHeader; "Recruitment Requisition Header")
        {
            column(CompanyLogo; Compinfo.Picture)
            {
            }
            column(CompanyName; Compinfo.Name)
            {
            }
            column(CompanyAddress; Compinfo.Address)
            {
            }
            column(CompanyAddress2; Compinfo."Address 2")
            {
            }
            column(CompanyPostCode; Compinfo."Post Code")
            {
            }
            column(CompanyCity; Compinfo.City)
            {
            }
            column(CompanyPhone; Compinfo."Phone No.")
            {
            }
            column(CompanyFax; Compinfo."Fax No.")
            {
            }
            column(CompanyEmail; Compinfo."E-Mail")
            {
            }
            column(CompanyWebsite; Compinfo."Home Page")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(RecruitmentPlanID; "Recruitment Plan ID")
            {
            }
            column(RecruitmentPlanType; "Recruitment Plan Type")
            {
            }
            column(PositionID; "Position ID")
            {
            }
            column(RequesterID; "Requester ID")
            {
            }
            column(RequesterStaffNo; "Requester Staff No")
            {
            }
            column(RequesterName; "Requester Name")
            {
            }
            column(Directorate; Directorate)
            {
            }
            column(Department; Department)
            {
            }
            column(Region; Region)
            {
            }
            column(FinacialYearCode; "Finacial Year Code")
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(CreatedTime; "Created Time")
            {
            }
            column(StaffEstablishment; "Staff Establishment")
            {
            }
            column(CurrentHeadcount; "Current Headcount")
            {
            }
            column(NoofOpenings; "No of Openings")
            {
            }
            column(PrimaryRecruitmentReason; "Primary Recruitment Reason")
            {
            }
            column(RecruitmentJustification; "Recruitment Justification")
            {
            }
            column(TargetCandidateSource; "Target Candidate Source")
            {
            }
            column(SourcingMethod; "Sourcing Method")
            {
            }
            column(RecruitmentCycleType; "Recruitment Cycle Type")
            {
            }
            column(RecruitmentLeadTime; "Recruitment Lead Time")
            {
            }
            column(PlannedRecruitmentStartDate; "Planned Recruitment Start Date")
            {
            }
            column(PlannedRecruitmentEndDate; "Planned Recruitment End Date")
            {
            }
            column(PlannedEmploymentStartDate; "Planned Employment Start Date")
            {
            }
            column(PlannedEmploymentEndDate; "Planned Employment End Date")
            {
            }
            column(JobNo; "Job No.")
            {
            }
            column(JobTaskNo; "Job Task No.")
            {
            }
            column(FundingSourceID; "Funding Source ID")
            {
            }
            column(RecruitmentLineBudgetCost; "Recruitment Line Budget Cost")
            {
            }
            column(AverageCostHire; "Average Cost/Hire")
            {
            }
            column(EstimateAnnualSalary; "Estimate Annual Salary")
            {
            }
            column(HierarchicallyReportsTo; "Hierarchically Reports To")
            {
            }
            column(FunctionallyReportsTo; "Functionally  Reports To")
            {
            }
            column(JobGradeID; "Job Grade ID")
            {
            }
            column(OverallAppointmentAuthority; "Overall Appointment Authority")
            {
            }
            column(SeniorityLevel; "Seniority Level")
            {
            }
            column(DefaultTermsofServiceCode; "Default Terms of Service Code")
            {
            }
            column(EmploymentType; "Employment Type")
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(VacancyNo; "Vacancy No")
            {
            }
            column(VacancyStatus; "Vacancy Status")
            {
            }
            column(VacancyAnnouncementID; "Vacancy Announcement ID")
            {
            }
            column(DatePublished; "Date Published")
            {
            }
            column(ApplicationClosingDate; "Application Closing Date")
            {
            }
            column(ApplicationClosingTime; "Application Closing Time")
            {
            }
            column(NoofApplications; "No. of Applications")
            {
            }
            column(NoofFilledPosts; "No of Filled Posts")
            {
            }
            column(JobTitleDesignation; "Job Title/Designation")
            {
            }
            column(DutyStationID; "Duty Station ID")
            {
            }
            column(WorkLocationDetails; "Work Location Details")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(Published; Published)
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(VacancyCreated; "Vacancy Created")
            {
            }
            column(RequisitionID; "Requisition ID")
            {
            }
            column(PositionCategory; "Position Category")
            {
            }
            column(ContractType; "Contract Type")
            {
            }
            column(Budget; Budget)
            {
            }
            column(ContractType2; "Contract Type2")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }


            trigger OnAfterGetRecord()
            begin


                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 69619);
                ApprovalEntries.SetRange("Document No.", "Document No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        Compinfo.Get();
        Compinfo.CalcFields(Compinfo.Picture);
    end;

    var
        Compinfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;

}

