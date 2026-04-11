#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69613 "Staff Establishment Plan"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Staff Establishment Plan";
    UsageCategory = Tasks;
    PromotedActionCategories = 'New,Process,Report,Approvals,Attachments,Comment,Actions,Navigate';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Staff Establishment"; TotalStaff)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Recruitment Plans"; TotalVariance)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control12; "Establishment Position")
            {
                Caption = 'Establishment Positions';
                SubPageLink = "Staff Establishment Code" = field(Code);
                ApplicationArea = Basic;
            }
        }

    }

    actions
    {
        area(processing)
        {
            action("Suggest Job Positions")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin

                    StaffEstablishmentTaskLines.Reset;
                    StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", Rec.Code);
                    if StaffEstablishmentTaskLines.FindSet then begin
                        StaffEstablishmentTaskLines.DeleteAll;
                    end;

                    Positions.Reset;
                    Positions.SetRange("Position Category", Positions."position category"::Employee);
                    //Positions.SetFilter("Cadre Type", '<>%1', Positions."cadre type"::"Common Cadre");
                    if Positions.FindSet then begin
                        repeat
                            StaffEstablishmentTaskLines.Init;
                            StaffEstablishmentTaskLines."Job ID" := Positions."Position ID";
                            StaffEstablishmentTaskLines."Department Code" := Positions.Department;
                            StaffEstablishmentTaskLines."Directorate Code" := Positions.Directorate;
                            StaffEstablishmentTaskLines."Job Title" := Positions."Job Title";
                            StaffEstablishmentTaskLines."Designation Group" := Positions."Designation Group";
                            StaffEstablishmentTaskLines."Staff Establishment Code" := Rec.Code;
                            // StaffEstablishmentTaskLines.Status := Positions.Status;
                            // StaffEstablishmentTaskLines."Cadre Type" := StaffEstablishmentTaskLines."cadre type"::"Normal Cadre";
                            StaffEstablishmentTaskLines.Insert;

                        until
                      Positions.Next = 0;
                    end;



                    //CadreHeader
                    CadreHeader.Reset;
                    CadreHeader.SetFilter(Code, '<>%1', '');
                    if CadreHeader.FindSet then begin
                        repeat
                            StaffEstablishmentTaskLines.Init;
                            StaffEstablishmentTaskLines."Job ID" := CadreHeader."Default Position";
                            CadreHeader.CalcFields(Department, Directorate, "Designation Group");
                            StaffEstablishmentTaskLines."Department Code" := CadreHeader.Department;
                            StaffEstablishmentTaskLines."Directorate Code" := CadreHeader.Directorate;
                            StaffEstablishmentTaskLines."Job Title" := CadreHeader.Description;
                            StaffEstablishmentTaskLines."Designation Group" := CadreHeader."Designation Group";
                            StaffEstablishmentTaskLines."Staff Establishment Code" := Rec.Code;
                            //StaffEstablishmentTaskLines."Cadre Type" := StaffEstablishmentTaskLines."cadre type"::"Common Cadre";
                            StaffEstablishmentTaskLines."Cadre Code" := CadreHeader.Code;
                            StaffEstablishmentTaskLines.Insert;

                        until
                      CadreHeader.Next = 0;
                    end;
                end;
            }



        }
        area(navigation)
        {
            action("Manpower Plans")
            {
                ApplicationArea = Basic;
                Image = Planning;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category8;
                RunObject = Page "Establishment Planning Lines";
                RunPageMode = View;
            }
            action("Job Grades")
            {
                ApplicationArea = Basic;
                Image = JobLedger;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Job Grades";
            }
            action("Duty Stations")
            {
                ApplicationArea = Basic;
                Image = DeleteAllBreakpoints;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Duty Stations1";
            }
        }
        area(reporting)
        {
            action("Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                //   RunObject = Report "Staff Establishment";
            }
            action("Detailed Staff Establishment")
            {
                ApplicationArea = Basic;
                Image = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                // RunObject = Report "Detailed Staff Establishment";
            }
        }
    }

    trigger OnOpenPage()
    var
        vari: Integer;
    begin
        EntryNo := 0;
        vari := 0;
        TotalStaff := 0;
        TotalVariance := 0;
        StaffEstablishmentTaskLines.Reset;
        StaffEstablishmentTaskLines.SetRange("Staff Establishment Code", Rec.Code);
        if StaffEstablishmentTaskLines.FindSet then begin

            repeat
                StaffEstablishmentTaskLines.CalcFields("Approved No.", "Actual Active");
                EntryNo := StaffEstablishmentTaskLines."Approved No." + EntryNo;
                vari += StaffEstablishmentTaskLines."Actual Active";
            until StaffEstablishmentTaskLines.Next = 0;
        end;
        TotalStaff := EntryNo - vari;
        TotalVariance := vari;

    end;

    var
        StaffEstablishmentTaskLines: Record "Establishment Plan Position";
        Positions: Record "Company Positions";
        EntryNo: Integer;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CadreHeader: Record "Cadre Header";
        TotalStaff: Integer;
        TotalVariance: Integer;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}

#pragma implicitwith restore

