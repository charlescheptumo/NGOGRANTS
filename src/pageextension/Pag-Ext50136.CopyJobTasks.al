pageextension 50136 "Pag-Ext50136" extends "Copy Job Tasks"
{
    Caption = 'Copy Budget Tasks';
    layout 
    {
        modify(SourceJobNo)
        {
            Caption = 'Budget No.';
        }
        modify(FromJobTaskNo)
        {
            Caption = 'Budget Task No. from';
        }
        modify(ToJobTaskNo)
        {
            Caption = 'Budget Task No. to';
        }
        modify(TargetJobNo)
        {
            Caption = 'Budget No.';
        }
    }
}
