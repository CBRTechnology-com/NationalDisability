pageextension 60000 MyExtension extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Salesperson Code")
        {
            field("Contact No"; "Contact No")
            {
                ApplicationArea = all;
            }
            field("Contact Name"; "Contact Name")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("Apply Entries")
        {
            action("Update Data")
            {
                ApplicationArea = All;
                Caption = 'Update Contact Name';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Process;
                trigger OnAction()
                var
                    CLE: Record "Cust. Ledger Entry";
                    SIH: Record "Sales Invoice Header";
                    contactrec: Record Contact;
                begin
                    cle.Reset();
                    cle.SetRange("Document Type", cle."Document Type"::Invoice);
                    if cle.FindFirst() then
                        repeat
                            if SIH.get(cle."Document No.") then begin
                                if contactrec.get(SIH."Sell-to Contact No.") then begin
                                    CLE."Contact No" := contactrec."No.";
                                    cle."Contact Name" := contactrec.Name;
                                    cle.Modify();
                                end;
                            end;
                        until cle.Next = 0;
                end;
            }
        }
    }

    var
        myInt: Integer;
}