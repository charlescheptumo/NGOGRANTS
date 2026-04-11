tableextension 50148 "Default Dimension Ext" extends "Default Dimension"
{
    trigger OnAfterInsert()
    begin
        GeneralLedgerSetup.Get();
        if "Dimension Code" = GeneralLedgerSetup."Shortcut Dimension 3 Code" then
            UpdateGlobalDimCode(3, "Table ID", "No.", "Dimension Value Code");
    end;

    var
    GeneralLedgerSetup: Record "General Ledger Setup";
}
