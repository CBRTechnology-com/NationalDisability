codeunit 61000 ExtendCodeunitEventCBR
{
    trigger OnRun()
    begin

    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterUpdateSalesHeader', '', true, true)]
    local procedure UpdateCLE(VAR CustLedgerEntry: Record "Cust. Ledger Entry"; VAR SalesInvoiceHeader: Record "Sales Invoice Header"; VAR SalesCrMemoHeader: Record "Sales Cr.Memo Header"; GenJnlLineDocType: Integer)
    var
        Contactrec: Record Contact;
    begin
        if Contactrec.get(SalesInvoiceHeader."Sell-to Contact No.") then begin
            CustLedgerEntry."Contact No" := Contactrec."No.";
            CustLedgerEntry."Contact Name" := Contactrec.Name;
            CustLedgerEntry.Modify();

        end;
    end;

}