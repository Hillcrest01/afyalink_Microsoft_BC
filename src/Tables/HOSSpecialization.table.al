table 50100 HOSSpecialization
{
    Caption = 'Doctor Specialization';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            NotBlank = true;

        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            NotBlank = true;

        }
        field(3; Description; Code[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;

        }
        field(4; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;

        }
        field(5; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;

        }

    }

    keys
    {
        key(PK; Code)
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
    begin
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