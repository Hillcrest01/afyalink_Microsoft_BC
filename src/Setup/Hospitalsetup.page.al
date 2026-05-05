page 50101 "Hospital Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Hospital Setup";

    layout
    {
        area(Content)
        {
            group(Setup)
            {
                field("Primary Key"; Rec."Primary Key")
                {

                }
                field("Doctor No.s"; Rec."Doctor No.s") { }
                field("Patient No.s"; Rec."Patient No.s") { }
                field("Appointment No.s"; Rec."Appointment No.s") { }
                field("Queue No.s"; Rec."Queue No.s") { }
                field("Queue Token"; Rec."Queue Token") { }
                field("Bill No"; Rec."Bill No") { }
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