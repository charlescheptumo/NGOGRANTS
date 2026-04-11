report 50005 "Sub Grant Agreement"
{
    ApplicationArea = All;
    Caption = 'Sub Grant Agreement';
    DefaultLayout = Word;
    WordLayout = './Layouts/Sub Grant Agreement.docx';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(SubAward; "Sub Award")
        {
            RequestFilterFields = No;
            column(ApprovedAmount; "Approved Amount")
            {
            }
            column(ApprovedAmountLCY; "Approved Amount(LCY)")
            {
            }
            column(ApprovedBy; "Approved By")
            {
            }
            column(ApprovedOn; "Approved On")
            {
            }
            column(BudgetCeiling; "Budget Ceiling")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(Createdby; "Created by")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(CurrencyFactor; "Currency Factor")
            {
            }
            column(DocumentStatus; "Document Status")
            {
            }
            column(GFA; GFA)
            {
            }
            column(Goal; Goal)
            {
            }
            column(MainAward; "Main Award")
            {
            }
            column(MainAwardEndDate; "Main Award End Date")
            {
            }
            column(MainAwardObjective; "Main Award Objective")
            {
            }
            column(MainAwardProgram; "Main Award Program")
            {
            }
            column(MainAwardStartDate; "Main Award Start Date")
            {
            }
            column(No; No)
            {
            }
            column(Noseries; "No series")
            {
            }
            column(PFCNo; "PFC No")
            {
            }
            column(PhysicalAddress; "Physical Address")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(Status; Status)
            {
            }
            column(Street; Street)
            {
            }
            column(SubAwardeeName; "Sub Awardee Name")
            {
            }
            column(SubAwardeeNo; "Sub Awardee No")
            {
            }
            column(SubawardEndDate; Format("Sub-award End Date", 0, 4))
            {
            }
            column(SubawardStartDate; Format("Sub-award Start Date", 0, 4))
            {
            }
            column(Picture; CompInfo.Picture)
            {

            }
            column(CompAdress; CompInfo.Address)
            {

            }
            column(CompWebsite; CompInfo."Home Page")
            {

            }
            column(Donor; Donor)
            {

            }
            column(Project_Title; "Project Title")
            {

            }
            column(Location; Location)
            {

            }
            column(Objective; Objective)
            {

            }
            column(Email; Email)
            {

            }
            dataitem("Sub Award Reporting Schedule"; "Sub Award Reporting Schedule")
            {
                DataItemLinkReference = SubAward;
                DataItemLink = "Sub Award No" = field(No);
                column(Report_Type_Detailed; "Report Type Detailed")
                {

                }
                column(Reporting_Period; "Reporting Period")
                {

                }
                column(Report_Due_Date_Narration; "Report Due Date Narration")
                {

                }
            }
            dataitem("Sub Award Objectives"; "Sub Award Objectives")
            {
                DataItemLinkReference = SubAward;
                DataItemLink = "Sub Award No" = field(No);

                column(LineNo_SubAwardObjectives; "Line No")
                {
                }
                column(Objectives_SubAwardObjectives; Objectives)
                {
                }
            }
            dataitem(Customer; Customer)
            {
                DataItemLinkReference = SubAward;
                DataItemLink = "No." = field("Sub Awardee No");
                column(BankName_Customer; "Bank Name")
                {
                }
                column(BankAccountNumber_Customer; "Bank Account Number")
                {
                }
                column(Swift_Code; "Swift Code")
                {

                }
            }
            dataitem("Sub Award Milestones"; "Sub Award Milestones")
            {
                DataItemLinkReference = SubAward;
                DataItemLink = "Sub Award No" = field(No);
                column(MilestoneDescription_SubAwardMilestones; "Milestone Description")
                {
                }
                column(Disbursement; Disbursement)
                {

                }
                column(Payment_tranche; "Payment tranche")
                {

                }
            }
            trigger OnPreDataItem()
            begin
                CompInfo.Get();
            end;

            trigger OnAfterGetRecord()
            var
                Curr: Record Currency;
                Gen: Record "General Ledger Setup";
            begin
                if GrantFundingApp.Get(GFA) then begin
                    // Donor := GrantFundingApp."Grantor Name";
                end;
                Objective := '';
                SubObjectives.Reset();
                SubObjectives.SetRange("Sub Award No", No);
                if SubObjectives.FindSet() then
                    repeat
                        if Objective <> '' then
                            Objective += ' and ';
                        Objective += SubObjectives.Objectives;
                    until SubObjectives.Next() = 0;
                Gen.Get();
                if "Currency Code" = '' then
                    "Currency Code" := Gen."LCY Code";
                begin
                    if Impl.Get("Sub Awardee No") then begin
                        Email := Impl."E-Mail";
                    end
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
    var
        CompInfo: Record "Company Information";
        GrantFundingApp: Record Opportunity;
        Donor: Text[150];
        Objective: Text;
        SubObjectives: Record "Sub Award Objectives";
        Cust: Record Customer;
        Impl: Record Vendor;
        Email: Text[80];

}
