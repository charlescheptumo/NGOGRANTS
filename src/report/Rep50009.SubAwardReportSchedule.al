report 50009 "Sub Award Report Schedule"
{
    ApplicationArea = All;
    Caption = 'Sub Award Report Schedule Job';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {


            trigger OnPreDataItem()
            begin
                Integer.SetRange(Number, 1);
            end;

            trigger OnAfterGetRecord()
            var
                GrantsSet: Record "Grants Setup";
            begin
                GrantsSet.Get();
                SubAwardRepSche.Reset();
                SubAwardRepSche.SetRange(Notified, false);
                SubAwardRepSche.SetFilter("Due Date to Report", '<=%1', CalcDate(GrantsSet."Reporting Schedule Period", Today));
                if SubAwardRepSche.FindSet() then begin
                    if Ven.get(SubAwardRepSche."Sub Award No") then
                        if Ven."E-Mail" = '' then
                            Error('Please add an email for the Implementing Partner %1', Ven.Name);

                    Clear(ToRecipients);
                    Clear(CC);
                    Clear(BCC);
                    Recepient := Ven."E-mail";
                    ToRecipients.Add(Recepient);
                    // CC.Add('vkubende@aphf.africa');
                    // CC.Add('cmulei@aphf.africa');
                    CC.Add('robertwachira@dynasoft.co.ke');
                    CC.Add('johnkipkirui@dynasoft.co.ke');

                    Subject := 'Report Due for Submission Reminder';
                    Body := 'Dear Sir/Madam' + ',<br>';
                    // Body += '<br> This is a reminder to kindly upload the reports due for submission in ' + Format(GrantsSet."Reporting Schedule Period");
                    Body += '<br> This is a reminder to kindly upload the reports due for submission in 7 Days.';
                    Body += '<br> <br> Kind Regards, <br>';
                    Body += 'Grants Management Department. <br>';
                    Body += 'Africa Public Health Foundation.';

                    // EmailMessage.Create(Recepient, Subject, Body, true);

                    EmailMessage.Create(ToRecipients, Subject, Body, true, CC, BCC);

                    Email.Send(EmailMessage, "Email Scenario"::"Implementing Partner Reminder");
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
        i: Integer;
        NoOfDays: Integer;
        ReportingDate: Date;
        GrantsSet: Record "Grants Setup";
        SubAwardRepSche: Record "Sub Award Reporting Schedule";
        Email: Codeunit Email;
        EmailScen: Codeunit "Email Scenario";
        EmailMessage: Codeunit "Email Message";
        Recepient: Text[100];
        Subject: Text;
        Body: Text;
        Ven: Record Vendor;
        ToRecipients: List of [Text];
        BCC: List of [Text];
        CC: List of [Text];

}
