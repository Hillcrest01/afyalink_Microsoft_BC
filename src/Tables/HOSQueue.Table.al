table 50106 HOSQueue
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Queue No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Patient No"; Code[20])
        {
            TableRelation = Patients."Patient No.";
            ValidateTableRelation = true;
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Doctor No"; Code[20])
        {
            TableRelation = HOSDoctor."Doctor No.";
            ValidateTableRelation = true;
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Appointment No"; Code[20])
        {
            TableRelation = HOSAppointment."Appointment No.";
            ValidateTableRelation = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Queue Date"; Date)
        {
            Caption = 'Queue Date';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(6; "Token Number"; Code[20])
        {
            Caption = 'Token Number';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(7; "Check-in Time"; Time)
        {
            Caption = 'Check-in Time';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(8; "Start Time"; Time)
        {
            Caption = 'Start Time';
            DataClassification = ToBeClassified;
        }
        field(9; "End Time"; Time)
        {
            Caption = 'End Time';
            DataClassification = ToBeClassified;
        }
        field(10; Status; Enum "Queue Status")
        {
            Caption = 'Status';

        }
        field(11; Priority; Enum "Queue Priority")
        {
            Caption = 'Priority';
        }
        field(12; Notes; Text[250])
        {
            Caption = 'Notes';
            DataClassification = ToBeClassified;
        }
        field(13; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
        field(14; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Queue No")
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
        QueueMgt: Codeunit "Queue Management";
        TokenMgt: Codeunit "Token Management";
    begin
        QueueMgt.GetQueueNumber(Rec);
        TokenMgt.GetTokenNumber(Rec);
        "Check-in Time" := Time;
        "Queue Date" := Today;
        CreatedAt := CurrentDateTime;
        ModifiedAt := CurrentDateTime;
        GenerateTokenNumber();
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

    local procedure GenerateTokenNumber()
    var
        LastQueue: Record HOSQueue;
        LastToken: Integer;

    begin
        // LastQueue.SetRange("Doctor No", "Doctor No");
        // // LastQueue.SetRange("Queue Date", "Queue Date");
        // LastQueue.SetCurrentKey("Token Number");
        // LastQueue.SetRange("Token Number");
        // if LastQueue.FindLast() then
        //     LastToken := "Token Number" + 1
        // else
        //     LastToken := 1;
        // "Token Number" := LastToken;
    end;


}