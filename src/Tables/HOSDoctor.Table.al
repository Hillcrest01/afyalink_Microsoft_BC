table 50101 HOSDoctor
{
    Caption = 'Doctors';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Doctor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Doctor No.';
            // NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(3; "Specialization Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = HOSSpecialization.Code;
            ValidateTableRelation = true;
        }
        field(4; "Registration No."; Text[50])
        {
            Caption = 'Medical Registration No.';
            DataClassification = ToBeClassified;
            NotBlank = true;

            trigger OnValidate()
            var
                ExistingDoctor: Record HOSDoctor;
            begin
                // if ExistingDoctor.FindSet() then
                //     repeat
                //         if ExistingDoctor."Registration No." = Rec."Registration No." and
                //         ExistingDoctor."Doctor No." <> Rec."Doctor No." then
                //             Error('Registration Number %1 is already in use by another doctor.', "Registration No.");
                //     until ExistingDoctor.Next() = 0;
                ExistingDoctor.SetRange("Registration No.", Rec."Registration No.");
                ExistingDoctor.SetFilter("Doctor No.", '<>%1', Rec."Doctor No.");
                if ExistingDoctor.FindFirst() then
                    Error(
           'Registration Number %1 is already in use by another doctor.',
           Rec."Registration No."
       );
            end;
        }
        field(5; Qualification; Text[100])
        {
            Caption = 'Qualification';
            DataClassification = ToBeClassified;
        }
        field(6; "Experience Years"; Integer)
        {
            Caption = 'Experience (Years)';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(7; "Photo URL"; Text[250])
        {
            Caption = 'Photo URL';
            DataClassification = ToBeClassified;
        }
        field(8; "Employee ID"; Code[20])
        {
            Caption = 'Employee ID';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get(Rec."Employee ID") then
                    Rec.Phone := Emp."Phone No.";
                Rec.Email := Emp."E-Mail";
                Rec.Name := Emp."First Name" + ' ' + Emp."Last Name";
            end;
        }
        field(9; Phone; Text[20])
        {
            Caption = 'Phone Number';
            DataClassification = ToBeClassified;
        }
        field(10; Email; Text[80])
        {
            Caption = 'Email Address';
            DataClassification = ToBeClassified;
        }
        field(11; "Consultation Fee"; Decimal)
        {
            Caption = 'Consultation Fee';
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 2;
            MinValue = 0;
        }
        field(12; "Max OPD Patients"; Integer)
        {
            Caption = 'Max OPD Patients/Day';
            DataClassification = ToBeClassified;
            MinValue = 0;
            InitValue = 20;
        }
        field(13; Status; Enum "Doctor Status")
        {
            Caption = 'Status';
            InitValue = Active;


        }
        field(14; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
        field(15; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;
        }
        field(16; "Specialization Description"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = HOSSpecialization.Description;
            ValidateTableRelation = true;
        }
    }

    keys
    {
        key(Key1; "Doctor No.")
        {
            Clustered = true;
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
        DoctorMgt: Codeunit "Doctor Management";
    begin
        DoctorMgt.AssignDoctorNo(Rec);
        CreatedAt := CurrentDateTime;
        ModifiedAt := CurrentDateTime;

    end;

    trigger OnModify()
    begin
        ModifiedAt := CurrentDateTime;
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}