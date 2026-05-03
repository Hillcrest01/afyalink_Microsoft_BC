page 50106 HOSAppointment
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HOSAppointment;
    CardPageId = "Appointment Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Appointment No."; Rec."Appointment No.")
                {

                }
                field("Patient No."; Rec."Patient No.") { }
                field("Doctor No."; Rec."Doctor No.") { }
                field("Appointment Date"; Rec."Appointment Date") { }
                field("Appointment Time"; Rec."Appointment Time") { }
                field(Status; Rec.Status) { }
                field("Visit Type"; Rec."Visit Type") { }
                field("Appointment Type"; Rec."Appointment Type") { }
                field("Booking Channel"; Rec."Booking Channel") { }
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