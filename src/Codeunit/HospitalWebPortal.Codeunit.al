codeunit 50105 "Hospital Webportal"
{

    var
        Patients: Record Patients;
        Setup: Record "Hospital Setup";

        NoSeries: Codeunit "No. Series";

    procedure RegisterPatient(firstName: Text[50]; otherNames: Text[100]; email: Text[100]; password: Text[200]; idNumber: Code[20]) return_value: Boolean
    begin

        return_value := false;
        if not Setup.Get('SETUP') then
            Error('Hospital setup not yet configured');
        Patients.Reset();
        Patients.SetRange(Email, email);
        If Patients.Find('-') then begin
            Error('There is an account linked with %1, login to proceed.', email);
        end
        else begin
            Patients.Init();
            Patients."Patient No." := NoSeries.GetNextNo(Setup."Patient No.s", Today, true);
            Patients."First Name" := firstName;
            Patients."Other Names" := otherNames;
            Patients.Email := email;
            Patients.Password := password;
            Patients."Id Number" := idNumber;
            Patients."Registration Date" := Today;
            Patients.Insert();
            return_value := true;
        end;

    end;

    procedure BookAppointment(PatientNo: Code[20]; DoctorNo: Code[20]; AppointmentDate: Date; AppointmentTime: Time; Symptoms: Text[200]) return_value: Boolean
    var
        Appointments: Record HOSAppointment;
        BookingChannel: Enum "Booking Channel";
        BookingStatus: Enum "Booking Status";
    begin
        return_value := false;
        if not Setup.Get('SETUP') then
            Error('Hospital setup not yet configured');

        Appointments.Reset();
        Appointments.SetRange("Patient No.", PatientNo);
        Appointments.SetRange("Appointment Date", AppointmentDate);
        if Appointments.FindFirst() then
            Error('You already have an appointment on this date');

        Appointments.Init();
        Appointments."Appointment No." := NoSeries.GetNextNo(Setup."Appointment No.s", Today, true);
        // Appointments."Patient No." := PatientNo;
        Appointments.Validate("Patient No.", PatientNo);
        // Appointments."Doctor No." := DoctorNo;
        Appointments.Validate("Doctor No.", DoctorNo);
        Appointments."Appointment Date" := AppointmentDate;
        Appointments."Appointment Time" := AppointmentTime;
        Appointments."Booking Channel" := BookingChannel::Online;
        Appointments.Symptoms := Symptoms;
        Appointments.Status := BookingStatus::Booked;
        Appointments.Insert();
        return_value := true;

    end;

    trigger OnRun()
    begin
    end;

    var
        myInt: Integer;
}