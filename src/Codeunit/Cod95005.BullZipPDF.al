
// codeunit 95005 BullZipPDF
// {

//     var
//         FileName: Text;
//         Setup: Record "Pay Slip Setup";
//         PayrollHeader: Record "Payroll Header";
//         Employee: Record Employee;
//         EmailPayslip: Report "Email All Payslips";
//         OnePageSlip: Report "1 Page Payslip";
//         FileMgt: Codeunit "File Management";
//         AttactmentFileName: Text;
//         ClientFileName: Text;
//         Window: Dialog;
//         PrintToPDF: Boolean;
//         RunOnceFile: Text;
//         BullZipPDF: Automation 'Bullzip - PDF Writer Automation'.ComPdfSettings;
//         BullZipPDFUtil: Automation 'Bullzip - PDF Writer Automation'.ComPdfUtil;
//         PDFFilePath: Text;
//         PDFFileName: Text;
//         FullFileName: Text;
//         TimeOut: Integer;
//         Ent: Integer;
//         Text001: label 'Processing PDF and email...';
//         ErrorOnPDFCreation: Label 'Error on PDF Creation';

//     // procedure PrintDocument(PayNo: Code[20])
//     // begin
//     //     // Window.Open(Text001);
//     //     // Setup.Get;
//     //     // AttactmentFileName := Setup."Payment Slip File Path" + ' Pay Slip' + PayNo + '.pdf';
//     //     // if FileMgt.ServerFileExists(AttactmentFileName) then
//     //     //     FileMgt.DeleteServerFile(AttactmentFileName);

//     //     // PayrollHeader.Reset();
//     //     // PayrollHeader.SetRange("No.", PayNo);
//     // end;

//     // procedure SetPrinter()
//     // begin

//     // end;

//     // procedure ResetPrinter()
//     // begin

//     // end;

//     procedure PrinterSettings();
//     VAR
//         EmployeeL: Record 5200;
//         PrinterSelection: Record 78;
//     BEGIN
//         PrinterSelection.GET(USERID, 10075);
//         PrinterSelection.TESTFIELD("Printer Name");
//         BullZipPDF.printerName := PrinterSelection."Printer Name";
//         RunOnceFile := BullZipPDF.GetSettingsFilePath(TRUE);
//         BullZipPDF.SetValue('Output', AttactmentFileName);
//         BullZipPDF.SetValue('Showsettings', 'Never');
//         BullZipPDF.SetValue('ShowPDF', 'No');
//         BullZipPDF.SetValue('ShowProgress', 'No');
//         BullZipPDF.SetValue('ShowProgressFinished', 'No');
//         BullZipPDF.SetValue('SuppressErrors', 'Yes');
//         BullZipPDF.SetValue('ConfirmOverwrite', 'No');

//         //>>Add Password
//         BullZipPDF.SetValue('OwnerPassword', Setup."Master Password");
//         // BullZipPDF.SetValue('UserPassword', Customer."Document Password");
//         BullZipPDF.SetValue('UserPassword', Employee."ID Number");
//         //<<Add Password

//         // //>>Sign with a digital certificate.
//         // BullZipPDF.SetValue('SignCertificate', Setup."eSign Certificate Path");
//         // BullZipPDF.SetValue('SignPassword', Setup."eSign Password");
//         // BullZipPDF.SetValue('ShowSignature', 'yes');
//         // //<<Sign with a digital certificate.

//         // //>>Add watermark
//         // BullZipPDF.SetValue('WatermarkText', 'https://sbinesh.blogspot.com');
//         // BullZipPDF.SetValue('WatermarkColor', '#FF0000');
//         // BullZipPDF.SetValue('WatermarkVerticalPosition', 'top');
//         // BullZipPDF.SetValue('WatermarkHorizontalPosition', 'right');
//         // BullZipPDF.SetValue('WatermarkRotation', '90');
//         // BullZipPDF.SetValue('WatermarkOutlineWidth', '0.5');
//         // BullZipPDF.SetValue('WatermarkFontSize', '20');
//         // BullZipPDF.SetValue('WatermarkVerticalAdjustment', '5');
//         // BullZipPDF.SetValue('WatermarkHorizontalAdjustment', '1');
//         //<<Add watermark
//         BullZipPDF.WriteSettings(TRUE);
//     END;

//     // PROCEDURE WaitOnPDF();
//     // BEGIN
//     //     TimeOut := 0;
//     //     WHILE EXISTS(RunOnceFile) AND (TimeOut < 10) DO BEGIN
//     //         Window.UPDATE(1, 'Waiting... - ' + FORMAT(TimeOut));
//     //         SLEEP(500);
//     //         TimeOut := TimeOut + 1;
//     //     END;
//     // END;

//     procedure WaitWait()
//     begin

//     end;

//     procedure DeletePDF()
//     begin

//     end;

//     procedure TryCreateMail()
//     begin

//     end;

//     //     procedure EncryptPdf(var TempBlob: Codeunit "Temp Blob");
//     //     var
//     //         PdfPrinter: Automation "'Bullzip.PdfWriter'";
//     //         PdfFileName: Text;
//     //         EncryptedPdfFileName: Text;
//     //         PrinterName: Text;
//     //         Password: Text;
//     //         Emp: Record Employee;
//     //     begin
//     //         // Initialize variables
//     //         PdfFileName := 'temp.pdf';
//     //         EncryptedPdfFileName := 'encrypted.pdf';
//     //         PrinterName := 'Bullzip PDF Printer';
//     //         Password := Emp."ID Number";

//     //         // Create PDF Printer automation object
//     //         CREATE(PdfPrinter, TRUE);
//     //         PdfPrinter.Initialize();

//     //         // Set PDF Printer options
//     //         PdfPrinter.SetPrinterName(PrinterName);
//     //         PdfPrinter.SetValue('Output', PdfFileName);
//     //         PdfPrinter.SetValue('ShowSettings', 'never');
//     //         PdfPrinter.SetValue('ShowPDF', 'no');

//     //         // Set encryption options
//     //         PdfPrinter.SetValue('Encrypted', 'yes');
//     //         PdfPrinter.SetValue('UserPassword', Password);
//     //         PdfPrinter.SetValue('MasterPassword', Password);

//     //         // Print the PDF to the Bullzip PDF Printer
//     //         PdfPrinter.MergeDocument('temp.pdf');

//     //         // Rename and attach the encrypted PDF
//     //         TempBlob.RenameTempFile(PdfFileName, EncryptedPdfFileName);
//     //         EmailMessage.AddAttachment(EncryptedPdfFileName, 'PDF', TempBlob);
//     //         Email.Send(EmailMessage, "Email Scenario"::Payroll);

//     //         // Release resources
//     //         CLEAR(PdfPrinter);
//     //     end;

// }

// codeunit 95005 AddPDFPassword
// {
//     procedure AddPasswordToPDF()
//     var
//         PDFService: DotNet "'System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.PdfService";
//         PDFFilePath: Text;
//         Password: Text;
//     begin
//         // Set the path to the PDF file you want to add a password to
//         PDFFilePath := 'C:\Path\To\Your\File.pdf';
//         // Set the password you want to apply to the PDF
//         Password := 'YourPassword123';
//         // Call the external PDF service to add the password
//         PDFService.AddPasswordToPDF(PDFFilePath, Password);
//         // Optionally, you can handle any errors or provide feedback to the user
//     end;
// }
