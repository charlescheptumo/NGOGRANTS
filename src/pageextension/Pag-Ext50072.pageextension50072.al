#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50072 "pageextension50072" extends "Document Attachment Details" 
{
    layout
    {
        addfirst(Group)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
        }
    }


    //Unsupported feature: Code Modification on "OpenForRecRef(PROCEDURE 3)".

    //procedure OpenForRecRef();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;

        FromRecRef := RecRef;

        SETRANGE("Table ID",RecRef.NUMBER);

        IF RecRef.NUMBER = DATABASE::Item THEN BEGIN
          SalesDocumentFlow := TRUE;
          PurchaseDocumentFlow := TRUE;
        END;

        CASE RecRef.NUMBER OF
          DATABASE::Customer,
          DATABASE::"Sales Header",
          DATABASE::"Sales Line",
          DATABASE::"Sales Invoice Header",
          DATABASE::"Sales Invoice Line",
          DATABASE::"Sales Cr.Memo Header",
          DATABASE::"Sales Cr.Memo Line":
            SalesDocumentFlow := TRUE;
          DATABASE::Vendor,
          DATABASE::"Purchase Header",
          DATABASE::"Purchase Line",
          DATABASE::"Purch. Inv. Header",
          DATABASE::"Purch. Inv. Line",
          DATABASE::"Purch. Cr. Memo Hdr.",
          DATABASE::"Purch. Cr. Memo Line":
            PurchaseDocumentFlow := TRUE;
        END;

        CASE RecRef.NUMBER OF
          DATABASE::Customer,
          DATABASE::Vendor,
          DATABASE::Item,
          DATABASE::Employee,
          DATABASE::"Fixed Asset",
          DATABASE::Job,
          DATABASE::Resource:
            BEGIN
              FieldRef := RecRef.FIELD(1);
              RecNo := FieldRef.VALUE;
              SETRANGE("No.",RecNo);
            END;
        END;

        CASE RecRef.NUMBER OF
          DATABASE::"Sales Header",
          DATABASE::"Sales Line",
          DATABASE::"Purchase Header",
          DATABASE::"Purchase Line":
            BEGIN
              FieldRef := RecRef.FIELD(1);
              DocType := FieldRef.VALUE;
              SETRANGE("Document Type",DocType);

              FieldRef := RecRef.FIELD(3);
              RecNo := FieldRef.VALUE;
              SETRANGE("No.",RecNo);

              FlowFieldsEditable := FALSE;
            END;
        END;

        CASE RecRef.NUMBER OF
          DATABASE::"Sales Line",
          DATABASE::"Purchase Line":
            BEGIN
              FieldRef := RecRef.FIELD(4);
              LineNo := FieldRef.VALUE;
              SETRANGE("Line No.",LineNo);
            END;
        END;

        CASE RecRef.NUMBER OF
          DATABASE::"Sales Invoice Header",
          DATABASE::"Sales Cr.Memo Header",
          DATABASE::"Purch. Inv. Header",
          DATABASE::"Purch. Cr. Memo Hdr.":
            BEGIN
              FieldRef := RecRef.FIELD(3);
              RecNo := FieldRef.VALUE;
              SETRANGE("No.",RecNo);

              FlowFieldsEditable := FALSE;
            END;
        END;

        CASE RecRef.NUMBER OF
          DATABASE::"Sales Invoice Line",
          DATABASE::"Sales Cr.Memo Line",
          DATABASE::"Purch. Inv. Line",
          DATABASE::"Purch. Cr. Memo Line":
            BEGIN
              FieldRef := RecRef.FIELD(3);
              RecNo := FieldRef.VALUE;
              SETRANGE("No.",RecNo);

              FieldRef := RecRef.FIELD(4);
              LineNo := FieldRef.VALUE;
              SETRANGE("Line No.",LineNo);

              FlowFieldsEditable := FALSE;
            END;
        END;

        OnAfterOpenForRecRef(Rec,RecRef);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        #5..19
          SalesDocumentFlow := TRUE;
        #21..25
          DATABASE::"Procurement Request",
          DATABASE::"Purch. Cr. Memo Hdr.",
          //Added Custom document by Morris
          DATABASE::"Grant Funding Application",
          DATABASE::"Case Register",
          //End Custom document Morris
        #27..37
          DATABASE::"Procurement Request",
          //Added Custom document by Morris
          DATABASE::"Grant Funding Application",
          DATABASE::Payments,
          DATABASE::"Case Register",
          //End Custom document Morris
        #38..44
        CASE RecRef.NUMBER OF
          DATABASE::"Fuel & Maintenance Requisition":
            BEGIN
              FieldRef := RecRef.FIELD(1);
              RecNo := FieldRef.VALUE;
              SETRANGE("No.",RecNo);
        #61..64
        #47..106
        */
    //end;
}

#pragma implicitwith restore

