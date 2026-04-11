

pageextension 50095 "Time Sheet Ext" extends "Time Sheet Lines Subform"
{
    layout
    {
        addafter(Description)
        {

            field("Distribution Percentage"; Rec."Distribution Percentage")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Distribution Percentage field.';
            }
            field(Customer; Rec.Customer)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Donor field.';

            }
        }
        modify(Field1)
        {
            trigger OnBeforeValidate()
            begin
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(1);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(1);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if TimeSheetDetail.IsEmpty() then TimeSheetDetail.Quantity := 0;
                // if Celldata[1] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(1);
            end;
        }
        modify(Field2)
        {
            trigger OnBeforeValidate()
            begin
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(2);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(2);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if TimeSheetDetail.IsEmpty() then TimeSheetDetail.Quantity := 0;
                // if Celldata[2] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(2);
            end;
        }
        modify(Field3)
        {
            trigger OnBeforeValidate()
            begin
                // ValidateQuantity1(3);
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(3);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(3);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if Celldata[3].isempty() then TimeSheetDetail.Quantity := 0;
                // if TimeSheetDetail.IsEmpty() then TimeSheetDetail.Quantity := 0;
                // if Celldata[3] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(3);
            end;
        }
        modify(Field4)
        {
            trigger OnBeforeValidate()
            begin
                // ValidateQuantity1(4);
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(4);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(4);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if TimeSheetDetail.IsEmpty() then TimeSheetDetail.Quantity := 0;
                // if Celldata[4] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(4);
            end;
        }
        modify(Field5)
        {
            trigger OnBeforeValidate()
            begin
                // ValidateQuantity1(5);
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(5);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(5);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if TimeSheetDetail.IsEmpty() then TimeSheetDetail.Quantity := 0;
                // if Celldata[5] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(5);
            end;
        }
        modify(Field6)
        {
            trigger OnBeforeValidate()
            begin
                // ValidateQuantity1(6);
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(6);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(6);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if TimeSheetDetail.IsEmpty() then TimeSheetDetail.Quantity := 0;
                // if Celldata[6] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(6);
            end;
        }
        modify(Field7)
        {
            trigger OnBeforeValidate()
            begin
                // ValidateQuantity1(7);
                CurrPage.SaveRecord();
                ValidateQuantityCustom1(7);
            end;

            trigger OnAfterValidate()
            begin
                // ValidateQuantity2(7);
                // if TimeSheetDetail.Quantity < 0 then TimeSheetDetail.Quantity := 0;
                // if Celldata[7] = 0 then TimeSheetDetail.Quantity := 0;
                CurrPage.SaveRecord();
                ValidateQuantityCustom(7);
            end;
        }
        addafter(Field7)
        {
            field(Field8; CellData[8])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[8];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(8);
                end;
            }
            field(Field9; CellData[9])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[9];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(9);
                end;
            }
            field(Field10; CellData[10])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[10];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(10);
                end;
            }
            field(Field11; CellData[11])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[11];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(11);
                end;
            }
            field(Field12; CellData[12])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[12];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(12);
                end;
            }
            field(Field13; CellData[13])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[13];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(13);
                end;
            }
            field(Field14; CellData[14])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[14];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(14);
                end;
            }
            field(Field15; CellData[15])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[15];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(15);
                end;
            }
            field(Field117; CellData[16])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[16];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(16);
                end;
            }
            field(Field17; CellData[17])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[17];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(17);
                end;
            }
            field(Field18; CellData[18])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[18];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(18);
                end;
            }
            field(Field19; CellData[19])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[19];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(19);
                end;
            }
            field(Field20; CellData[20])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[20];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(20);
                end;
            }
            field(Field21; CellData[21])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[21];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(21);
                end;
            }
            field(Field22; CellData[22])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[22];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(22);
                end;
            }
            field(Field23; CellData[23])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[23];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(23);
                end;
            }
            field(Field24; CellData[24])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[24];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(24);
                end;
            }
            field(Field25; CellData[25])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[25];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(25);
                end;
            }
            field(Field26; CellData[26])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[26];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(26);
                end;
            }
            field(Field27; CellData[27])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[27];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(27);
                end;
            }
            field(Field28; CellData[28])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[28];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(28);
                end;
            }
            field(Field29; CellData[29])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[29];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(29);
                end;
            }
            field(Field30; CellData[30])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[30];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(30);
                end;
            }
            field(Field31; CellData[31])
            {
                ApplicationArea = Jobs;
                BlankZero = true;
                CaptionClass = '3,' + ColumnCaption[31];
                ToolTip = 'Specifies the number of hours registered for this day.';
                DecimalPlaces = 0 : 2;
                Editable = AllowEdit;
                Width = 3;

                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                    ValidateQuantity(31);
                end;
            }
        }
    }
    actions
    {
        modify(Submit)
        {
            Visible = false;
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     if TimeSheetDetail
    //     // if CellData[ColumnNo] = 0 then
    //     //     TimeSheetDetail.Delete()
    // end;

    var
        TimeSheetDetail: Record "Time Sheet Detail";
        TimeSheetLine: Record "Time Sheet Line";
        ColumnRecords: array[32] of Record Date;
        TimeSheetMgt: Codeunit "Time Sheet Management";
        TimeSheetApprovalMgt: Codeunit "Time Sheet Approval Management";
        RefActionType: Option Submit,ReopenSubmitted,Approve,ReopenApproved,Reject;
        NoOfColumns: Integer;
        CellData: array[32] of Decimal;
        ColumnCaption: array[32] of Text[1024];
        UnitOfMeasureCode: Code[10];
        InvalidTypeErr: Label 'The type of time sheet line cannot be empty.';
        DimensionCaptionTok: Label 'Dimensions';
        TimeSheetDetailTemp: Record "Time Sheet Detail Temp";


    protected var
    // protected var
    //     TimeSheetHeader: Record "Time Sheet Header";
    //     ManagerTimeSheet: Boolean;
    //     SubmitLineEnabled: Boolean;
    //     ReopenSubmittedLineEnabled: Boolean;
    //     ApproveLineEnabled: Boolean;
    //     RejectLineEnabled: Boolean;
    //     ReopenApprovedLineEnabled: Boolean;
    //     AllowEdit: Boolean;

    local procedure ValidateQuantity(ColumnNo: Integer)
    var
        HRLeaveApplication: Record "HR Leave Application";
        Hours: Text[30];
        onLeave, Weekend, Holiday, Absent : boolean;
        TimeSheetHeader: Record "Time Sheet Header";
        CurrDate: Date;
    begin
        TimeSheetHeader.Reset();
        TimeSheetHeader.SetRange("No.", Rec."Time Sheet No.");
        if TimeSheetHeader.FindFirst() then begin
            Currdate := ColumnRecords[ColumnNo]."Period Start";
            HRLeaveApplication.Reset();
            HRLeaveApplication.SetRange("Employee No", TimeSheetHeader."Resource No.");
            HRLeaveApplication.SetFilter("Start Date", '<=%1', Currdate);
            HRLeaveApplication.SetFilter("End Date", '>=%1', Currdate);
            HRLeaveApplication.SetRange(Status, HRLeaveApplication.Status::Approved);
            if HRLeaveApplication.FindFirst() then begin
                // Hours := 'On ' + HRLeaveApplication."Leave Type";
                onLeave := true;
            end;
        end;

        if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") and (not onLeave) then
            Error(InvalidTypeErr);

        if TimeSheetDetail.Get(
             Rec."Time Sheet No.",
             Rec."Line No.",
             ColumnRecords[ColumnNo]."Period Start")
        then begin
            if CellData[ColumnNo] <> TimeSheetDetail.Quantity then
                TestTimeSheetLineStatus();
            ///For the purpose of reporting on nonworking days, empty days have to remain.
            //if CellData[ColumnNo] = 0 then
            //    TimeSheetDetail.Delete()
            //else begin

            TimeSheetDetail.Quantity := CellData[ColumnNo];
            TimeSheetDetail.Modify(true);
            //end;
        end else
            if CellData[ColumnNo] <> 0 then begin
                TestTimeSheetLineStatus();

                TimeSheetDetail.Init();
                TimeSheetDetail.CopyFromTimeSheetLine(Rec);
                TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                TimeSheetDetail.Quantity := CellData[ColumnNo];
                TimeSheetDetail.Insert(true);
            end;

        Rec.CalcFields("Total Quantity");
        CurrPage.Update(false);
    end;

    local procedure ValidateQuantity2(ColumnNo: Integer)
    var
        HRLeaveApplication: Record "HR Leave Application";
        Hours: Text[30];
        onLeave, Weekend, Holiday, Absent : boolean;
        TimeSheetHeader: Record "Time Sheet Header";
        CurrDate: Date;
        Data: Integer;
    begin
        if (CellData[ColumnNo] = 0) then begin
            // Data := CellData[ColumnNo];
            TimeSheetHeader.Reset();
            TimeSheetHeader.SetRange("No.", rec."Time Sheet No.");
            if TimeSheetHeader.FindFirst() then begin
                Currdate := ColumnRecords[ColumnNo]."Period Start";
                HRLeaveApplication.Reset();
                HRLeaveApplication.SetRange("Employee No", TimeSheetHeader."Resource No.");
                HRLeaveApplication.SetFilter("Start Date", '<=%1', Currdate);
                HRLeaveApplication.SetFilter("End Date", '>=%1', Currdate);
                HRLeaveApplication.SetRange(Status, HRLeaveApplication.Status::Approved);
                if HRLeaveApplication.FindFirst() then begin
                    // Hours := 'On ' + HRLeaveApplication."Leave Type";
                    onLeave := true;
                end;
            end;

            if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") and (not onLeave) then
                Error(InvalidTypeErr);

            if TimeSheetDetail.Get(
                 Rec."Time Sheet No.",
                 Rec."Line No.",
                 ColumnRecords[ColumnNo]."Period Start")
            then begin
                if CellData[ColumnNo] <> TimeSheetDetail.Quantity then
                    TestTimeSheetLineStatus();
                ///For the purpose of reporting on nonworking days, empty days have to remain.
                //if CellData[ColumnNo] = 0 then
                //    TimeSheetDetail.Delete()
                //else begin

                // TimeSheetDetail.Quantity := CellData[ColumnNo];
                TimeSheetDetail.Quantity := Data;
                TimeSheetDetail.Modify(true);
                //end;
            end else
                if CellData[ColumnNo] <> 0 then begin
                    TestTimeSheetLineStatus();

                    TimeSheetDetail.Init();
                    TimeSheetDetail.CopyFromTimeSheetLine(Rec);
                    TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                    TimeSheetDetail.Quantity := Data;
                    TimeSheetDetail.Insert(true);
                end;

            Rec.CalcFields("Total Quantity");
            CurrPage.Update(false);
        end;
    end;

    local procedure ValidateQuantity1(ColumnNo: Integer)
    var
        HRLeaveApplication: Record "HR Leave Application";
        Hours: Text[30];
        onLeave, Weekend, Holiday, Absent : boolean;
        TimeSheetHeader: Record "Time Sheet Header";
        CurrDate: Date;
        Data: Integer;
    begin
        if (CellData[ColumnNo] = 0) then begin
            // Data := CellData[ColumnNo];
            Data := 0;
            TimeSheetHeader.Reset();
            TimeSheetHeader.SetRange("No.", Rec."Time Sheet No.");
            if TimeSheetHeader.FindFirst() then begin
                Currdate := ColumnRecords[ColumnNo]."Period Start";
                HRLeaveApplication.Reset();
                HRLeaveApplication.SetRange("Employee No", TimeSheetHeader."Resource No.");
                HRLeaveApplication.SetFilter("Start Date", '<=%1', Currdate);
                HRLeaveApplication.SetFilter("End Date", '>=%1', Currdate);
                HRLeaveApplication.SetRange(Status, HRLeaveApplication.Status::Approved);
                if HRLeaveApplication.FindFirst() then begin
                    // Hours := 'On ' + HRLeaveApplication."Leave Type";
                    onLeave := true;
                end;
            end;

            // if onLeave and (Rec.Type <> Rec.Type::" ") then begin
            //     CellData[ColumnNo] := 1;
            // end;


            // if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") and (not onLeave) then
            //     Error(InvalidTypeErr);

            // if TimeSheetDetail.Get(
            //      Rec."Time Sheet No.",
            //      Rec."Line No.",
            //      ColumnRecords[ColumnNo]."Period Start")
            // then begin
            //     if CellData[ColumnNo] <> TimeSheetDetail.Quantity then
            //         TestTimeSheetLineStatus();
            //     ///For the purpose of reporting on nonworking days, empty days have to remain.
            //     //if CellData[ColumnNo] = 0 then
            //     //    TimeSheetDetail.Delete()
            //     //else begin

            //     TimeSheetDetail.Quantity := CellData[ColumnNo];
            //     TimeSheetDetail.Modify(true);
            //     //end;
            // end else
            //     if CellData[ColumnNo] <> 0 then begin
            //         TestTimeSheetLineStatus();

            //         TimeSheetDetail.Init();
            //         TimeSheetDetail.CopyFromTimeSheetLine(Rec);
            //         TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
            //         TimeSheetDetail.Quantity := CellData[ColumnNo];
            //         TimeSheetDetail.Insert(true);
            //     end;

            Rec.CalcFields("Total Quantity");
            CurrPage.Update(false);
        end;
    end;

    procedure ValidateQuantityCustom(ColumnNo: Integer)
    begin
        if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") then
            Error(InvalidTypeErr);

        if TimeSheetDetail.Get(
             Rec."Time Sheet No.",
             Rec."Line No.",
             ColumnRecords[ColumnNo]."Period Start")
        then begin
            if CellData[ColumnNo] <> TimeSheetDetail.Quantity then begin
                TestTimeSheetLineStatus();

                if CellData[ColumnNo] = 0 then
                    // TimeSheetDetail.Delete()
                    TimeSheetDetailTemp.TransferFields(TimeSheetDetail);
            end else begin
                TimeSheetDetail.Quantity := CellData[ColumnNo];
                // OnValidateQuantityOnBeforeModifyTimeSheetDetail(TimeSheetDetail, Rec);
                TimeSheetDetail.Modify(true);
            end;
        end else
            if CellData[ColumnNo] <> 0 then begin
                TestTimeSheetLineStatus();

                TimeSheetDetail.Init();
                TimeSheetDetail.CopyFromTimeSheetLine(Rec);
                TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                TimeSheetDetail.Quantity := CellData[ColumnNo];
                TimeSheetDetail.Insert(true);
            end;

        Rec.CalcFields("Total Quantity");
        CurrPage.Update(false);
    end;



    procedure ValidateQuantityCustom1(ColumnNo: Integer)
    begin
        if (CellData[ColumnNo] <> 0) and (Rec.Type = Rec.Type::" ") then
            Error(InvalidTypeErr);

        if TimeSheetDetail.Get(
             Rec."Time Sheet No.",
             Rec."Line No.",
             ColumnRecords[ColumnNo]."Period Start")
        then begin
            if CellData[ColumnNo] <> TimeSheetDetail.Quantity then begin
                TestTimeSheetLineStatus();

                if CellData[ColumnNo] = 0 then
                    // TimeSheetDetail.Delete()
                    // TimeSheetDetailTemp := TimeSheetDetail;
                    TimeSheetDetail.TransferFields(TimeSheetDetailTemp);
            end else begin
                TimeSheetDetail.Quantity := CellData[ColumnNo];
                // OnValidateQuantityOnBeforeModifyTimeSheetDetail(TimeSheetDetail, Rec);
                TimeSheetDetail.Modify(true);
            end;
        end else
            if CellData[ColumnNo] <> 0 then begin
                TestTimeSheetLineStatus();

                TimeSheetDetail.Init();
                TimeSheetDetail.CopyFromTimeSheetLine(Rec);
                TimeSheetDetail.Date := ColumnRecords[ColumnNo]."Period Start";
                TimeSheetDetail.Quantity := CellData[ColumnNo];
                TimeSheetDetail.Insert(true);
            end;

        Rec.CalcFields("Total Quantity");
        CurrPage.Update(false);
    end;

    local procedure TestTimeSheetLineStatus()
    var
        TimeSheetLine: Record "Time Sheet Line";
    begin
        TimeSheetLine.Get(Rec."Time Sheet No.", Rec."Line No.");
        TimeSheetLine.TestStatus();
    end;

    procedure SetColumns1(TimeSheetNo: Code[20])
    var
        Calendar: Record Date;
    begin
        Clear(ColumnCaption);
        Clear(ColumnRecords);
        Clear(Calendar);
        Clear(NoOfColumns);

        GetTimeSheetHeader(TimeSheetNo);
        TimeSheetHeader.CalcFields("Unit of Measure");
        UnitOfMeasureCode := TimeSheetHeader."Unit of Measure";

        Calendar.SetRange("Period Type", Calendar."Period Type"::Date);
        Calendar.SetRange("Period Start", TimeSheetHeader."Starting Date", TimeSheetHeader."Ending Date");
        if Calendar.FindSet() then
            repeat
                NoOfColumns += 1;
                ColumnRecords[NoOfColumns]."Period Start" := Calendar."Period Start";
                ColumnCaption[NoOfColumns] := TimeSheetMgt.FormatDate(Calendar."Period Start", 1);
            until Calendar.Next() = 0;
    end;

    local procedure GetTimeSheetHeader(TimeSheetNo: Code[20])
    begin
        TimeSheetHeader.Get(TimeSheetNo);
    end;

    local procedure UpdateControls()
    var
        i: Integer;
    begin
        i := 0;
        while i < NoOfColumns do begin
            i := i + 1;
            if (Rec."Line No." <> 0) and TimeSheetDetail.Get(
                 Rec."Time Sheet No.",
                 Rec."Line No.",
                 ColumnRecords[i]."Period Start")
            then
                CellData[i] := TimeSheetDetail.Quantity
            else
                CellData[i] := 0;
        end;
        AllowEdit := Rec.Status in [Rec.Status::Open, Rec.Status::Rejected];

        SubmitLineEnabled := Rec.Status = Rec.Status::Open;
        ReopenSubmittedLineEnabled := Rec.Status in [Rec.Status::Submitted, Rec.Status::Rejected];
        ApproveLineEnabled := Rec.Status = Rec.Status::Submitted;
        RejectLineEnabled := Rec.Status = Rec.Status::Submitted;
        ReopenApprovedLineEnabled := Rec.Status in [Rec.Status::Approved, Rec.Status::Rejected];
    end;

    var
        Editable: array[32] of Boolean;


    // [IntegrationEvent(true, false)]
    // local procedure OnValidateQuantityOnBeforeModifyTimeSheetDetail(var TimeSheetDetail: Record "Time Sheet Detail"; TimeSheetLine: Record "Time Sheet Line");
    // begin
    // end;
}




