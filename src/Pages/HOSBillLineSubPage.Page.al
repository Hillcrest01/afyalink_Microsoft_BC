page 50115 HOSBillLineSubPage
{
    Caption = 'Bill Lines';
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = HOSBillLine;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    Caption = 'Line';
                    Editable = false;
                }
                field("Item Type"; Rec."Item Type")
                {
                    Caption = 'Type';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Qty';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Caption = 'Price';
                }
                field("Discount %"; Rec."Discount %")
                {
                    Caption = 'Disc %';
                }
                field("Line Subtotal"; Rec."Line Subtotal")
                {
                    Caption = 'Subtotal';
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

    actions
    {
        area(Processing)
        {
            action(New)
            {
                Caption = 'Add Line';
                Image = New;

                trigger OnAction()
                begin
                    if Page.RunModal(50116, Rec) = Action::OK then
                        CurrPage.Update();
                end;
            }

            action(Edit)
            {
                Caption = 'Edit Line';
                Image = Edit;

                trigger OnAction()
                begin
                    Page.RunModal(50116, Rec);
                end;
            }

            action(Delete)
            {
                Caption = 'Delete Line';
                Image = Delete;

                trigger OnAction()
                begin
                    if Confirm('Delete this line?') then begin
                        Rec.Delete();
                        CurrPage.Update();
                    end;
                end;
            }
        }
    }
}