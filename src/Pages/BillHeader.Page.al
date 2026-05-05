page 50113 "Bill Header"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Bill Header";
    CardPageId = "Bill Header Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Bill No."; Rec."Bill No.") { }
                field("Patient Name"; Rec."Patient Name") { }
                field("Paid Amount"; Rec."Paid Amount") { }
                field("Balance Due"; Rec."Balance Due") { }
                field(Status; Rec.Status) { }
                field("Payment Method"; Rec."Payment Method") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Delete)
            {

                trigger OnAction()
                begin

                    if Rec.Status in [Rec.Status::Draft] then begin
                        if Confirm('Are you sure you want to delete Bill %1?', false, Rec."Bill No.") then;
                        Rec.Delete();
                        CurrPage.Update();
                    end
                    else
                        Error('Only Bills in draft status can be deleted');
                end;
            }
        }
    }

    var
        myInt: Integer;
}