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
        ReversePayment();
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        ReversePayment();
    end;

    trigger OnRename()
    begin

    end;

    local procedure UpdateBillPayment()
    var
        BillHeader: Record "Bill Header";
    begin
        if BillHeader.Get(Rec."Bill No.") then begin
            BillHeader."Paid Amount" := BillHeader."Paid Amount" + Rec.Amount;
            BillHeader."Balance Due" := BillHeader."Net Payable" - BillHeader."Paid Amount";
            if BillHeader."Balance Due" < 0 then
                BillHeader."Balance Due" := 0;

            if (BillHeader."Paid Amount" >= BillHeader."Net Payable") and (BillHeader."Net Payable" > 0)
            then
                BillHeader.Status := BillHeader.Status::Paid
            else if BillHeader."Paid Amount" > 0 then
                BillHeader.Status := BillHeader.Status::"Partially Paid";
            BillHeader.Modify();
        end;
    end;

    local procedure ReversePayment()
    var
        BillHeader: Record "Bill Header";
    begin
        if BillHeader.Get(Rec."Bill No.") then begin
            BillHeader."Paid Amount" := BillHeader."Paid Amount" - Rec.Amount;
            if BillHeader."Paid Amount" < 0 then
                BillHeader."Paid Amount" := 0;
            BillHeader."Balance Due" := BillHeader."Net Payable" - BillHeader."Paid Amount";
            if BillHeader."Balance Due" < 0 then
                BillHeader."Balance Due" := 0;

            if BillHeader."Paid Amount" = 0 then
                BillHeader.Status := BillHeader.Status::Posted
            else if BillHeader."Paid Amount" < BillHeader."Net Payable" then
                BillHeader.Status := BillHeader.Status::"Partially Paid"
            else
                BillHeader.Status := BillHeader.Status::Paid;

            BillHeader.Modify();
        end;
    end;

}