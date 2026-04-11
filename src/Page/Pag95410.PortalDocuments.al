page 95410 "Portal Documents"
{
    ApplicationArea = All;
    Caption = 'Portal Documents';
    PageType = List;
    Editable = false;
    SourceTable = UploadedSharepointDocuments;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(FileLink; Rec.FileLink)
                {
                    ToolTip = 'Specifies the value of the FileLink field.';
                }
                field(FileName; Rec.FileName)
                {
                    ToolTip = 'Specifies the value of the FileName field.';
                }
            }
        }
    }
}
