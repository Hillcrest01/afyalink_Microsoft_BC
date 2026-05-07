page 50117 "Payments List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Patient Payments";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payment No."; Rec."Payment No.")
                {

                }
                field("Bill No."; Rec."Bill No.") { }
                field("Payment Date"; Rec."Payment Date") { }
                field(Amount; Rec.Amount) { }
                field("Payment Mode"; Rec."Payment Mode") { }
                field("Reference No."; Rec."Reference No.") { }
                field("Bank Name"; Rec."Bank Name") { }

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