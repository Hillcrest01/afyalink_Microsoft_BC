query 50102 "Appointments Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(DataItemName; HOSAppointment)
        {
            column(Appointment_No_; "Appointment No.") { }
            column(Appointment_Date; "Appointment Date") { }
            column(Appointment_Time; "Appointment Time") { }
            column(Patient_No_; "Patient No.") { }
            column(Patient_Name; "Patient Name") { }
            column(Doctor_Name; "Doctor Name") { }
            column(Doctor_No_; "Doctor No.") { }
            column(Booking_Channel; "Booking Channel") { }
            column(Cancellation_Reason; "Cancellation Reason") { }
            column(Visit_Type; "Visit Type") { }
            column(Status; Status) { }
            column(Symptoms; Symptoms) { }
            // filter(FilterName; SourceFieldName)
            // {

            // }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}