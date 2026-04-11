report 50018 "Grant Closeout Report"
{
    ApplicationArea = All;
    Caption = 'Grant Closeout Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = Word;
    WordLayout = './Layouts/Grant Closeout.docx';
    dataset
    {
        dataitem(SubAward; "Sub Award")
        {
            column(ApprovedAmountLCY; "Approved Amount(LCY)")
            {
            }
            column(PFCNo; "PFC No")
            {
            }
            column(SubAwardeeName; "Sub Awardee Name")
            {
            }
            column(SubawardEndDate; Format("Sub-award End Date", 0, 4))
            {
            }
            column(ProjectTitle; "Project Title")
            {
            }
            column(PhysicalAddress; "Physical Address")
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
            column(ActualSpent; ActualSpent)
            {

            }
            column(Balance; Balance)
            {

            }
            column(Contact; Contact)
            {

            }
            column(ActualSpent_SubAward; "Actual Spent")
            {
            }
            column(DeObligatedFunds_SubAward; "DeObligated Funds")
            {
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
                    //Donor := GrantFundingApp."Grantor Name";
                end;
                if Cust.Get("Sub Awardee No") then
                    Contact := Cust.Contact;
                Gen.Get();
                if "Currency Code" = '' then
                    "Currency Code" := Gen."LCY Code";
                Balance := 0;
                ContLines.Reset();
                ContLines.SetRange("Project Contract No.", "PFC No");
                ContLines.SetRange("Job Status", ContLines."Job Status"::Open);
                if ContLines.FindFirst() then begin
                    Job.Reset();
                    Job.SetRange("Year Code", ContLines."Year Code");
                    Job.SetRange("Project Funding Contract No", ContLines."Project Contract No.");
                    if FindFirst() then begin
                        JobGL.Reset();
                        JobGL.SetRange("Job No.", Job."No.");
                        if JobGL.FindSet() then begin
                            JobGL.CalcFields("Total Cost (LCY)");
                            ActualSpent := 0;
                            repeat
                                ActualSpent += JobGL."Total Cost (LCY)";
                            until JobGL.Next() = 0;
                            Balance := "Approved Amount(LCY)" - ActualSpent;
                        end;
                    end;
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
        ContLines: Record "Contract Funding Lines";
        Job: Record Job;
        JPLines: Record "Job Planning Line";
        JobGL: Record "Job Ledger Entry";
        ActualSpent: Decimal;
        Balance: Decimal;
        Contact: Text[100];

}
