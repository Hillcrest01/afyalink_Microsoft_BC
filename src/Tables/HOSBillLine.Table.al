table 50108 HOSBillLine
{
    Caption = 'Bill Line Items';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Bill No."; Code[20])
        {
            Caption = 'Bill No.';
            DataClassification = ToBeClassified;
            TableRelation = "Bill Header"."Bill No.";
            ValidateTableRelation = true;
            NotBlank = true;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            // NotBlank = true;
        }
        field(3; "Item Type"; Text[100])
        {
            Caption = 'Item Type';
            // OptionMembers = Consultation, Medicine, "Lab Test", Radiology, "Room Rent", Procedure, Other;
            // OptionCaption = 'Consultation', 'Medicine', 'Lab Test', 'Radiology', 'Room Rent', 'Procedure', 'Other';
            NotBlank = true;
        }
        field(4; "Item Code"; Code[20])
        {
            Caption = 'Item Code';
            DataClassification = ToBeClassified;
            ToolTip = 'Medicine code, test code, etc.';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 3;
            MinValue = 0;
            // DefaultValue = 1;
            NotBlank = true;
        }
        field(7; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            NotBlank = true;
        }
        field(8; "Discount %"; Decimal)
        {
            Caption = 'Discount %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
            InitValue = 0;
        }
        field(9; "Discount Amount"; Decimal)
        {
            Caption = 'Discount Amount';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(10; "Line Subtotal"; Decimal)
        {
            Caption = 'Line Subtotal';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(11; "Tax %"; Decimal)
        {
            Caption = 'Tax %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            InitValue = 0;
        }
        field(12; "Tax Amount"; Decimal)
        {
            Caption = 'Tax Amount';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(13; "Line Total"; Decimal)
        {
            Caption = 'Line Total';
            DecimalPlaces = 2 : 2;
            MinValue = 0;
            Editable = false;
        }
        field(14; "Doctor No."; Code[20])
        {
            Caption = 'Doctor No.';
            TableRelation = HOSDoctor."Doctor No.";
            ValidateTableRelation = true;
        }
        field(15; "Reference No."; Code[20])
        {
            Caption = 'Reference No.';
            ToolTip = 'Prescription No., test request No., etc.';
        }
        field(16; CreatedAt; DateTime)
        {
            Caption = 'Created At';
            Editable = false;
        }
        field(17; ModifiedAt; DateTime)
        {
            Caption = 'Modified At';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Bill No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        CreatedAt := CurrentDateTime();
        ModifiedAt := CurrentDateTime();
        AssignLineNo();
        CalculateLineTotals();
    end;

    trigger OnModify()
    begin
        ModifiedAt := CurrentDateTime();
        CalculateLineTotals();
    end;

    local procedure AssignLineNo()
    var
        LastLine: Record HOSBillLine;
        LastNo: Integer;
    begin
        if "Line No." = 0 then begin
            LastLine.SetRange("Bill No.", "Bill No.");
            LastLine.SetCurrentKey("Line No.");
            if LastLine.FindLast() then
                LastNo := LastLine."Line No." + 10
            else
                LastNo := 10000;
            "Line No." := LastNo;
        end;
    end;

    local procedure CalculateLineTotals()
    var
        TotalBeforeDiscount: Decimal;
    begin
        if Quantity <= 0 then
            Quantity := 1;
        if "Unit Price" < 0 then
            "Unit Price" := 0;

        TotalBeforeDiscount := Quantity * "Unit Price";
        "Discount Amount" := (TotalBeforeDiscount * "Discount %") / 100;
        "Line Subtotal" := TotalBeforeDiscount - "Discount Amount";
        if "Line Subtotal" < 0 then
            "Line Subtotal" := 0;

        "Tax Amount" := ("Line Subtotal" * "Tax %") / 100;
        "Line Total" := "Line Subtotal" + "Tax Amount";
    end;
}