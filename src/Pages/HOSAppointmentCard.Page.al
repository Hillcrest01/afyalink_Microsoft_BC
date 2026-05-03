page 50107 "Appointment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HOSAppointment;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Appointment No."; Rec."Appointment No.")
                {

                }
                field("Patient No."; Rec."Patient No.") { }
                field("Patient Name"; Rec."Patient Name") { }
                field("Doctor No."; Rec."Doctor No.") { }
                field("Doctor Name"; Rec."Doctor Name") { }
                field("Appointment Date"; Rec."Appointment Date") { }
                field("Appointment Time"; Rec."Appointment Time") { }
                field(Status; Rec.Status) { }
                field("Cancellation Reason"; Rec."Cancellation Reason") { }
                field("Visit Type"; Rec."Visit Type") { }
                field("Booking Channel"; Rec."Booking Channel") { }
                field("Appointment Type"; Rec."Appointment Type") { }
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