table 50104 HOSAppointment
{
    Caption = 'Patient Appointment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Appointment No."; Code[20])
        {
            Caption = 'Appointment No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Patient No."; Code[20])
        {
            Caption = 'Patient No.';
            DataClassification = ToBeClassified;
            TableRelation = Patients."Patient No.";
            ValidateTableRelation = true;
            NotBlank = true;

            trigger OnValidate()
            var
                Patients: Record Patients;
            begin
                if Patients.Get(Rec."Patient No.") then begin
                    Rec."Patient Name" := Patients."First Name" + ' ' + Patients."Other Names";
                end;
            end;
        }
        field(14; "Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
            DataClassification = ToBeClassified;
            // ValidateTableRelation = true;
            NotBlank = true;
        }
        field(3; "Doctor No."; Code[20])
        {
            Caption = 'Doctor No.';
            DataClassification = ToBeClassified;
            TableRelation = HOSDoctor."Doctor No.";
            ValidateTableRelation = true;
            NotBlank = true;
            trigger OnValidate()
            var
                Doctors: Record HOSDoctor;
            begin
                if Doctors.Get(Rec."Doctor No.") then begin
                    Rec."Doctor Name" := Doctors.Name;
                end;
            end;
        }
        field(15; "Doctor Name"; Text[100])
        {
            Caption = 'Patient Name';
            DataClassification = ToBeClassified;
            // ValidateTableRelation = true;
            NotBlank = true;
        }
        field(4; "Appointment Date"; Date)
        {
            Caption = 'Appointment Date';
            DataClassification = ToBeClassified;
            NotBlank = true;

            trigger OnValidate()
            begin
                if ("Appointment Date" < Today) and (Status <> Status::Completed) then
                    Error('Appointment date cannot be in the past unless status is Completed.');
            end;
        }
        field(5; "Appointment Time"; Time)
        {
            Caption = 'Appointment Time';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(6; Status; Enum "Booking Status")
        {
            Caption = 'Status';
            InitValue = Booked;

        }
        field(7; "Visit Type"; Enum "Visit Types")
        {
            Caption = 'Visit Type';
            InitValue = New;
        }
        field(8; Symptoms; Text[250])
        {
            Caption = 'Symptoms / Complaint';
            DataClassification = ToBeClassified;
        }
        field(9; "Booking Channel"; Enum "Booking Channel")
        {
            Caption = 'Booking Channel';


        }
        field(10; "Cancellation Reason"; Text[100])
        {
            Caption = 'Cancellation Reason';
            DataClassification = ToBeClassified;

        }
        field(11; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
        field(12; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;
        }
        field(13; "Appointment Type"; Enum "Appointment Types")
        {
            Caption = 'Appointment Type';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "Appointment No.")
        {
            Clustered = true;
        }
        key(Key2; "Doctor No.", "Appointment Date", "Appointment Time")
        {
            Unique = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        AppointmentMgt: Codeunit "Appointment Management";
    begin
        AppointmentMgt.AssignAppointmentNo(Rec);
        CreatedAt := CurrentDateTime;
        ModifiedAt := CurrentDateTime;
        ValidateCancellation();
        // ValidateDate();
    end;

    trigger OnModify()
    begin
        ModifiedAt := CurrentDateTime;
        ValidateCancellation();
        // ValidateDate();
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure ValidateCancellation()
    begin
        if (Status = Status::Cancelled) and ("Cancellation Reason" = '') then
            Error('Cancellation reason is required when cancelling an appointment.');
    end;

    local procedure ValidateDate()
    begin
        if ("Appointment Date" < Today) and (Status <> Status::Completed) then
            Error('Appointment date cannot be in the past unless status is Completed.');
    end;

}