report 50022 "Contract Modification"
{
    Caption = 'Contract Modification';
    DefaultLayout = Word;
    WordLayout = './Layouts/Contract Modification.docx';
    ApplicationArea = All;
    dataset
    {
        dataitem(SubContractExtensionVoucher; "Sub Contract Extension Voucher")
        {
            column(AdditionalBudget; "Additional Budget")
            {
            }
            column(AmendmentNo; "Amendment No")
            {
            }
            column(AwardNo; "Award No")
            {
            }
            column(ExtendtoDate; "Extend to Date")
            {
            }
            column(ExtensionType; "Extension Type")
            {
            }
            column(ExtentedOn; "Extented On")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(Status; Status)
            {
            }
            column(SubAwardName; "Sub Award  Name")
            {
            }
            column(SubAwardEndDate; "Sub Award End Date")
            {
            }
            column(SubAwardNo; "Sub Award No")
            {
            }
            column(SubAwardStartDate; "Sub Award Start Date")
            {
            }
            column(No; "No.")
            {
            }
            column(Picture; CompInfo.Picture)
            {

            }
            column(CompAdress; CompInfo.Address)
            {

            }
            column(CompWebsite; CompInfo."Home Page")
            {

            }


            trigger OnPreDataItem()
            begin
                CompInfo.Get();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CompInfo: Record "Company Information";
}
