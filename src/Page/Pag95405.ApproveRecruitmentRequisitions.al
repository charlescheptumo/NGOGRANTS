page 95405 ApproveRecruitmentRequisitions
{
    ApplicationArea = All;
    Caption = 'Approved Recruitment Requisitions';
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    CardPageId = ApprovedRecruitmentRequisition;
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"), "Approval Status" = filter(Approved));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ToolTip = 'Specifies the value of the Recruitment Plan ID field.';
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ToolTip = 'Specifies the value of the Recruitment Plan Type field.';
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ToolTip = 'Specifies the value of the Position ID field.';
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
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
                field(Directorate; Rec.Directorate)
                {
                    ToolTip = 'Specifies the value of the Directorate field.';
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                    ApplicationArea = Basic;
                }
                field(Region; Rec.Region)
                {
                    ToolTip = 'Specifies the value of the Region field.';
                    ApplicationArea = Basic;
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ToolTip = 'Specifies the value of the Finacial Year Code field.';
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ToolTip = 'Specifies the value of the Approval Status field.';
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ToolTip = 'Specifies the value of the Created On field.';
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ToolTip = 'Specifies the value of the Created Time field.';
                    ApplicationArea = Basic;
                }
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
                field("No of Openings"; Rec."No of Openings")
                {
                    ToolTip = 'Specifies the value of the No of Openings field.';
                    ApplicationArea = Basic;
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
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                    ApplicationArea = Basic;
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
                field("Estimate Annual Salary"; Rec."Estimate Annual Salary")
                {
                    ToolTip = 'Specifies the value of the Estimate Annual Salary field.';
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
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                    ApplicationArea = Basic;
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ToolTip = 'Specifies the value of the Overall Appointment Authority field.';
                    ApplicationArea = Basic;
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
                }
                field("Vacancy No"; Rec."Vacancy No")
                {
                    ToolTip = 'Specifies the value of the Vacancy No field.';
                    ApplicationArea = Basic;
                }
                field("Vacancy Status"; Rec."Vacancy Status")
                {
                    ToolTip = 'Specifies the value of the Vacancy Status field.';
                    ApplicationArea = Basic;
                }
                field("Vacancy Announcement ID"; Rec."Vacancy Announcement ID")
                {
                    ToolTip = 'Specifies the value of the Vacancy Announcement ID field.';
                    ApplicationArea = Basic;
                }
                field("Date Published"; Rec."Date Published")
                {
                    ToolTip = 'Specifies the value of the Date Published field.';
                    ApplicationArea = Basic;
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                    ApplicationArea = Basic;
                }
                field("Application Closing Time"; Rec."Application Closing Time")
                {
                    ToolTip = 'Specifies the value of the Application Closing Time field.';
                    ApplicationArea = Basic;
                }
                field("No. of Applications"; Rec."No. of Applications")
                {
                    ToolTip = 'Specifies the value of the No. of Applications field.';
                    ApplicationArea = Basic;
                }
                field("No of Filled Posts"; Rec."No of Filled Posts")
                {
                    ToolTip = 'Specifies the value of the No of Filled Posts field.';
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                    ApplicationArea = Basic;
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                    ApplicationArea = Basic;
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ToolTip = 'Specifies the value of the Work Location Details field.';
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ToolTip = 'Specifies the value of the Published field.';
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                    ApplicationArea = Basic;
                }
                field("Vacancy Created"; Rec."Vacancy Created")
                {
                    ToolTip = 'Specifies the value of the Vacancy Created field.';
                    ApplicationArea = Basic;
                }
                field("Requisition ID"; Rec."Requisition ID")
                {
                    ToolTip = 'Specifies the value of the Requisition ID field.';
                    ApplicationArea = Basic;
                }
                field("Position Category"; Rec."Position Category")
                {
                    ToolTip = 'Specifies the value of the Position Category field.';
                    ApplicationArea = Basic;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ToolTip = 'Specifies the value of the Contract Type field.';
                    ApplicationArea = Basic;
                }
                field(Budget; Rec.Budget)
                {
                    ToolTip = 'Specifies the value of the Budget field.';
                    ApplicationArea = Basic;
                }
                field("Contract Type2"; Rec."Contract Type2")
                {
                    ToolTip = 'Specifies the value of the Contract Type2 field.';
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
