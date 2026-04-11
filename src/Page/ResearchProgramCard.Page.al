#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 65009 "Research Program Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Research Program";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                group("Program Overview Info")
                {
                    Caption = 'Program Overview Info';
                    field("Program Overview"; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Program Overview';
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field(ProgramHead; Rec."Program Director")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Head';
                }
                field(ProgramHeadName; Rec."Program Director Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Head Name';
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                field(PhoneNo; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo; Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(EMail; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(HomePage; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control30; "Research Program Factbox")
            {
                SubPageLink = Code = field(Code);
            }
            systempart(Control29; Links)
            {
                
                Visible = false;
            }
            systempart(Control28; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(RespCtr)
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec.Code = '' then
                            Error(Text0001, Rec.Code);
                        CompInfo.Get();
                        Rec.Address := CompInfo.Address;
                        Rec."Address 2" := CompInfo."Address 2";
                        Rec."Post Code" := CompInfo."Post Code";
                        Rec.City := CompInfo.City;
                        Rec."Country/Region Code" := CompInfo."Country/Region Code";
                        Rec.Modify;

                        Message(Text0002);
                    end;
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Grant Funding Application List";
                    // RunPageLink = "Primary Research Program ID" = field(Code);
                }
                action("Project Profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job List";
                    //   RunPageLink = "Research Program" = field(Code);
                }
                action("Project Areas")
                {
                    ApplicationArea = Basic;
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Research Project Area List";
                    RunPageLink = "Research Program ID" = field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //RunObject = Page "Research Program Statistics";
                }
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Research Centers';
                    Image = Allocations;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Research Center Programs List";
                    RunPageLink = "Program Code" = field(Code);
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        CompInfo: Record "Company Information";
        WorkDescription: Text;
}
