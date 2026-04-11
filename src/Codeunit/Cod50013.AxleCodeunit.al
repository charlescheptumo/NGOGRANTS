#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50013 "AxleCodeunit"
{

    procedure FnNotifyTenderRegrets(BidTabulation: Record "Bid Tabulation Header")
    var
        HRSetup: Record "Company Information";
        vend: Record Vendor;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        emailhdr: Text[100];
        FileName: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        Scenario: Enum "Email Scenario";
        ToRecipients: List of [Text];
        BCC: List of [Text];
        CC: List of [Text];
        BidTabulationLine: Record "Bid Tabulation Line";
        BidLines: Record "Bid Tabulation Line";
        Ins: InStream;
        Os: OutStream;
        Temp: Codeunit "Temp Blob";
        Emprecref: RecordRef;
    begin
        BidTabulationLine.Reset;
        BidTabulationLine.SetRange("Tabulation ID", BidTabulation.Code);
        BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Unsuccesful);
        if BidTabulationLine.FindSet then begin
            Emprecref.Open(Database::"Bid Tabulation Line");
            repeat
                vend.Reset;
                vend.SetRange("No.", BidTabulation."Awarded Bidder No.");
                if vend.FindSet then begin
                    HRSetup.Get;
                    PPayableSetup.Get;

                    vend.TestField("E-Mail");
                    Clear(ToRecipients);
                    Clear(CC);
                    Clear(BCC);

                    RequesterName := vend.Name;


                    if PPayableSetup."Default Proc Email Contact" = '' then
                        Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases & Payable Setup page!!');
                    CC.Add(PPayableSetup."Default Proc Email Contact");
                    ToRecipients.Add(vend."E-Mail");
                    CompanyDetails := 'Dear,  ' + RequesterName + '<BR>' + vend."No.";
                    SenderMessage := '<BR>Thank You for participating in the Tender (Reference No:' + BidTabulation.Code + ') Submitted on ' + Format(BidTabulation."Bid Opening Date") +
                    'as summarized below: </BR>';
                    SupplierDetails := '<BR>Tender invitation Notice No:' + BidTabulation."IFS Code" + '</BR>' + '<BR> Tender Name:' + BidTabulation."Tender Name" + '</BR>';
                    LoginDetails := '<BR> This is to notify you that your bid was not successful and you have been awarded the tender, Attached is the E-Award Letter </BR>';
                    ProcNote := '<BR> If you require any assistance, please contact our Procurement team by Phone ' + HRSetup."Phone No." + ' or vendor support team via Email: ' + PPayableSetup."Default Proc Email Contact";
                    emailhdr := 'Regret Letter (Reference No: ' + BidTabulation.Code + ')';
                    EmailMsg.Create(ToRecipients, emailhdr, CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true, CC, BCC);
                    EmailMsg.AppendToBody(ProcNote);
                    //Email.OpenInEditor(EmailMsg, Scenario::Procurement);
                    BidLines.Reset;
                    BidLines.SetRange("Tabulation ID", BidTabulation.Code);
                    BidLines.SetRange("Bidder No", BidTabulationLine."Bidder No");
                    if BidLines.FindSet then begin
                        Emprecref.Reset();
                        Emprecref.Copy(BidLines);
                        Temp.CreateOutStream(Os);
                        Report.SaveAs(Report::"Regret Letter", '', ReportFormat::Pdf, Os, Emprecref);
                        Temp.CreateInStream(Ins);
                        FileName := 'RegretLetter_' + BidTabulation.Code + '.pdf';
                        EmailMsg.AddAttachment(FileName, 'PDF', Ins);
                    end;

                    Email.Send(EmailMsg, Scenario::Procurement);

                end;
            until BidTabulationLine.Next = 0;
        end;
    end;
}

