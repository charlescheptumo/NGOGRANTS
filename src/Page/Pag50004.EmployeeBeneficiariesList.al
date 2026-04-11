page 50004 "Employee Beneficiaries List"
{
    ApplicationArea = All;
    Caption = 'Employee Beneficiaries List';
    PageType = List;
    SourceTable = "Employee Beneficiaries";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Beneficiary No."; Rec."Beneficiary No.")
                {
                    ToolTip = 'Specifies the value of the Beneficiary No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Relationship; Rec.Relationship)
                {
                    ToolTip = 'Specifies the value of the Relationship field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
            }
        }
    }
}
