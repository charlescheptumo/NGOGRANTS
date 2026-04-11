pageextension 50147 "Acc. Schedule Overview Ext" extends "Acc. Schedule Overview"
{
    layout
    {
        modify(Dim3Filter)
        {
            Visible = true;
            Editable = true;

            trigger OnAfterAfterLookup(Selected: RecordRef)
            begin
                // "Dimension 3 Filter"
            end;
        }

    }

    var
    // Dim3Filter := true;
}
