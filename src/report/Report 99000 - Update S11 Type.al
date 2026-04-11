report 99000 "Update S11 Type"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update S11 Type.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {

            trigger OnAfterGetRecord()
            begin
                if "Purchase Header"."Document Type" = "Purchase Header"."Document Type"::"Store Requisition" then
                    "Purchase Header"."Requisition Type" := "Purchase Header"."Requisition Type"::Project;
                "Purchase Header".Modify;
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
}

