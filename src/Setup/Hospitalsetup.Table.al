table 50102 "Hospital Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Hospital Setup';

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Doctor No.s"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }

        field(3; "Patient No.s"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(4; "Appointment No.s"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(5; "Queue No.s"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(6; "Queue Token"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(7; "Bill No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }

    }

    keys
    {
        key(Key1; "Primary Key")
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

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}