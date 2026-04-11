query 85004 "Sub Award Services"
{
    Caption = 'Sub Award Services';
    QueryType = Normal;
    
    elements
    {
        dataitem(SubAwardServices; "Sub Award Services")
        {
            column(SubAwardNo; "Sub Award No")
            {
            }
            column(LineNo; "Line No")
            {
            }
            column(ServicesDescription; "Services Description")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
        }
    }
    
    trigger OnBeforeOpen()
    begin
    
    end;
}
