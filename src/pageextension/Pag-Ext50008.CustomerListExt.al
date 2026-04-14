pageextension 50008 "Customer List Ext" extends "Customer List"
{
    PromotedActionCategories = 'New,Process,Report,Approve,New Document,Request Approval,Donor';
    layout
    {
      
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify(Contact)
        {
            Visible = false;
        }
        modify("Sales (LCY)")
        {
            Visible = false;
        }
        modify("Payments (LCY)")
        {
            Visible = false;
        }
        addafter("No.")
        {
            field(isDonor;rec.isDonor){ApplicationArea = all;}
        }
    }
    actions
    {
        // modify("Category_Category7")
        // {
        //     PromotedCategory = Category7;  
        // }


    }


}
