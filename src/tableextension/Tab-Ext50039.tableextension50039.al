#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50039 "tableextension50039" extends "Standard Purchase Line"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Standard Purchase Code"(Field 1)".


        //Unsupported feature: Property Modification (Editable) on ""Line No."(Field 2)".


        //Unsupported feature: Property Modification (Data type) on "Description(Field 5)".


        //Unsupported feature: Code Modification on ""No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Quantity := 0;
        "Amount Excl. VAT" := 0;
        "Unit of Measure Code" := '';
        Description := '';
        #5..44
              Description := ItemCharge.Description;
            END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        {Quantity := 0;
        #2..47
        }
        */
        //end;
        field(50005; "Item Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
    }
}

