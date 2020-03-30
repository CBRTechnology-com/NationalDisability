tableextension 60001 ExtendCustomerLedger extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(60000; "Contact No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(60001; "Contact Name"; text[100])
        {
            DataClassification = ToBeClassified;
        }

    }

    var
        myInt: Integer;
}