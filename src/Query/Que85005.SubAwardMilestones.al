query 85005 "Sub Award Milestones"
{
    Caption = 'Sub Award Milestones';

    elements
    {
        dataitem(SubAwardMilestones; "Sub Award Milestones")
        {
            column(SubAwardNo; "Sub Award No")
            {
            }
            column(LineNo; "Line No")
            {
            }
            column(MilestoneCode; "Milestone Code")
            {
            }
            column(MilestoneDescription; "Milestone Description")
            {
            }
            column(MilestoneStartDate; "Milestone Start Date")
            {
            }
            column(MilestoneEndDate; "Milestone End Date")
            {
            }
            column(NotificationPeriod; "Notification Period")
            {
            }
            column(MilestoneStatus; "Milestone Status")
            {
            }
            column(Disbursement; Disbursement)
            {
            }
            column(Paymenttranche; "Payment tranche")
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
