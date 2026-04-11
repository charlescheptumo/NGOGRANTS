#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50032 "pageextension50032" extends "User Setup"
{
    layout
    {
        addafter("User ID")
        {
            field(CIDO; Rec.CIDO)
            {
                ApplicationArea = Basic;
            }
            field("ICT Administrator"; Rec."ICT Administrator")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
            }
            field(Receiptionist; Rec.Receiptionist)
            {
                ApplicationArea = Basic;
            }
            field("Create Corrective Credit Memo"; Rec."Create Corrective Credit Memo")
            {
                ApplicationArea = Basic;
            }
            field("Modify Invoice Posting Date"; Rec."Modify Invoice Posting Date")
            {
                ApplicationArea = Basic;
            }
            field("Modify Account Schedules"; Rec."Modify Account Schedules")
            {
                ApplicationArea = Basic;
            }
            field("Accounts User"; Rec."Accounts User")
            {
                ApplicationArea = Basic;
            }
            field(Leave; Rec.Leave)
            {
                ApplicationArea = Basic;
            }
            field("Resource No"; Rec."Resource No")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = Basic;
            }
            field("Update FS"; Rec."Update FS")
            {
                ApplicationArea = Basic;
            }
            field("Payroll View"; Rec."Payroll View")
            {
                ApplicationArea = Basic;
                //Visible = false;
            }
            field("Post Memo"; Rec."Post Memo")
            {
                ApplicationArea = Basic;
            }
            field("Post Requisition"; Rec."Post Requisition")
            {
                ApplicationArea = Basic;
            }
            field("Procurement officer"; Rec."Procurement officer")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Manager"; Rec."Procurement Manager")
            {
                ApplicationArea = Basic;
            }
            field("post surrender"; Rec."post surrender")
            {
                ApplicationArea = Basic;
            }
            field("Allowed To Auto Reverse"; Rec."Allowed To Auto Reverse")
            {
                ApplicationArea = Basic;
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Email)
        {
            field("Portal User"; Rec."Portal User")
            {
                ApplicationArea = Basic;
            }
            field("Create New Job"; Rec."Create New Job")
            {
                ApplicationArea = Basic;
            }
            field("Update Job Status"; Rec."Update Job Status")
            {
                ApplicationArea = Basic;
            }
            field("Archive Document"; Rec."Archive Document")
            {
                ApplicationArea = Basic;
            }
            field("Authorize IFS Creator"; Rec."Authorize IFS Creator")
            {
                ApplicationArea = Basic;
            }
            field("Region Code"; Rec."Region Code")
            {
                ApplicationArea = Basic;
            }
            field("Finance Dept."; Rec."Finance Dept.")
            {
                ApplicationArea = Basic;
            }
            field("Examination Admin"; Rec."Examination Admin")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Student Mgmt Admin"; Rec."Student Mgmt Admin")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Post Purchase Documents"; Rec."Post Purchase Documents")
            {
                ApplicationArea = Basic;
            }
            field("Exam Support Admin"; Rec."Exam Support Admin")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("MPESA amounts Admin"; Rec."MPESA amounts Admin")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Examination Results Admin"; Rec."Examination Results Admin")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("HOD Finance"; Rec."HOD Finance")
            {
                ApplicationArea = Basic;
            }
            field("Revenue Admin"; Rec."Revenue Admin")
            {
                ApplicationArea = Basic;
            }
            field("Change Role Center"; Rec."Change Role Center")
            {
                ApplicationArea = Basic;
            }
            field("User Signature"; Rec."User Signature")
            {
                ApplicationArea = Basic;
            }
            field(Picture; Rec.Picture)
            {
                ApplicationArea = Basic;
                Editable = true;
            }

        }


    }
    // actions
    // {
    //     addlast(Creation)
    //     {
    //         // group(Signature)
    //         // {
    //         //     action("Add Signature")
    //         //     {
    //         //         trigger OnAction();
    //         //         begin
    //         //             Page.RunModal(69066, Rec);

    //         //         end;
    //         //     }

    //         //     action("Signatures")
    //         //     {
    //         //         trigger OnAction();
    //         //         begin
    //         //             Page.Run(69066, Rec);

    //         //         end;
    //         //     }

    //         //     action("Signature 2")
    //         //     {
    //         //         trigger OnAction();
    //         //         begin
    //         //             //Page.RunModal(69066);

    //         //         end;
    //         //     }

    //         // }
    //         // group("User Signatures")
    //         // {


    //         //     action("Signatures User")
    //         //     {
    //         //         trigger OnAction();
    //         //         begin
    //         //             //Page.RunModal(69066);

    //         //         end;
    //         //     }

    //         // }
    //     }
    // }


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HideExternalUsers;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //HideExternalUsers;
    */
    //end;
}

#pragma implicitwith restore

