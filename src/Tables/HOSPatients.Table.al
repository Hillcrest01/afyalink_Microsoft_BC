table 50103 Patients
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Patient No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(3; "Other Names"; Text[50])
        {
            Caption = 'Other Names';
            DataClassification = ToBeClassified;
        }
        field(4; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            DataClassification = ToBeClassified;
        }
        field(5; Gender; Enum Gender)
        {
            Caption = 'Gender';

        }
        field(6; Mobile; Text[15])
        {
            Caption = 'Mobile Number';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(7; "Alternate Phone"; Text[15])
        {
            Caption = 'Alternate Phone';
            DataClassification = ToBeClassified;
        }
        field(8; Email; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
        }
        field(9; "Address Line 1"; Text[100])
        {
            Caption = 'Address Line 1';
            DataClassification = ToBeClassified;
        }
        field(10; City; Text[50])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
        }
        field(11; State; Text[50])
        {
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(12; "Postal Code"; Text[20])
        {
            Caption = 'Postal Code';
            DataClassification = ToBeClassified;
        }
        field(13; "Emergency Contact Name"; Text[100])
        {
            Caption = 'Emergency Contact Name';
            DataClassification = ToBeClassified;
        }
        field(14; "Emergency Contact Phone"; Text[15])
        {
            Caption = 'Emergency Contact Phone';
            DataClassification = ToBeClassified;
        }
        field(15; "Blood Group"; Enum BloodGroup)
        {
            Caption = 'Blood Group';
        }
        field(16; "Known Allergies"; Text[250])
        {
            Caption = 'Known Allergies';
            DataClassification = ToBeClassified;
        }
        field(17; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            DataClassification = ToBeClassified;
            // DefaultValue = Today();
        }
        field(18; Status; Enum "Patient Status")
        {
            Caption = 'Status';
            InitValue = Active;
        }
        field(19; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
        field(20; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;
        }
        field(21; Password; Text[200])
        {
            Caption = 'Password';
            Editable = false;
        }
        field(22; "Id Number"; Code[20])
        {
            Caption = 'ID Number';
            Editable = false;
        }
    }


    keys
    {
        key(Key1; "Patient No.")
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
        PatientMgt: Codeunit "Patient Management";
    begin
        PatientMgt.AssignPatientNo(Rec);
        "Registration Date" := Today;
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

    local procedure validateDOB()
    begin
        if "Date of Birth" < Today then
            Error('Date of Birth cannot be in the future');
    end;

}