/// <summary>
/// Developed by Ian Casper
/// 
/// </summary>
codeunit 50023 SharepointDMS
{

    procedure UploadDocument(DocNo: Text; DocType: Enum "Approval Document Type"): Text
    var
        Ins: InStream;
        FromFilter: Text;
        Ok: Boolean;
        FileMgt: Codeunit "File Management";
        FileName: Text;
        SharepointFile: Record "SharePoint File" temporary;
        SharepointFolder: Record "SharePoint Folder" temporary;
        ServerRelativeURL: Text;
        ShareConnectorSetup: Record "Cash Management Setup";
        SharePointConnector: Record "Sharepoint Connector Setup";
        SPC: Codeunit "SharePoint Client";

    begin
        //Message(DocNo + Format(DocType) + SharepointList."No.");
        //Upload file from clients computer into server stream
        FromFilter := 'All Files (*.*)|*.*';
        Ok := UploadIntoStream('Upload', '', FromFilter, FileName, Ins);
        Filetxt := FileName;
        //Check if folder for this document exists
        ShareConnectorSetup.Get();
        SharePointConnector.Get();
        // ServerRelativeURL := ShareConnectorSetup."SharePoint Document Library" + ShareConnectorSetup."Payment Voucher DMS Link";
        ServerRelativeURL := SharePointConnector.Directory + Format(DocType);

        SharepointMgt.GetFilesFromServerRelativeURL(ServerRelativeURL, SharepointFolder, SharepointFile);
        SharepointFolder.Reset();
        SharepointFolder.SetRange(Name, DocNo);
        if SharepointFolder.FindFirst() then begin
            ServerRelativeURL := ServerRelativeURL + '/' + DocNo;
            if SharepointMgt.SaveFile(ServerRelativeURL, FileName, Ins) then begin
                ServerRelativeURL := ServerRelativeURL + '/' + FileName;
                OD := SharepointMgt.getOdataID();
                exit(ServerRelativeURL);

            end;
        end else begin
            ServerRelativeURL := ServerRelativeURL + '/' + DocNo;
            if SharepointMgt.CreateFolder(ServerRelativeURL) then
                if SharepointMgt.SaveFile(ServerRelativeURL, FileName, Ins) then begin
                    ServerRelativeURL := ServerRelativeURL + '/' + FileName;
                    OD := SharepointMgt.getOdataID();
                    exit(ServerRelativeURL);
                end;

        end;
    end;


    Procedure DownloadDocument(OD: Text; Filename: Text)
    begin
        SharepointMgt.OpenFile(OD, Filename);
    end;

    procedure getOdataID(): Text
    begin
        exit(OD);
    end;

    Procedure GetFilname(): Text
    begin
        exit(Filetxt);
    end;



    var
        Filetxt: text;
        SharepointMgt: Codeunit "Sharepoint Management";
        OD: Text;


}
