table 50032 "Sharepoint Connector Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Client ID"; Text[250])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(3; "Client Secret"; Text[250])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; "Sharepoint URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Scope; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; FileName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Directory; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(8; "Purchase requisition"; Text[50])
        {

        }
        field(9; "Leave Application"; Text[50])
        {

        }
        field(10; "Payment Voucher"; Text[50])
        {

        }
        field(11; "Bank Reconciliation"; Text[50])
        {

        }
        field(12; Imprest; Text[50])
        {

        }
        field(13; "Imprest Surrender"; Text[50])
        {

        }
        field(14; "Petty Cash"; Text[50])
        {

        }
        field(15; "Bank Transfer"; Text[50])
        {

        }
        field(16; "Salary Advance"; Text[50])
        {

        }
        field(17; "Warrant Voucher"; Text[50])
        {

        }
        field(18; "staff Claims"; Text[50])
        {

        }
        field(19; "Payment Schedule"; Text[50])
        {

        }
        field(20; "Transport Requisition"; Text[50])
        {

        }
        field(21; "sclaims"; Text[50])
        {

        }
        field(22; "Salary Voucher"; Text[50])
        {

        }
        field(23; "Temp Salary Voucher"; Text[50])
        {

        }

        field(24; "Grant Funding Application"; Text[50])
        {

        }

        field(25; "Procurement"; Text[50])
        {

        }
        field(26; "File Movement"; Text[50])
        {

        }
        field(27; "Receipt Processing"; Text[50])
        {

        }
        field(28; "RFI"; Text[50])
        {

        }
        field(29; "Vend Debarment"; Text[50])
        {

        }
        field(30; "Project Funding Request"; Text[50])
        {

        }
        field(31; "ICT Issuance"; Text[50])
        {

        }
        field(32; "Recruitment Requisition"; Text[50])
        {

        }
        field(33; "Vacancy Announcement"; Text[50])
        {

        }
        field(34; "HR Leave"; Text[50])
        {

        }
        field(35; IFS; Text[50])
        {

        }
        field(36; "Petty Cash Surrender"; Text[50])
        {

        }
        field(37; "Standing Imprest"; Text[50])
        {

        }
        field(38; "Standing Imprest Surrender"; Text[50])
        {

        }
        field(39; Employee; Text[50])
        {

        }
        field(40; "Job Application"; Text[50])
        {

        }
        field(41; "Sub Contract Extension"; Text[50])
        {

        }
        field(42; Vacancy; Text[50])
        {

        }
        field(43; "Sub Award Contract"; Text[50])
        {

        }
        field(44; "Candidate Selection Panel"; Text[50])
        {

        }
        field(45; RFQ; Text[50])
        {

        }
        field(46; "Notice of Award"; Text[50])
        {

        }
        field(47; "Evaluation Report"; Text[50])
        {

        }
        field(48; Prequalification; Text[50])
        {

        }
        field(49; "Vendor Registration Card"; Text[50])
        {

        }
        field(50; "Dept Procurement Card"; Text[50])
        {

        }
        field(51; "Procurement Plan Card"; Text[50])
        {

        }
        field(52; "IFP Card"; Text[50])
        {

        }
        field(53; "Prequalification Score Card"; Text[50])
        {

        }
        field(54; "Tender Addendum Notice Card"; Text[50])
        {

        }
        field(55; "IFS Prebid Register Card"; Text[50])
        {

        }
        field(56; "Clustered Tender Committee"; Text[50])
        {

        }
        field(57; "IFS Tender Committee Card"; Text[50])
        {

        }
        field(58; "Bid Response Card"; Text[50])
        {

        }
        field(59; "Bid Evaluation Template Card"; Text[50])
        {

        }
        field(60; "Bid Evaluation Register Card"; Text[50])
        {

        }
        field(61; "Technical Bid Evaluation Card"; Text[50])
        {

        }
        field(62; "Financial Bid Evaluation Card"; Text[50])
        {

        }
        field(63; "Vendor Due Diligence Voucher"; Text[50])
        {

        }
        field(64; "Project Contract"; Text[50])
        {

        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}