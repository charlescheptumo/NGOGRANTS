report 57004 "Imprest Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Requisition3.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem(Payments; Payments)
        {
            DataItemTableView = WHERE("Payment Type" = CONST(Imprest));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.", Date, "Cheque No", "Bank Code", Payee;
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(VoteItem_Payments; Payments."Vote Item")
            {
            }
            column(VoteAmount_Payments; Payments."Vote Amount")
            {
            }
            column(Commitments_Payments; Payments.Commitments)
            {
            }
            column(ActualAmount_Payments; Payments."Actual Amount")
            {
            }
            column(AvailableAmount_Payments; Payments."Available Amount")
            {
            }
            column(No_Payments; Payments."No.")
            {
            }
            column(DestinationName_Payments; Payments."Destination Name")
            {
            }
            column(Date_Payments; Format(Payments.Date, 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(PaymentsNarration; Payments."Payment Narration")
            {
            }
            column(Type_Payments; Payments.Type)
            {
            }
            column(JobNo_Payments; Payments.Project)
            {
            }
            column(JobDescription_Payments; Payments."Project Description")
            {
            }
            column(ImprestMemoNo_Payments; Payments."Imprest Memo No")
            {
            }
            column(BankName_Payments; Payments."Bank Name")
            {
            }
            column(PayMode_Payments; Payments."Pay Mode")
            {
            }
            column(ChequeNo_Payments; Payments."Cheque No")
            {
            }
            column(ChequeDate_Payments; Payments."Cheque Date")
            {
            }
            column(BankCode_Payments; Payments."Bank Code")
            {
            }
            column(Payee_Payments; Payments.Payee)
            {
            }
            column(Onbehalfof_Payments; Payments."On behalf of")
            {
            }
            column(CreatedBy_Payments; Payments."Created By")
            {
            }
            column(Posted_Payments; Payments.Posted)
            {
            }
            column(PostedBy_Payments; Payments."Posted By")
            {
            }
            column(PostedDate_Payments; Payments."Posted Date")
            {
            }
            column(GlobalDimension1Code_Payments; Payments."Shortcut Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Payments; Payments."Shortcut Dimension 2 Code")
            {
            }
            column(GlobalDimension3Code_Payments; Payments."Shortcut Dimension 3 Code")
            {
            }
            column(TimePosted_Payments; Payments."Time Posted")
            {
            }
            column(TotalAmount_Payments; Payments."Total Amount LCY")
            {
            }
            column(PayingBankAccount_Payments; Payments."Paying Bank Account")
            {
            }
            column(Status_Payments; Payments.Status)
            {
            }
            column(PaymentType_Payments; Payments."Payment Type")
            {
            }
            column(Currency_Payments; Payments."Currency Code")
            {
            }
            column(NoSeries_Payments; Payments."No. Series")
            {
            }
            column(AccountType_Payments; Payments."Account Type")
            {
            }
            column(AccountNo_Payments; Payments."Account No.")
            {
            }
            column(AccountName_Payments; Payments."Account Name")
            {
            }
            column(ImprestAmount_Payments; Payments."Imprest Amount")
            {
            }
            column(ImprestBankAccountNo_Payments; Payments."Imprest Bank Account Number")
            {
            }
            column(ImprestBankName_Payments; Payments."Imprest Bank Name")
            {
            }
            column(PaymentNarration_Payments; Payments."Payment Narration")
            {
            }
            column(ImprestBankBranchName_Payments; Payments."Imprest Bank Branch Name")
            {
            }
            column(Surrendered_Payments; Payments.Surrendered)
            {
            }
            column(AppliesToDocNo_Payments; Payments."Applies- To Doc No.")
            {
            }
            column(PettyCashAmount_Payments; Payments."Petty Cash Amount")
            {
            }
            column(OriginalDocument_Payments; Payments."Original Document")
            {
            }
            column(PVCreationDateTime_Payments; Payments."PV Creation DateTime")
            {
            }
            column(PVCreatorID_Payments; Payments."PV Creator ID")
            {
            }
            column(RemainingAmount_Payments; Payments."Remaining Amount")
            {
            }
            column(ReceiptCreated_Payments; Payments."Receipt Created")
            {
            }
            column(ImprestDeadline_Payments; Payments."Imprest Deadline")
            {
            }
            column(ImprestSurrenderDate_Payments; Payments."Surrender Date")
            {
            }
            column(DateFilter_Payments; Payments."Date Filter")
            {
            }
            column(ImprestType_Payments; Payments."Imprest Type")
            {
            }
            column(ProjectBudget_Payments; Payments."Project Budget")
            {
            }
            column(UsageCosts_Payments; Payments."Actual Project Costs")
            {
            }
            column(TotalCommitments_Payments; Payments."Total Budget Commitments")
            {
            }
            column(AvailableFunds_Payments; Payments."Available Funds")
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
            column(DateApproved; ApproverDate[2])
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
            column(Approved_By; usersetup4."Employee Name")
            {
            }
            column(DateApprove; ApproverDate[5])
            {
            }
            column(Signature; usersetup4.Picture)
            {
            }
            column(Number_In_Words; NumberText[1])
            {
            }
            column(JobGroup_Payments; Payments."Job Group")
            {
            }
            column(OnBehalf_Payments; Payments."On behalf of")
            {
            }
            column(ImprestTotalAmount_Payments; "Imprest Total Amount")
            {
            }
            column(strCopyText; strCopyText)
            {
            }
            dataitem("Imprest Lines"; "Imprest Lines")
            {
                DataItemLink = No = FIELD("No.");
                DataItemTableView = SORTING(No, "Line No");
                column(No_ImprestLines; "Imprest Lines".No)
                {
                }
                column(LineNo_ImprestLines; "Imprest Lines"."Line No")
                {
                }
                column(AccountType_ImprestLines; "Imprest Lines"."Account Type")
                {
                }
                column(AccountNo_ImprestLines; "Imprest Lines"."Account No.")
                {
                }
                column(AccountName_ImprestLines; "Imprest Lines"."Account Name")
                {
                }
                column(Description_ImprestLines; "Imprest Lines".Description)
                {
                }
                column(StartDate_ImprestLines; "Imprest Lines"."Start Date")
                {
                }
                column(EndDate_ImprestLines; "Imprest Lines"."End Date")
                {
                }
                column(CountryCode_ImprestLines; "Imprest Lines"."Country Code")
                {
                }
                column(Amount_ImprestLines; "Imprest Lines".Amount)
                {
                }
                column(ReceiptNo_ImprestLines; "Imprest Lines"."Receipt No.")
                {
                }
                column(ReceiptAmount_ImprestLines; "Imprest Lines"."Cash Receipt Amount")
                {
                }
                column(AppliestoDocNo_ImprestLines; "Imprest Lines"."Applies- to Doc. No.")
                {
                }
                column(GlobalDimension1Code_ImprestLines; "Imprest Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ImprestLines; "Imprest Lines"."Global Dimension 2 Code")
                {
                }
                column(ActualSpent_ImprestLines; "Imprest Lines"."Actual Spent")
                {
                }
                column(RemainingAmount_ImprestLines; "Imprest Lines"."Remaining Amount")
                {
                }
                column(Committed_ImprestLines; "Imprest Lines".Committed)
                {
                }
                column(AdvanceType_ImprestLines; "Imprest Lines"."Advance Type")
                {
                }
                column(CurrencyCode_ImprestLines; "Imprest Lines"."Currency Code")
                {
                }
                column(CurrencyFactor_ImprestLines; "Imprest Lines"."Currency Factor")
                {
                }
                column(AmountLCY_ImprestLines; "Imprest Lines"."Amount LCY")
                {
                }
                column(ExpenseType_ImprestLines; "Imprest Lines"."Expense Type")
                {
                }
                column(WorkType_ImprestLines; "Imprest Lines"."Work Type")
                {
                }
                column(ResourceNo_ImprestLines; "Imprest Lines"."Resource No.")
                {
                }
                column(TaskNo_ImprestLines; "Imprest Lines"."Task No.")
                {
                }
                column(JobTaskDescription_ImprestLines; "Imprest Lines"."Job Task Description")
                {
                }
                column(Project_ImprestLines; "Imprest Lines".Project)
                {
                }
                column(DueDate_ImprestLines; "Imprest Lines"."Due Date")
                {
                }
                column(ImprestHolder_ImprestLines; "Imprest Lines"."Imprest Holder")
                {
                }
                column(JobNo_ImprestLines; "Imprest Lines"."Job No.")
                {
                }
                column(Purpose_ImprestLines; "Imprest Lines".Purpose)
                {
                }
                column(BudgetaryControlAC_ImprestLines; "Imprest Lines"."Budgetary Control A/C")
                {
                }
                column(Destination_ImprestLines; "Imprest Lines".Destination)
                {
                }
                column(DailyRate_ImprestLines; "Imprest Lines"."Daily Rate")
                {
                }
                column(NoofDays_ImprestLines; "Imprest Lines"."No. of Days")
                {
                }
                column(Subsistence_ImprestLines; "Imprest Lines".Subsistence)
                {
                }
                column(JobTaskNo_ImprestLines; "Imprest Lines"."Job Task No.")
                {
                }
                column(JobQuantity_ImprestLines; "Imprest Lines"."Job Quantity")
                {
                }
                column(Status_ImprestLines; "Imprest Lines".Status)
                {
                }
            }
            dataitem("Imprest AirFares Lines"; "Imprest Lines AirFares")
            {
                DataItemLink = No = FIELD("No.");
                DataItemTableView = SORTING(No, "Line No");
                column(No_ImprestAirFaresLines; "Imprest AirFares Lines".No)
                {
                }
                column(LineNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Line No")
                {
                }
                column(AccountType_ImprestAirFaresLines; "Imprest AirFares Lines"."Account Type")
                {
                }
                column(AccountNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Account No.")
                {
                }
                column(AccountName_ImprestAirFaresLines; "Imprest AirFares Lines"."Account Name")
                {
                }
                column(Description_ImprestAirFaresLines; "Imprest AirFares Lines".Description)
                {
                }
                column(StartDate_ImprestAirFaresLines; "Imprest AirFares Lines"."Start Date")
                {
                }
                column(EndDate_ImprestAirFaresLines; "Imprest AirFares Lines"."End Date")
                {
                }
                column(CountryCode_ImprestAirFaresLines; "Imprest AirFares Lines"."Country Code")
                {
                }
                column(Amount_ImprestAirFaresLines; "Imprest AirFares Lines".Amount)
                {
                }
                column(AppliestoDocNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Applies- to Doc. No.")
                {
                }
                column(GlobalDimension1Code_ImprestAirFaresLines; "Imprest AirFares Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ImprestAirFaresLines; "Imprest AirFares Lines"."Global Dimension 2 Code")
                {
                }
                column(ActualSpent_ImprestAirFaresLines; "Imprest AirFares Lines"."Actual Spent")
                {
                }
                column(ReceiptNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Receipt No.")
                {
                }
                column(ReceiptAmount_ImprestAirFaresLines; "Imprest AirFares Lines"."Cash Receipt Amount")
                {
                }
                column(RemainingAmount_ImprestAirFaresLines; "Imprest AirFares Lines"."Remaining Amount")
                {
                }
                column(Committed_ImprestAirFaresLines; "Imprest AirFares Lines".Committed)
                {
                }
                column(AdvanceType_ImprestAirFaresLines; "Imprest AirFares Lines"."Advance Type")
                {
                }
                column(CurrencyCode_ImprestAirFaresLines; "Imprest AirFares Lines"."Currency Code")
                {
                }
                column(CurrencyFactor_ImprestAirFaresLines; "Imprest AirFares Lines"."Currency Factor")
                {
                }
                column(AmountLCY_ImprestAirFaresLines; "Imprest AirFares Lines"."Amount LCY")
                {
                }
                column(ExpenseType_ImprestAirFaresLines; "Imprest AirFares Lines"."Expense Type")
                {
                }
                column(WorkType_ImprestAirFaresLines; "Imprest AirFares Lines"."Work Type")
                {
                }
                column(ResourceNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Resource No.")
                {
                }
                column(TaskNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Task No.")
                {
                }
                column(Project_ImprestAirFaresLines; "Imprest AirFares Lines".Project)
                {
                }
                column(DueDate_ImprestAirFaresLines; "Imprest AirFares Lines"."Due Date")
                {
                }
                column(ImprestHolder_ImprestAirFaresLines; "Imprest AirFares Lines"."Imprest Holder")
                {
                }
                column(JobNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Job No.")
                {
                }
                column(Purpose_ImprestAirFaresLines; "Imprest AirFares Lines".Purpose)
                {
                }
                column(BudgetaryControlAC_ImprestAirFaresLines; "Imprest AirFares Lines"."Budgetary Control A/C")
                {
                }
                column(Destination_ImprestAirFaresLines; "Imprest AirFares Lines".Destination)
                {
                }
                column(DailyRate_ImprestAirFaresLines; "Imprest AirFares Lines"."Daily Rate")
                {
                }
                column(NoofDays_ImprestAirFaresLines; "Imprest AirFares Lines"."No. of Days")
                {
                }
                column(Subsistence_ImprestAirFaresLines; "Imprest AirFares Lines".Subsistence)
                {
                }
                column(JobTaskNo_ImprestAirFaresLines; "Imprest AirFares Lines"."Job Task No.")
                {
                }
                column(JobQuantity_ImprestAirFaresLines; "Imprest AirFares Lines"."Job Quantity")
                {
                }
                column(Status_ImprestAirFaresLines; "Imprest AirFares Lines".Status)
                {
                }
            }
            dataitem("Imprest Conf Lines"; "Imprest Lines Conf")
            {
                DataItemLink = No = FIELD("No.");
                DataItemTableView = SORTING(No, "Line No");
                column(No_ImprestConfLines; "Imprest Conf Lines".No)
                {
                }
                column(LineNo_ImprestConfLines; "Imprest Conf Lines"."Line No")
                {
                }
                column(AccountType_ImprestConfLines; "Imprest Conf Lines"."Account Type")
                {
                }
                column(AccountNo_ImprestConfLines; "Imprest Conf Lines"."Account No.")
                {
                }
                column(AccountName_ImprestConfLines; "Imprest Conf Lines"."Account Name")
                {
                }
                column(Description_ImprestConfLines; "Imprest Conf Lines".Description)
                {
                }
                column(Amount_ImprestConfLines; "Imprest Conf Lines".Amount)
                {
                }
                column(AppliestoDocNo_ImprestConfLines; "Imprest Conf Lines"."Applies- to Doc. No.")
                {
                }
                column(StartDate_ImprestConfLines; "Imprest Conf Lines"."Start Date")
                {
                }
                column(EndDate_ImprestConfLines; "Imprest Conf Lines"."End Date")
                {
                }
                column(CountryCode_ImprestConfLines; "Imprest Conf Lines"."Country Code")
                {
                }
                column(GlobalDimension1Code_ImprestConfLines; "Imprest Conf Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ImprestConfLines; "Imprest Conf Lines"."Global Dimension 2 Code")
                {
                }
                column(ActualSpent_ImprestConfLines; "Imprest Conf Lines"."Actual Spent")
                {
                }
                column(ReceiptNo_ImprestConfLines; "Imprest Conf Lines"."Receipt No.")
                {
                }
                column(ReceiptAmount_ImprestConfLines; "Imprest Conf Lines"."Cash Receipt Amount")
                {
                }
                column(RemainingAmount_ImprestConfLines; "Imprest Conf Lines"."Remaining Amount")
                {
                }
                column(Committed_ImprestConfLines; "Imprest Conf Lines".Committed)
                {
                }
                column(AdvanceType_ImprestConfLines; "Imprest Conf Lines"."Advance Type")
                {
                }
                column(CurrencyCode_ImprestConfLines; "Imprest Conf Lines"."Currency Code")
                {
                }
                column(CurrencyFactor_ImprestConfLines; "Imprest Conf Lines"."Currency Factor")
                {
                }
                column(AmountLCY_ImprestConfLines; "Imprest Conf Lines"."Amount LCY")
                {
                }
                column(ExpenseType_ImprestConfLines; "Imprest Conf Lines"."Expense Type")
                {
                }
                column(WorkType_ImprestConfLines; "Imprest Conf Lines"."Work Type")
                {
                }
                column(ResourceNo_ImprestConfLines; "Imprest Conf Lines"."Resource No.")
                {
                }
                column(TaskNo_ImprestConfLines; "Imprest Conf Lines"."Task No.")
                {
                }
                column(Project_ImprestConfLines; "Imprest Conf Lines".Project)
                {
                }
                column(DueDate_ImprestConfLines; "Imprest Conf Lines"."Due Date")
                {
                }
                column(ImprestHolder_ImprestConfLines; "Imprest Conf Lines"."Imprest Holder")
                {
                }
                column(JobNo_ImprestConfLines; "Imprest Conf Lines"."Job No.")
                {
                }
                column(Purpose_ImprestConfLines; "Imprest Conf Lines".Purpose)
                {
                }
                column(BudgetaryControlAC_ImprestConfLines; "Imprest Conf Lines"."Budgetary Control A/C")
                {
                }
                column(Destination_ImprestConfLines; "Imprest Conf Lines".Destination)
                {
                }
                column(DailyRate_ImprestConfLines; "Imprest Conf Lines"."Daily Rate")
                {
                }
                column(NoofDays_ImprestConfLines; "Imprest Conf Lines"."No. of Days")
                {
                }
                column(Subsistence_ImprestConfLines; "Imprest Conf Lines".Subsistence)
                {
                }
                column(JobTaskNo_ImprestConfLines; "Imprest Conf Lines"."Job Task No.")
                {
                }
                column(JobQuantity_ImprestConfLines; "Imprest Conf Lines"."Job Quantity")
                {
                }
                column(Status_ImprestConfLines; "Imprest Conf Lines".Status)
                {
                }
            }
            dataitem("Imprest Comms Lines"; "Imprest Lines Comms")
            {
                DataItemLink = No = FIELD("No.");
                DataItemTableView = SORTING(No, "Line No");
                column(No_ImprestCommsLines; "Imprest Comms Lines".No)
                {
                }
                column(LineNo_ImprestCommsLines; "Imprest Comms Lines"."Line No")
                {
                }
                column(AccountType_ImprestCommsLines; "Imprest Comms Lines"."Account Type")
                {
                }
                column(AccountNo_ImprestCommsLines; "Imprest Comms Lines"."Account No.")
                {
                }
                column(AccountName_ImprestCommsLines; "Imprest Comms Lines"."Account Name")
                {
                }
                column(Description_ImprestCommsLines; "Imprest Comms Lines".Description)
                {
                }
                column(Amount_ImprestCommsLines; "Imprest Comms Lines".Amount)
                {
                }
                column(StartDate_ImprestCommsLines; "Imprest Comms Lines"."Start Date")
                {
                }
                column(EndDate_ImprestCommsLines; "Imprest Comms Lines"."End Date")
                {
                }
                column(CountryCode_ImprestCommsLines; "Imprest Comms Lines"."Country Code")
                {
                }
                column(AppliestoDocNo_ImprestCommsLines; "Imprest Comms Lines"."Applies- to Doc. No.")
                {
                }
                column(ReceiptNo_ImprestCommsLines; "Imprest Comms Lines"."Receipt No.")
                {
                }
                column(GlobalDimension1Code_ImprestCommsLines; "Imprest Comms Lines"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ImprestCommsLines; "Imprest Comms Lines"."Global Dimension 2 Code")
                {
                }
                column(ActualSpent_ImprestCommsLines; "Imprest Comms Lines"."Actual Spent")
                {
                }
                column(ReceiptAmount_ImprestCommsLines; "Imprest Comms Lines"."Cash Receipt Amount")
                {
                }
                column(RemainingAmount_ImprestCommsLines; "Imprest Comms Lines"."Remaining Amount")
                {
                }
                column(Committed_ImprestCommsLines; "Imprest Comms Lines".Committed)
                {
                }
                column(AdvanceType_ImprestCommsLines; "Imprest Comms Lines"."Advance Type")
                {
                }
                column(CurrencyCode_ImprestCommsLines; "Imprest Comms Lines"."Currency Code")
                {
                }
                column(CurrencyFactor_ImprestCommsLines; "Imprest Comms Lines"."Currency Factor")
                {
                }
                column(AmountLCY_ImprestCommsLines; "Imprest Comms Lines"."Amount LCY")
                {
                }
                column(ExpenseType_ImprestCommsLines; "Imprest Comms Lines"."Expense Type")
                {
                }
                column(WorkType_ImprestCommsLines; "Imprest Comms Lines"."Work Type")
                {
                }
                column(ResourceNo_ImprestCommsLines; "Imprest Comms Lines"."Resource No.")
                {
                }
                column(TaskNo_ImprestCommsLines; "Imprest Comms Lines"."Task No.")
                {
                }
                column(Project_ImprestCommsLines; "Imprest Comms Lines".Project)
                {
                }
                column(DueDate_ImprestCommsLines; "Imprest Comms Lines"."Due Date")
                {
                }
                column(ImprestHolder_ImprestCommsLines; "Imprest Comms Lines"."Imprest Holder")
                {
                }
                column(JobNo_ImprestCommsLines; "Imprest Comms Lines"."Job No.")
                {
                }
                column(Purpose_ImprestCommsLines; "Imprest Comms Lines".Purpose)
                {
                }
                column(BudgetaryControlAC_ImprestCommsLines; "Imprest Comms Lines"."Budgetary Control A/C")
                {
                }
                column(Destination_ImprestCommsLines; "Imprest Comms Lines".Destination)
                {
                }
                column(DailyRate_ImprestCommsLines; "Imprest Comms Lines"."Daily Rate")
                {
                }
                column(NoofDays_ImprestCommsLines; "Imprest Comms Lines"."No. of Days")
                {
                }
                column(Subsistence_ImprestCommsLines; "Imprest Comms Lines".Subsistence)
                {
                }
                column(JobTaskNo_ImprestCommsLines; "Imprest Comms Lines"."Job Task No.")
                {
                }
                column(JobQuantity_ImprestCommsLines; "Imprest Comms Lines"."Job Quantity")
                {
                }
                column(Status_ImprestCommsLines; "Imprest Comms Lines".Status)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin

                PaymentMgt.InitTextVariable;
                // PaymentMgt.FormatNoText(NumberText, "Imprest Amount", CurrencyCodeText);
                PaymentMgt.FormatNoText(NumberText, "Imprest Total Amount", CurrencyCodeText);

                //daudi
                if Payments."No. Printed" = 0 then
                    strCopyText := 'ORIGINAL'
                else
                    if Payments."No. Printed" = 1 then
                        strCopyText := 'DUPLICATE'
                    else
                        if Payments."No. Printed" > 2 then
                            strCopyText := 'TRIPLICATE';

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 57000);
                ApprovalEntries.SetRange("Document No.", Payments."No.");
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
                        if i = 4 then begin
                            Approver[5] := ApprovalEntries."Approver ID";
                            ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                            if usersetup4.Get(Approver[5]) then
                                usersetup4.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;

                if "Currency Code" = '' then
                    "Currency Code" := 'USD';

            end;

            trigger OnPostDataItem()
            begin
                if CurrReport.Preview = false then begin
                    Payments."No. Printed" := Payments."No. Printed" + 1;
                    Payments.Modify;
                    Message('%1', Payments."No. Printed")
                end;
            end;

            trigger OnPreDataItem()
            begin
                Payments.CalcFields(Payments."Bank Name", Payments."Project Description", Payments."Imprest Amount");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        TTotal: Decimal;
        PaymentMgt: Codeunit "Payments-Post";
        CurrencyCodeText: Code[10];
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        strCopyText: Text;
        PaymentsAtt: Record Payments;
        SharePoint: Record "Sharepoint File List";
        usersetup4: Record "User Setup";
}

