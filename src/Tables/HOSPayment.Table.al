table 50109 "Patient Payments"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Payment No."; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Bill No."; Code[20])
        {
            Caption = 'Bill No.';
            DataClassification = ToBeClassified;
            TableRelation = "Bill Header"."Bill No.";
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(3; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
            DataClassification = ToBeClassified;
            NotBlank = true;
            InitValue = Today;
        }
        field(4; "Payment Time"; Time)
        {
            Caption = 'Payment Time';
            DataClassification = ToBeClassified;
            NotBlank = true;
            InitValue = CurrentTime;
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            NotBlank = true;
        }
        field(6; "Payment Mode"; Option)
        {
            Caption = 'Payment Mode';
            OptionMembers = Cash,Card,UPI,Cheque,Insurance,Credit;
            OptionCaption = 'Cash,Card,UPI,Cheque,Insurance,Credit';
            NotBlank = true;
        }
        field(7; "Reference No."; Text[50])
        {
            Caption = 'Reference No.';
            ToolTip = 'Cheque No., Transaction ID, Card last 4 digits';
        }
        field(8; "Bank Name"; Text[50])
        {
            Caption = 'Bank Name';
        }
        field(9; "Received By"; Text[50])
        {
            Caption = 'Received By';
        }
        field(10; Notes; Text[250])
        {
            Caption = 'Notes';
        }
        field(11; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Payment No.")
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
        if Amount <= 0 then
            Error('Amount must be greater than 0');
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