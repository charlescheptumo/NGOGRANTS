#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// TableExtension tableextension50038 (ID 50038) extends Record Standard Purchase Code.
/// </summary>
TableExtension 50038 "tableextension50038" extends "Standard Purchase Code"
{
    fields
    {

        //Unsupported feature: Property Insertion (DataClassification) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Description) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (Editable) on "Code(Field 1)".


        //Unsupported feature: Property Insertion (DataClassification) on "Description(Field 2)".


        //Unsupported feature: Property Insertion (DataClassification) on ""Currency Code"(Field 3)".


        //Unsupported feature: Code Insertion on "Code(Field 1)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF Code <> xRec.Code THEN BEGIN
          PurchSetup.GET;
          NoSeriesMgt.TestManual(PurchSetup."ITT No. Series");
          "No. Series" := '';
        END;
        */
        //end;

        //Unsupported feature: Property Deletion (NotBlank) on "Code(Field 1)".



        //Unsupported feature: Code Insertion on "Description(Field 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        {IF Purchheader.GET(Description)THEN
          BEGIN
            Description:=Purchheader.Description;
            END}
        */
        //end;
        field(70000; "Procurement Method"; Enum "Procurement Method")
        {
            DataClassification = ToBeClassified;
            //OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction,Public Private Partnership';
            //OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction","Public Private Partnership";
        }
        field(70001; "Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'When the Solicitation Type is selcted, the system shall auto-populate the Bid Selection Method and Procurement Method fields';
            TableRelation = "Solicitation Type".Code;
        }
        field(70002; "External Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70003; "Procurement Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Types".Code;
        }
        field(70004; "Procurement Category ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code;
        }
        field(70005; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(70006; "Assigned Procurement Officer"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to record the assigned Procurement Officer. Mapped to Sales Person/Purchaser table (Filter Role type: Procurement Officer)';
            TableRelation = "Salesperson/Purchaser".Code where("Role Type" = const("Procurement Officer"));
        }
        field(70007; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where("Record Type" = const("Road Asset"));

            trigger OnValidate()
            begin
                Roads.Reset;
                Roads.SetRange("No.", "Road Code");
                if Roads.FindSet then
                    "Road Link Name" := Roads.Description
            end;
        }
        field(70008; "Road Link Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70009; "Constituency ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(70010; "Requesting Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(70011; "Requesting Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70012; "Requesting Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Requesting Directorate"));
        }
        field(70013; "Engineer Estimate (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is based on estimates for Works that usuallly guide bidders/contarctors in specialized industries such as Road construction';
        }
        field(70014; "Tender Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70015; "Tender Summary"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70016; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70017; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            //Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(70100; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(70101; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = ToBeClassified;
        }
        field(70102; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(70103; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(70104; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(70105; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(70106; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(70107; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //       if Char.IsLetter("Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(70108; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            Description = 'Copy default Procurement Email from E-Procurement Setup Table';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(70109; "Tender Box Location Code"; Code[50])
        {
            Caption = 'Tender Box Location Code';
            DataClassification = ToBeClassified;
        }
        field(70110; "Bid Charge Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Charges Schedule".Code;

            trigger OnValidate()
            begin
                IFSfee.Reset;
                IFSfee.SetRange(Code, "Bid Charge Code");
                if IFSfee.FindSet then begin
                    "Bid Charge (LCY)" := IFSfee.Amount
                end;
            end;
        }
        field(70111; "Bid Charge (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70112; "Bid Charge Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                Bank.Reset;
                Bank.SetRange("No.", "Bid Charge Bank Code");
                if Bank.FindSet then begin
                    "Bank Name" := Bank.Name;
                    "Bank Account Name" := Bank.Name;
                    "Bid Charge Bank Branch" := Bank."Bank Branch Name";
                    "Bid Charge Bank A/C No" := Bank."Bank Account No.";
                end;
            end;
        }
        field(70113; "Bank Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70114; "Bank Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70115; "Bid Charge Bank Branch"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70116; "Bid Charge Bank A/C No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70117; Published; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70118; "Created by"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70119; "Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70120; "Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70121; "Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Tender Validity Expiry Date" := CalcDate("Tender Validity Duration", "Submission End Date");
                "Bid Security Expiry Date" := CalcDate("Bid Security Validity Duration", "Submission End Date");
            end;
        }
        field(70122; "Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70123; "No. of Submission"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70124; "Enforce Mandatory E-Receipt"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70125; "Bid Document Template"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Document Template"."Template ID";
        }
        field(70126; "Display Scoring Criteria Vendo"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70127; "Bid Scoring Template"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Scoring Template".Code;
        }
        field(70128; "Created Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70129; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(70130; "Invitation Notice Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Single  Stage Tender,Two Stage Tender,RFQ,Low Value Procurement';
            OptionMembers = ,"Single  Stage Tender","Two Stage Tender",RFQ,"Low Value Procurement";
        }
        field(70131; "Bid Envelop Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '1-Envelop,2-Envelop';
            OptionMembers = "1-Envelop","2-Envelop";
        }
        field(70132; "Sealed Bids"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70133; "PRN No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Purchase Requisition"),
                                                           Status = const(Released));

            trigger OnValidate()
            var
                PurHeader: Record "Purchase Header";
            begin
                PurHeader.Reset();
                PurHeader.SetRange("No.", PurHeader."No.");
                // PurHeader.SetRange(PurHeader."Document Type"::"Purchase Requisition");
                if PurHeader.Find('-') then begin
                    "Procurement Plan ID" := PurHeader."Procurement Plan ID";
                    "Procurement Plan Entry No" := PurHeader."Procurement Plan Entry No";
                    "PP Planning Category" := PurHeader."PP Planning Category";
                    "PP Funding Source ID" := PurHeader."PP Funding Source ID";
                    "PP Total Budget" := PurHeader."PP Total Budget";
                    "PP Total Actual Costs" := PurHeader."PP Total Actual Costs";
                    "PP Total Commitments" := PurHeader."PP Total Commitments";
                    "PP Total Available Budget" := PurHeader."PP Total Available Budget";
                    "PP Preference/Reservation Code" := PurHeader."PP Preference/Reservation Code";
                end;
            end;
        }
        field(70134; "Bid Submission Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Manual Bids,Hybrid (Electronic Summary+Hardcopy Submissions),Fully E-Bid';
            OptionMembers = "Manual Bids","Hybrid (Electronic Summary+Hardcopy Submissions)","Fully E-Bid";
        }
        field(70135; "Lot No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field used to track the different Lots for a given tender. On the system, each tender lot shall be created as a separate Tender record but the Lot No used for informational and tracking purposes only';
        }
        field(70136; "LCY Currency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to General Ledger Setup (LCY Code)';
            TableRelation = Currency.Code;
        }
        // field(70137; "Works Category"; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Works Category".Code;
        // }
        field(70138; "Annual Procurement Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field auto-populated based on selected PP Entry No';
            TableRelation = "Procurement Plan".Code;
        }
        field(70139; "Procurement Plan Line No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Field auto-populated based on selected PP Entry No';
        }
        field(70140; "Procurement Plan Entry No1"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Mapped to Procurement Plan Entry No Table';
            TableRelation = "Procurement Plan Entry"."Entry No.";
        }
        field(70141; "Financial Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Procurement Plan.Financial Year Code';
            Editable = false;
            TableRelation = "Financial Year Code".Code;
        }
        field(70142; "Budget Narration"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70143; "Available Procurement Budget"; Decimal)
        {
            Caption = 'Available Procurement Budget (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Linked to PP ENtry';
        }
        field(70144; "Publish Engineers Estimate"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine whether the Engineers Estimate should be published or not. When this is being activated, the system checks to ensure that the Estimate is equal to or less than the stated available budget. If it exceeds the budget, the user is notified and an error notification message is generated';
        }
        field(70145; "Procuring Entity Name/Contact"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70146; "Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70147; "Bid Opening Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70148; "Bid Opening Venue"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70149; "Tender Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70150; "Tender Validity Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70151; "Enforce Mandatory Pre-bid Visi"; Boolean)
        {
            Caption = 'Enforce Mandatory Pre-bid Visit/Meeting';
            DataClassification = ToBeClassified;
            Description = 'Enforce Mandatory Pre-bid Visit/Meeting';
        }
        field(70152; "Mandatory Pre-bid Visit Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70153; "Domestic Bidder Preference"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70154; "Mandatory Special Group Reserv"; Boolean)
        {
            Caption = 'Mandatory Special Group Reserved';
            DataClassification = ToBeClassified;
        }
        field(70155; "Bid/Tender Security Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70156; "Bid Security %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(70157; "Bid Security Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70158; "Special Group Bid Security"; Boolean)
        {
            Caption = 'Special Group Bid Security Waiver';
            DataClassification = ToBeClassified;
            Description = ' Waiver';
        }
        field(70159; "Bid Security Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70160; "Bid Security Expiry Date"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
            Editable = false;
        }
        field(70161; "Insurance Cover Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70162; "Performance Security Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70500; "Performance Security %"; Decimal)
        {
            Caption = 'Performance Security % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Performance Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70501; "Special Group Performance Secu"; Boolean)
        {
            Caption = 'Special Group Performance Security Waiver';
            DataClassification = ToBeClassified;
            Description = 'Special Group Performance Security Waiver';
        }
        field(70502; "Advance Payment Security Req"; Boolean)
        {
            Caption = 'Advance Payment Security Required';
            DataClassification = ToBeClassified;
            Description = 'Advance Payment Security Required';
        }
        field(70503; "Advance Payment Security %"; Decimal)
        {
            Caption = 'Advance Payment Security % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Advance Payment Security % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70504; "Advance Amount Limit %"; Decimal)
        {
            Caption = 'Advance Amount Limit % (Of Bid Sum)';
            DataClassification = ToBeClassified;
            Description = 'Advance Amount Limit % (Of Bid Sum)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70221; "Max Works Kickoff Duration"; Code[10])
        {
            Caption = 'Max Works Kickoff Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Kickoff Duration (After Contract/Order)';
        }
        field(70222; "Max Works Charter Duration"; Code[10])
        {
            Caption = 'Max Works Charter/Program Duration (After Contract/Order)';
            DataClassification = ToBeClassified;
            Description = 'Max Works Charter/Program Duration (After Contract/Order)';
        }
        field(70223; "Max Works Completion Duration"; Code[10])
        {
            Caption = 'Max Works Completion Duration (After Contract/Order';
            DataClassification = ToBeClassified;
            Description = 'Max Works Completion Duration (After Contract/Order';
        }
        field(70224; "Payment Terms Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Used to determine duration within which settlements shall be done for invoiced/completed works (submission of payment certificate for Works). It is linked to the Payment Terms table (T3)';
            TableRelation = "Payment Terms".Code;
        }
        field(70225; "Defects Liability Period"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Defects Liability (Warranty) Period';
        }
        field(70226; "Daily Liquidated Dam Unit Cost"; Decimal)
        {
            Caption = 'Daily Liquidated Damages Unit Cost (LCY)';
            DataClassification = ToBeClassified;
            Description = 'Daily Liquidated Damages Unit Cost (LCY)';
        }
        field(70169; "Liquidated Damages Limit %"; Decimal)
        {
            Caption = 'Liquidated Damages Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Liquidated Damages Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70170; "Payment Retention %"; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(70171; "Retention Amount Limit %"; Decimal)
        {
            Caption = 'Retention Amount Limit % (Contract Value)';
            DataClassification = ToBeClassified;
            Description = 'Retention Amount Limit % (Contract Value)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(70172; "Min Interim Certificate Amount"; Decimal)
        {
            Caption = 'Minimum Interim Certificate Amount (LCY)';
            DataClassification = ToBeClassified;
        }
        field(70173; "Appointer of Bid Arbitrator"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(70174; "Display Scoring Criteria Vend"; Boolean)
        {
            Caption = 'Display Scoring Criteria to Vendors';
            DataClassification = ToBeClassified;
            Description = 'Display Scoring Criteria to Vendors';
        }
        field(70175; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(70176; "Cancel Reason Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Tender Cancel Reason Code".Code;
        }
        field(70177; "Parent Invitation No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'It shall be used to track the Parent ITT in case an Addendum has been done. When the user creates an addendum, the system shall require them to map it to the original ITT (System creates a new ITT that references, the original ITT, and then blocks the Parent ITT. A user can view all the Addenda against a Parent ITT)';
        }
        field(70178; "Target Bidder Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'All Bidders,Local Bidders,International Bidders';
            OptionMembers = "All Bidders","Local Bidders","International Bidders";
        }
        field(70179; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use As In-Transit" = const(false));

            trigger OnValidate()
            begin
                /*TestStatusOpen;
                IF ("Location Code" <> xRec."Location Code") AND
                   (xRec."Buy-from Vendor No." = "Buy-from Vendor No.")
                THEN
                  MessageIfPurchLinesExist(FIELDCAPTION("Location Code"));
                
                UpdateShipToAddress;
                
                IF "Location Code" = '' THEN BEGIN
                  IF InvtSetup.GET THEN
                    "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
                END ELSE BEGIN
                  IF Location.GET("Location Code") THEN;
                  "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                END;
                */

            end;
        }
        field(70180; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                TestStatusOpen;
                if not UserSetupMgt.CheckRespCenter(1, "Responsibility Center") then
                    Error(
                      Text028,
                      RespCenter.TableCaption, UserSetupMgt.GetPurchasesFilter);

                "Location Code" := UserSetupMgt.GetLocation(1, '', "Responsibility Center");


                UpdateAddress("Responsibility Center");
            end;
        }
        field(70181; "Requisition Product Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(70182; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            DataClassification = ToBeClassified;
            TableRelation = Language;

            trigger OnValidate()
            begin
                //MessageIfPurchLinesExist(FIELDCAPTION("Language Code"));
            end;
        }
        field(70183; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
                /*ValidatePurchaserOnPurchHeader(Rec,FALSE,FALSE);
                
                ApprovalEntry.SETRANGE("Table ID",DATABASE::"Purchase Header");
                ApprovalEntry.SETRANGE("Document Type","Document Type");
                ApprovalEntry.SETRANGE("Document No.","No.");
                ApprovalEntry.SETFILTER(Status,'%1|%2',ApprovalEntry.Status::Created,ApprovalEntry.Status::Open);
                IF NOT ApprovalEntry.ISEMPTY THEN
                  ERROR(Text042,FIELDCAPTION("Purchaser Code"));
                
                CreateDim(
                  DATABASE::"Salesperson/Purchaser","Purchaser Code",
                  DATABASE::Vendor,"Pay-to Vendor No.",
                  DATABASE::Campaign,"Campaign No.",
                  DATABASE::"Responsibility Center","Responsibility Center");*/

            end;
        }
        field(70184; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(70185; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 1 Code":="Global Dimension 1 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                
                PurchaseReqDet.VALIDATE(PurchaseReqDet."No."); */

            end;
        }
        field(70186; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                 END;*/

            end;
        }
        field(70187; "Global Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Dimen := "Global Dimension 3 Code";
                Dimen := CopyStr(Dimen, 1, 3);
                "Global Dimension 2 Code" := Dimen;
                Dimens := "Global Dimension 3 Code";
                Dimens := CopyStr(Dimens, 1, 1);
                "Global Dimension 1 Code" := Dimens;

                /*PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }  */

            end;
        }
        field(70188; "Primary Tender Submission"; Text[80])
        {
            Caption = 'Primary Tender Submission Address';
            DataClassification = ToBeClassified;
            Description = 'Primary Tender Submission Address';
        }
        field(70189; "Primary Engineer Contact"; Text[80])
        {
            Caption = 'Primary Engineer Contact Address';
            DataClassification = ToBeClassified;
            Description = 'Primary Engineer Contact Address';
        }
        field(70190; "Cancellation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70191; "Cancellation Secret Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(70192; "Bid Opening Committe"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(70193; "Bid Evaluation Committe"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Tender Committee"."Document No.";
        }
        field(70194; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(70195; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(70196; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70197; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70198; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Job;

            trigger OnValidate()
            var
                JobRec: Record Job;
            begin
                /*IF JobRec.GET(Job) THEN BEGIN
                  "Job Name":=JobRec.Description;
                  Approver:=JobRec."Project Manager";
                
                END;
                */

            end;
        }
        field(70199; "Requisition Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code;
        }
        field(70200; "Procurement Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            // Editable = false;
            // TableRelation = "Procurement Plan".Code;
        }
        field(70201; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            // Editable = false;

            // trigger OnValidate()
            // begin
            //     PPlanEntry.Reset;
            //     PPlanEntry.SetRange("Entry No.", "Procurement Plan Entry No");
            //     if PPlanEntry.Find('-') then begin
            //         "PP Planning Category" := PPlanEntry."Planning Category";
            //         "PP Funding Source ID" := PPlanEntry."Funding Source ID";
            //         "PP Total Budget" := PPlanEntry."Available Procurement Budget";
            //         "PP Total Actual Costs" := PPlanEntry."Total Actual Costs";
            //         "PP Total Commitments" := PPlanEntry."Total Purchase Commitments";
            //         "PP Solicitation Type" := PPlanEntry."Solicitation Type";
            //         "PP Procurement Method" := PPlanEntry."Procurement Method";
            //         "PP Preference/Reservation Code" := PPlanEntry."Preference/Reservation Code";


            //     end;
            // end;
        }
        field(70202; "PP Planning Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            // TableRelation = "Procurement Plan Entry"."Planning Category";
        }
        field(70203; "PP Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            // TableRelation = "Funding Source".Code;
        }
        field(70204; "PP Total Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70205; "PP Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70206; "PP Total Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70207; "PP Total Available Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70208; "Stage 1 EOI Invitation"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information";
        }
        field(70209; "Prebid Meeting Address"; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(70210; "Prebid Meeting Register ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFS Prebid Register";
        }
        field(70211; "Date/Time Published"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70212; "Cancelled By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70213; "PP Solicitation Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Solicitation Type".Code;
        }
        field(70214; "PP Procurement Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(70062; "PP Preference/Reservation Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Special Vendor Category".Code;
        }
        field(70066; "Bid Selection Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bid Selection Method".Code;
        }
        field(70067; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job),
                                                             "Job Task Type" = const(Posting));

            trigger OnValidate()
            begin
                /*
                TESTFIELD("Receipt No.",'');
                
                IF "Job Task No." <> xRec."Job Task No." THEN BEGIN
                  VALIDATE("Job Planning Line No.",0);
                  IF "Document Type" = "Document Type"::Order THEN
                    TESTFIELD("Quantity Received",0);
                END;
                
                IF "Job Task No." = '' THEN BEGIN
                  CLEAR(JobJnlLine);
                  "Job Line Type" := "Job Line Type"::" ";
                  UpdateJobPrices;
                  EXIT;
                END;
                
                JobSetCurrencyFactor;
                IF JobTaskIsSet THEN BEGIN
                  CreateTempJobJnlLine(TRUE);
                  UpdateJobPrices;
                END;
                UpdateDimensionsFromJobTask;
                
                */

            end;
        }
        field(70068; "Sent Cancellation Secret Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70215; "Sealed Bids (Technical)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70216; "Sealed Bids (Financial)"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70217; "Bid Opening Register"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70218; "Finance Opening Register"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70219; "Finance Bid Opening Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Insertion on "OnInsert".

    //trigger OnInsert()
    //begin
    /*
    IF Code = '' THEN BEGIN
      PurchSetup.GET;
      PurchSetup.TESTFIELD("ITT No. Series");
      NoSeriesMgt.InitSeries(PurchSetup."ITT No. Series",xRec.Code,0D,Code,"No. Series");

    END;


    "Created by":=USERID;
    "Created Date/Time":=CURRENTDATETIME;
    ProcSetup.GET;
    "Tender Validity Duration":=ProcSetup."Tender Validity Duration";
    */
    //end;
    trigger OnBeforeInsert()
    begin
        IF Code = '' THEN BEGIN
            PurchSetup.GET;
            PurchSetup.TESTFIELD("ITT No. Series");
            code := NoSeriesMgt.GetNextNo(PurchSetup."ITT No. Series", WorkDate(), TRUE);
            //NoSeriesMgt.InitSeries(PurchSetup."ITT No. Series", xRec.Code, 0D, Code, "No. Series");
            "Procurement Method" := "Procurement Method"::RFQ;

        END;


        "Created by" := USERID;
        "Created Date/Time" := CURRENTDATETIME;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        // "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2','',Code),
        //     "Global Dimension 1 Code","Global Dimension 2 Code");

        /*IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF PurchLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    procedure TestStatusOpen()
    begin
        OnBeforeTestStatusOpen;



        TestField(Status, Status::Open);

        OnAfterTestStatusOpen;
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeTestStatusOpen()
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterTestStatusOpen()
    begin
    end;

    procedure UpdateAddress(Respcode: Code[10])
    var
        Resp: Record "Responsibility Center";
    begin
        Resp.Reset;
        Resp.SetRange(Code, Respcode);
        if Resp.FindSet then begin

            "Procuring Entity Name/Contact" := Resp.Name;
            Validate(Address, Resp.Address);
            Validate("Address 2", Resp."Address 2");
            Validate("Post Code", Resp."Post Code");
            Validate(City, Resp.City);
            Validate("Country/Region Code", Resp."Country/Region Code");
            Validate("Phone No.", Resp."Phone No.");
            Validate("E-Mail", Resp."E-Mail");

        end;
    end;

    var
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'You cannot enter letters in this field.';
        Dimen: Text;
        Dimens: Text;
        DimMgt: Codeunit DimensionManagement;
        PurchSetup: Record "Procurement Setup";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetupMgt: Codeunit "User Setup Management";
        Text028: label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        InvtSetup: Record "Inventory Setup";
        PPlanEntry: Record "Procurement Plan Entry";
        IFSfee: Record "Bid Charges Schedule";
        Bank: Record "Bank Account";
        Roads: Record "Fixed Asset";
        PPReservation: Record "PP Purchase Activity Schedule";
        ProcSetup: Record "Procurement Setup";
}

