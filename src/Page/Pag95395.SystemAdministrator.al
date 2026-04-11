page 95395 "System Administrator"
{
    ApplicationArea = All;
    Caption = 'System Administrator';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control99; "Finance Performance")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control1902304208; "M&E  Activities")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(Control1900724708)
            {
                part(Control103; "Trailing Sales Orders Chart")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control106; "My Job Queue")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control100; "Cash Flow Forecast Chart")
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control1902476008; "My Vendors")
                {
                    ApplicationArea = Basic, Suite;
                }
                systempart(Control1901377608; MyNotes)
                {
                    ApplicationArea = Basic, Suite;
                }
                part(Control108; "Report Inbox Part")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
}
