query 80055 "HR Leave Types"
{
    Caption = 'HR Leave Types';
    elements
    {
        dataitem(HRLeaveTypes; "HR Leave Types")
        {
            column("Code"; "Code")
            {
            }
            column(Description; Description)
            {
            }
            column(Days; Days)
            {
            }
            column(AcrueDays; "Acrue Days")
            {
            }
            column(UnlimitedDays; "Unlimited Days")
            {
            }
            column(Gender; Gender)
            {
            }
            column(Balance; Balance)
            {
            }
            column(InclusiveofHolidays; "Inclusive of Holidays")
            {
            }
            column(InclusiveofSaturday; "Inclusive of Saturday")
            {
            }
            column(InclusiveofSunday; "Inclusive of Sunday")
            {
            }
            column(OffHolidaysDaysLeave; "Off/Holidays Days Leave")
            {
            }
            column(MaxCarryForwardDays; "Max Carry Forward Days")
            {
            }
            column(InclusiveofNonWorkingDays; "Inclusive of Non Working Days")
            {
            }
            column(CarryForwardAllowed; "Carry Forward Allowed")
            {
            }
            column(FixedDays; "Fixed Days")
            {
            }
            column(Annual; Annual)
            {
            }
            column(GracePeriodinDays; "Grace Period(in Days )")
            {
            }
            column(PostingType; "Posting Type")
            {
            }
            column(AttachmentMandatory; "Attachment Mandatory")
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
