#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // For NAV settings

pageextension 50120 "pageextension50120" extends "Business Manager Role Center"
{
    layout
    {
        // You can add parts here if needed
    }

    actions
    {
        addafter("Chart of Accounts") // Add action to existing Tasks group
        {
            action("Employees On Leave")
            {
                ApplicationArea = All;
                Caption = 'Employees On Leave';
                RunObject = Page "Employees On Leave"; // Opens the page by ID
                ToolTip = 'View all employees currently on leave.';
            }
        }
    }
}
