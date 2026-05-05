table 50107 "Bill Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Bill No."; Code[20])
        {
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
        field(20; "Patient Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Bill Date"; Date)
        {
            Caption = 'Bill Date';
            DataClassification = ToBeClassified;
            NotBlank = true;
            // DefaultValue = Today();
        }
        field(4; "Bill Type"; Enum "Bill Type")
        {
            Caption = 'Bill Type';
            NotBlank = true;
        }
        field(5; "Reference No."; Code[20])
        {
            Caption = 'Reference No.';
            DataClassification = ToBeClassified;
            ToolTip = 'OPD Visit No. or IP Admission No.';
        }
        field(6; Subtotal; Decimal)
        {
            Caption = 'Subtotal';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            InitValue = 0;
        }
        // field(7; "Tax Amount"; Decimal)
        // {
        //     Caption = 'Tax Amount';
        //     DecimalPlaces = 2 : 2;
        //     MinValue = 0;
        //     InitValue = 0;
        // }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(9; "Discount Amount"; Decimal)
        {
            Caption = 'Discount Amount';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            InitValue = 0;
        }
        field(10; "Net Payable"; Decimal)
        {
            Caption = 'Net Payable';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(11; "Paid Amount"; Decimal)
        {
            Caption = 'Paid Amount';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            InitValue = 0;
        }
        field(12; "Balance Due"; Decimal)
        {
            Caption = 'Balance Due';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(13; Status; Enum "Bill Status")
        {
            Caption = 'Status';

        }
        field(14; "Payment Method"; Enum "Payment Method")
        {
            Caption = 'Payment Method';

        }
        field(15; "Insurance Provider"; Text[100])
        {
            Caption = 'Insurance Provider';
        }
        field(16; "Insurance Preauth No."; Text[50])
        {
            Caption = 'Insurance Preauth No.';
        }
        field(17; "Created By"; Text[50])
        {
            Caption = 'Created By';
        }
        field(18; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
        field(19; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Bill No.")
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
        BillMgt: Codeunit "Bill Management";
    begin
        BillMgt.AssignBillNumber(Rec);
        CreatedAt := CurrentDateTime;
        ModifiedAt := CurrentDateTime;
        "Bill Date" := Today;
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

    local procedure UpdateBalance()
    begin
        Rec."Net Payable" := Rec."Total Amount" - Rec."Discount Amount";
        if Rec."Net Payable" < 0 then begin
            Rec."Net Payable" := 0;
        end;
        Rec."Balance Due" := Rec."Net Payable" - Rec."Paid Amount";
        if Rec."Balance Due" < 0 then begin
            Rec."Net Payable" := 0;
            if (Rec."Paid Amount" >= Rec."Net Payable") and (Rec."Net Payable" > 0) then
                Rec.Status := Status::Paid
            else if
            Rec."Paid Amount" > 0 then
                Rec.Status := Status::"Partially Paid";
        end;
    end;

}