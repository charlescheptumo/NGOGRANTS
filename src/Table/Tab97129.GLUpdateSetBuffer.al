table 97129 "GL Update Set Buffer"
{
    Caption = 'GL Update Set Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "GL Update Entry No."; Integer)
        {
            TableRelation = "Update GL Entries"."Entry No.";
        }

        field(2; "GL Update Set ID"; Integer)
        {
            TableRelation = "GL Update Set Entry"."GL Update Set ID";
        }

        field(3; "Target Set ID"; Integer)
        {
            TableRelation = "GL Update Set Entry"."GL Update Set ID";
        }

        field(4; "Multiple Target Set ID"; Boolean)
        {
        }

        field(5; "Ledger Entries"; Blob)
        {
        }
    }

    keys
    {
        key(Key1; "GL Update Entry No.", "GL Update Set ID")
        {
            Clustered = true;
        }

        key(Key2; "GL Update Entry No.", "Target Set ID")
        {
        }
        key(Key3; "GL Update Entry No.", "Multiple Target Set ID")
        {
        }
    }

    procedure AddLedgerEntry(EntryNo: Integer)
    var
        LedgerEntries: Text;
    begin
        LedgerEntries := GetSetLedgerEntries();
        LedgerEntries += StrSubstNo(LedgerEntryNoFormatTxt, EntryNo);
        SetLedgerEntries(LedgerEntries);
    end;

    procedure ContainsLedgerEntry(EntryNo: Integer): Boolean
    var
        LedgerEntries: Text;
    begin
        LedgerEntries := GetSetLedgerEntries();
        exit(LedgerEntries.Contains(StrSubstNo(LedgerEntryNoFormatTxt, EntryNo)));
    end;

    procedure SetLedgerEntries(LedgerEntries: Text)
    var
        LedgerEntriesOutStream: OutStream;
    begin
        Rec."Ledger Entries".CreateOutStream(LedgerEntriesOutStream);
        LedgerEntriesOutStream.WriteText(LedgerEntries);
    end;

    procedure GetSetLedgerEntries(): Text;
    var
        LedgerEntriesInStream: InStream;
        LedgerEntries: Text;
    begin
        Rec.CalcFields("Ledger Entries");
        Rec."Ledger Entries".CreateInStream(LedgerEntriesInStream);
        LedgerEntriesInStream.ReadText(LedgerEntries);
        exit(LedgerEntries);
    end;

    var
        LedgerEntryNoFormatTxt: Label ';%1;', Locked = true, Comment = '%1 Entry No.';
}
