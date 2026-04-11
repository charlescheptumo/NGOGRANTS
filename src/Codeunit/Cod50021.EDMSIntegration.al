codeunit 50021 "EDMS Integration"
{
    trigger OnRun()
    begin

    end;

    procedure UploadDocument(DocID: code[100]; PageCaption: text; RecID: RecordId): Text
    var
        FilePath: Text;
        OnlinePath: Text;
        FileName: Text;
        TempFile: File;
        NewStream: InsTream;
        RecRef: RecordRef;
        TableID: Integer;
        RecLink: Record "Record Link";
        CompanyInfo: Record "Company Information";
        LineNo: Integer;
        //DocNamePage: page "Document Name";
        DocName: Text;
        FileUploadedSuccessTxt: Label 'File %1 uploaded successfully';
        FinalFilename: Text;
        FinalPath: Text;
        FileMgt: Codeunit "File Management";
        UploadFile: Text;
        DataOutstream: OutStream;
        DataInstream: InStream;
        AllFilesDescriptionTxt: TextConst ENU = 'Pdf Files (*.pdf*)|*.pdf';
    //AllFilesDescriptionTxt: TextConst ENU = 'Pdf Files (*.pdf*)|*.*|Json Files (*.json)|*.json';

    //FileSystem: DotNet MyDirectory;

    begin
        /*    CompanyInfo.get;
           CompanyInfo.TestField("Document Path");
           CompanyInfo.TestField("Online Document Path");

           FilePath := CompanyInfo."Document Path" + '\' + CompanyInfo.Name + '\' + PageCaption + '\' + DocID + '\'; //Server physical path
           OnlinePath := CompanyInfo."Online Document Path" + '/' + CompanyInfo.Name + '/' + PageCaption + '/' + DocID; //Mapped sharepoint network path

           if not FileMgt.ServerDirectoryExists(FilePath) then
               FileMgt.ServerCreateDirectory(FilePath);

           if UploadIntoStream('Upload', '', AllFilesDescriptionTxt, FileName, DataInstream) then begin
               UploadFile := FilePath + '\' + FileName;
               if FileMgt.ServerFileExists(UploadFile) then
                   FileMgt.DeleteServerFile(UploadFile);

               TempFile.Create(UploadFile);
               TempFile.CreateOutStream(DataOutstream);
               CopyStream(DataOutstream, DataInstream);
               TempFile.Close();

               //Add Record Link
               RecLink.Reset();
               if RecLink.FindLast() then
                   LineNo := RecLink."Link ID" + 1
               else
                   LineNo := 1;
               RecLink.Init();
               RecLink."Link ID" := LineNo;
               RecLink."Record ID" := RecID;
               RecLink.URL1 := OnlinePath + '/' + FileName; // This URL points to sharepoint
               RecLink.Description := FileName;
               RecLink.Type := RecLink.Type::Link;
               RecLink.Created := CurrentDateTime;
               RecLink.Company := CompanyName;
               RecLink."User ID" := UserId;
               RecLink.Insert();

               exit(FileName);
               FilePath := '';
           end; */
    end;

}
