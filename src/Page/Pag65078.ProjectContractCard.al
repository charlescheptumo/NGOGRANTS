#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65078 "Project Contract Card"
{
    PageType = Card;
    SourceTable = "Project Contract Header";
    ApplicationArea = Basic;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project Contract No"; Rec."Project Contract No")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }

                field("External Contract No"; Rec."External Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contract Customer No"; Rec."Primary Contract Customer No")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    // Caption = 'Primary Contract Donor No';
                    Caption = 'Contract Donor No';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Grant Administrator"; Rec."Grant Administrator")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Award Type"; Rec."Award Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Funding Sponsor ID"; Rec."Primary Funding Sponsor ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Sponsor Name"; Rec."Primary Sponsor Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Original Award Contract"; Rec."Original Award Contract")
                {
                    ToolTip = 'Specifies the value of the Original Award Contract field.';
                }
                field("Renewed Award Contract No"; Rec."Renewed Award Contract No")
                {
                    ToolTip = 'Specifies the value of the Renewed Award Contract No field.';
                }
                field("Addendum Counter"; Rec."Addendum Counter")
                {
                    ToolTip = 'Specifies the value of the Addendum Counter field.';
                }
            }
            part(Control30; "Contract Funding Lines")
            {
                SubPageLink = "Project Contract No." = field("Project Contract No");
                ApplicationArea = Basic;
            }
            part(GrantPaymentSchedule; "Grant Payment Schedule")
            {
                Caption = 'Grant Payment Schedule';
                SubPageLink = "Grant No" = field("Project Contract No");
                ApplicationArea = Basic;
            }
            part(GrantReportingSchedule; "Grant Reporting Schedule")
            {
                Caption = 'Grant Reporting Schedule';
                SubPageLink = "Grant No" = field("Project Contract No");
                ApplicationArea = Basic;
            }
            systempart(Control32; Links)
            {

                ApplicationArea = Basic;
            }
            systempart(Control31; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Project Contract No");
                Caption = 'Attachments';
            }

        }
    }

    actions
    {
        area(creation)
        {
            separator(Action39)
            {
            }
            action("Print Project Contract")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("Project Contract No", Rec."Project Contract No");
                    Report.Run(65019, true, true, Rec)
                end;
            }

            action("Si&gn Contract")
            {
                ApplicationArea = Service;
                Caption = 'Si&gn Contract';
                Image = Signature;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                ToolTip = 'Confirm the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    Rec."Contract Status" := Rec."contract status"::Signed;
                    Rec."Approval Status" := Rec."approval status"::Approved;
                    Rec.Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action("Cancel Contract")
            {
                ApplicationArea = Service;
                Caption = 'Cancel Contract';
                Image = Signature;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                ToolTip = 'Cancel  the contract.';

                trigger OnAction()
                var
                    SignServContractDoc: Codeunit SignServContractDoc;
                begin
                    Rec."Contract Status" := Rec."contract status"::Signed;
                    Rec."Approval Status" := Rec."approval status"::Approved;
                    Rec.Modify;
                    Message('Contract Signed Successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category4;


                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;


                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);//status must be open.
                    Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                    // if ApprovalsMgmtExt.CheckProjectContractHeaderApprovalsWorkflowEnabled(Rec) then
                    //     ApprovalsMgmtExt.OnSendProjectContractHeaderForApproval(Rec);
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);


                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;


                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                    Rec.TESTFIELD("Created By", USERID); //control so that only the initiator of the document can send for approval
                    // if ApprovalsMgmtExt.CheckProjectContractHeaderApprovalsWorkflowEnabled(Rec) then
                    //     ApprovalsMgmtExt.OnCancelProjectContractHeaderApprovalRequest(Rec);
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }

        }
        area(Processing)
        {
            action(SubAwards)
            {
                ApplicationArea = All;
                Caption = 'Sub Awards';
                Promoted = true;
                PromotedCategory = Process;
                Image = FileContract;
                RunObject = page "All Sub Awards";
                RunPageLink = "PFC No" = field("Project Contract No");
            }
            action(Budget)
            {
                ApplicationArea = All;
                Caption = 'Budget Report';
                Promoted = true;
                PromotedCategory = Report;
                Image = FileContract;
                //RunObject = page "All Sub Awards";
                //RunPageLink = "PFC No" = field("Project Contract No");
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        // SetControlAppearance;

        DocType := DocType::"Project Contract";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."Project Contract No");

    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";


}

#pragma implicitwith restore

