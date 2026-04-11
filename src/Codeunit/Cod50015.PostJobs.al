codeunit 50015 "Post Jobs"
{
    // Subtype = Test;
    // [Test]
    // [TestPermissions(TestPermissions::NonRestrictive)]
    procedure PostJobs(GLEntries: Record "G/L Entry")
    begin
        // if GLEntries.Get(GLEntries."G/L Account No.") then begin
        GLEntries.Init();
        GLEntries.Modify(true);
        if GLEntries.Get() then begin
            GLEntries."Job Quantity" := 1;
            // GenJnLine."Job No." := PVLines.Project;
            // GenJnLine."Job Task No." := PVLines."Job Task No.";

            // GenJnLine.Validate(GenJnLine."Job No.");
            // GenJnLine.Validate(GenJnLine."Job Task No.");
            // GenJnLine.Validate(GenJnLine."Job Quantity");
        end;
    end;

}
