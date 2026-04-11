#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65044 "Funding Opportunity Card"
{
    Caption = 'Funding Opportunity Announcement Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Funding Opportunity";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CallNo; Rec."Call No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FundingAgencyID; Rec."Organization ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Agency ID';
                }
                field(FundingAgencyName; Rec."Issuing Organization")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Agency Name';
                }
                field(FundingAgencyCountry; Rec."Funding Agency Country")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GrantType; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                }
                group("External Announcement Number")
                {
                    Enabled = true;
                    // Visible = "Grant Type" = 'EXTERNAL';
                    field(ExternalAnnouncementNo; Rec."External Announcement No")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Title (Maximum Characters 255)';
                }
                field(GrantThematicArea; Rec."Grant Thematic Area")
                {
                    ApplicationArea = Basic;
                }
                field(CallType; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                }
                group("Concept Note")
                {
                    // Editable = "Grant Type" = 'EXTERNAL';
                    // Enabled = true;
                    // Visible = "Call Type" <> "Call Type"::"Call for Concept Notes";
                    field(ReferencedConceptNote; Rec."Referenced Concept Note")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field(ReleaseDate; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                }
                field(Applicationdate; Rec."Application date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("FOA Duration"; Rec."Project Duration")
                {
                    ApplicationArea = Basic;
                }
                field(GrantClosingDate; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grant Closing Date';
                    Editable = false;
                    Visible = true;
                }
                field(EstimatedAwardDuration; Rec."Estimated Award Duration")
                {
                    ApplicationArea = Basic;
                }
                field(EstimatedAwardDate; Rec."Estimated Award Date")
                {
                    ApplicationArea = Basic;
                }
                field(HomePageURL; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home Page/URL';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                group("Title Details:")
                {
                    Caption = 'Title Details:';
                    field("Opportunity Details"; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        StyleExpr = true;

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
            }
            group("Finance Details")
            {
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CurrencyCode; Rec."Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                            Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        //SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                }
                field(BudgetAwardCeiling; Rec."Opportunity Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Award Ceiling';
                }
                field(OpportunityAmountLCY; Rec."Opportunity Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Fundsconfirmed; Rec."Funds confirmed")
                {
                    ApplicationArea = Basic;
                    Editable = "funds confirmed" = false;

                    trigger OnValidate()
                    begin
                        Rec."Funds confirmed by" := UserId;
                        Rec."Funds confirmed" := true;
                    end;
                }
                field(Fundsconfirmedby; Rec."Funds confirmed by")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Control48; Rec."Funding Agency Name")
                {
                    ApplicationArea = Basic;
                }
                field(FundingAgencyPhone; Rec."Funding Agency Phone")
                {
                    ApplicationArea = Basic;
                }
                field(FundingAgencyEmail; Rec."Funding Agency Email")
                {
                    ApplicationArea = Basic;
                }
                field(FundingAgencyCity; Rec."Funding Agency City")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
            }
            systempart(Control22; Notes)
            {
            }
            systempart(Control21; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Grants Applications")
            {
                ApplicationArea = Basic;
                Image = Grid;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Funding Application List";
                // RunPageLink = "FOA ID" = field("Call No.");
            }
            action("Print Funding Opportunity")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec."Call No.", Rec."Call No.");
                    Report.Run(65017, true, true, Rec)
                end;
            }
            action("Notify Scientist Via Email")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CompanyInfo.Get();
                 //   SMTPMailSet.Get;
                 //   SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName := CompanyInfo.Name + ' GRANTS';
                    Subject := StrSubstNo('Funding Opportunity');

                    FundingOpp.Reset;
                    FundingOpp.SetRange(FundingOpp."Call No.", Rec."Call No.");
                    if FundingOpp.FindFirst then begin
                        FileDirectory := 'C:\DOCS\';
                        FileName := 'FOA_' + FundingOpp."Call No." + '.pdf';
                        //Window.OPEN('processing');
                        Window.Open('PROCESSING Funding Opportunity ############1##');
                        Window.Update(1, FundingOpp."Call No." + '-' + FundingOpp.Title);

                        WindowisOpen := true;
                        if FileName = '' then
                            Error('Please specify what the file should be saved as');


                        // Report.SaveAsPdf(65017,FileDirectory+FileName,FundingOpp);




                        //  if Exists(FileDirectory+FileName) then
                        begin
                            Counter := Counter + 1;

                           // SMTPMailSet.Get;
                          //  SenderAddress := SMTPMailSet."Email Sender Address";



                            GrantsSetup.Get;
                            // if GrantsSetup."Scientist Group Email" <> '' then begin
                            //     Recipients := GrantsSetup."Scientist Group Email";


                            //   cu400.CreateMessage( CompanyInfo.Name,SenderAddress,
                            //   Recipients,'Funding Opportunity -'+'FOA Number : '+FundingOpp."Call No."+'-'+FundingOpp.Title,
                            //   'Dear '+'Scientists'+',<BR><BR>'+
                            //   'Please find attached your Funding Opportunity Announcement(FOA). Application Due Date ('+Format(FundingOpp."Application Due Date")+' )'+'.<BR>'+
                            //   'Kindly be Apply.<BR><BR>',true);

                            //   cu400.AppendBody(
                            //   '<BR><BR>Kind Regards,');
                            //   cu400.AppendBody('<BR>'+CompInfo.Name);
                            //   cu400.AddAttachment(FileDirectory+FileName,FileName);
                            //   cu400.Send;





                            Sleep(1000);
                            Window.Close;
                        end;
                    end;
                end;
                // end;
            }
            action(Publish)
            {
                ApplicationArea = Basic;
                Image = Start;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to publish?') then
                        exit;

                    Rec.Published := true;
                    if Rec.Modify then
                        Message('successfuly published');
                end;
            }
            group(Resource)
            {
                Caption = '&Resource';
                Image = Resource;
                action("Attachments - old")
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action("AttachDocuments - old")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //  DMSManagement.UploadFundOpportunityDocuments(Rec."Call No.",'Funding Opportunity',Rec.RecordId);
                    end;
                }
                group("<Documents>")
                {
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        // DMSManagement.UploadGrantFundingApplicationDocuments(Rec."Call No.", 'Grant Funding Opportunity', Rec.RecordId);
                    end;
                }
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                RunObject = Page "HR Leave Documents";
                RunPageLink = "Doc No." = field("Call No.");
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    //RecRef.GETTABLE(Rec);
                    //DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //DocumentAttachmentDetails.RUNMODAL;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        WorkDescription: Text;
        ChangeExchangeRate: Page "Change Exchange Rate";
        // SMTPSetup: Codeunit "SMTP Mail";
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        SenderAddress: Text[80];
        Recipients: Text[80];
        SenderName: Text[70];
        Body: Text[250];
        Subject: Text[80];
        FileName: Text;
        FileMangement: Codeunit "File Management";
        ProgressWindow: Dialog;
       // SMTPMailSet: Record "SMTP Mail Setup";
        FileDirectory: Text[100];
        Window: Dialog;
        WindowisOpen: Boolean;
        Counter: Integer;
        // cu400: Codeunit "SMTP Mail";
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        CustEmail: Text[100];
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        FundingOpp: Record "Funding Opportunity";
        GrantsSetup: Record "Grants Setup";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        "funds confirmed": Boolean;
}
