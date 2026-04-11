pageextension 50139 "User Settings Ext" extends "User Settings"
{
    layout
    {

        modify(UserRoleCenter)
        {

            Visible = rolecenteraccess;


        }

    }
    trigger OnOpenPage()


    begin
        usersetup1.Reset();
        usersetup1.SetRange(usersetup1."User ID", UserId);
        if usersetup1.FindSet then begin

            usersetup2.Reset();
            usersetup2.SetRange(usersetup2."Change Role Center", true);
            if usersetup2.FindSet then begin
                rolecenteraccess := true;

            end;


        end


    end;

    var
        rolecenteraccess: Boolean;
        num1: Decimal;
        usersetup1: Record "User Setup";
        usersetup2: Record "User Setup";

}

