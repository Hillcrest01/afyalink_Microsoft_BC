page 50114 "Bill Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bill Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Bill No."; Rec."Bill No.")
                {

                }
                field("Patient No."; Rec."Patient No.")
                {
                    LookupPageId = Patients;
                }
                field("Patient Name"; Rec."Patient Name") { }

                field("Bill Date"; Rec."Bill Date") { }
                field("Bill Type"; Rec."Bill Type") { }
                field("Created By"; Rec."Created By") { }
                field("Reference No."; Rec."Reference No.") { }
            }

            group(Financials)
            {
                field("Total Amount"; Rec."Total Amount") { }
                field("Paid Amount"; Rec."Paid Amount") { }
                field("Balance Due"; Rec."Balance Due") { }
                field("Net Payable"; Rec."Net Payable") { }
                field("Discount Amount"; Rec."Discount Amount") { }
                field("Payment Method"; Rec."Payment Method") { }



            }
            group(Insurance)
            {

                field("Insurance Preauth No."; Rec."Insurance Preauth No.") { }
                field("Insurance Provider"; Rec."Insurance Provider") { }
            }
            group("Bill Lines")
            {
                part(BillLines; HOSBillLineSubPage)
                {
                    SubPageLink = "Bill No." = field("Bill No.");
                    Caption = 'Bill Lines';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}