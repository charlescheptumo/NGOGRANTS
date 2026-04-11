report 69061 "Update GL Entry"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update GL Entry.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            column(EntryNo_GLEntry; "G/L Entry"."Entry No.")
            {
            }
            column(GLAccountNo_GLEntry; "G/L Entry"."G/L Account No.")
            {
            }
            column(PostingDate_GLEntry; "G/L Entry"."Posting Date")
            {
            }
            column(DocumentType_GLEntry; "G/L Entry"."Document Type")
            {
            }
            column(DocumentNo_GLEntry; "G/L Entry"."Document No.")
            {
            }
            column(Description_GLEntry; "G/L Entry".Description)
            {
            }
            column(Name_GLEntry; "G/L Entry".Name)
            {
            }
            column(JobNo_GLEntry; "Job No.")
            {
            }
            column(JobTaskNo_GLEntry; "Job Task No.")
            {
            }
            column(JobQuantity_GLEntry; "Job Quantity")
            {
            }

            trigger OnAfterGetRecord()
            var
                GLEntry: Record "G/L Entry";
            begin
                // Vendor.Reset;
                // Vendor.SetRange("No.", "G/L Entry"."Source No.");
                // if Vendor.FindFirst then begin
                //     "G/L Entry".Name := Vendor.Name;
                //     "G/L Entry".Modify(true);
                // end
                GLEntry.Reset();
                GLEntry.SetRange("Entry No.", GLEntry."Entry No.");
                if GLEntry.Find('-') then begin
                    GLEntry."Job No." := "G/L Entry"."Job No.";
                    GLEntry."Job Task No." := "G/L Entry"."Job Task No.";
                    GLEntry."Job Quantity" := "G/L Entry"."Job Quantity";
                end
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

    var
        Vendor: Record Vendor;
}

