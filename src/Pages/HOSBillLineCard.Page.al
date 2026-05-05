page 50116 HOSBillLineCard
{
    Caption = 'Bill Line';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = HOSBillLine;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Bill No."; Rec."Bill No.")
                {
                    Caption = 'Bill No.';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    Editable = false;
                }
                field("Item Type"; Rec."Item Type")
                {
                    Caption = 'Item Type';
                }
                field("Item Code"; Rec."Item Code")
                {
                    Caption = 'Item Code';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field("Discount %"; Rec."Discount %")
                {
                    Caption = 'Discount %';
                }
                field("Tax %"; Rec."Tax %")
                {
                    Caption = 'Tax %';
                }
                field("Doctor No."; Rec."Doctor No.")
                {
                    Caption = 'Doctor';
                    TableRelation = HOSDoctor."Doctor No.";
                }
                field("Reference No."; Rec."Reference No.")
                {
                    Caption = 'Reference No.';
                }
            }

            group(Totals)
            {
                field("Discount Amount"; Rec."Discount Amount")
                {
                    Caption = 'Discount Amount';
                    Editable = false;
                }
                field("Line Subtotal"; Rec."Line Subtotal")
                {
                    Caption = 'Subtotal';
                    Editable = false;
                }
                field("Tax Amount"; Rec."Tax Amount")
                {
                    Caption = 'Tax Amount';
                    Editable = false;
                }
                field("Line Total"; Rec."Line Total")
                {
                    Caption = 'Total';
                    Editable = false;
                }
            }
        }
    }
}