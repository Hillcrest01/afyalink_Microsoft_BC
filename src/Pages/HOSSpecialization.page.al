page 50100 HOSSpecialization
{
    PageType = List;
    ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = HOSSpecialization;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {

                }
                field(Name; Rec.Name) { }
                field(Description; Rec.Description) { }
                field(CreatedAt; Rec.CreatedAt) { }
                field(ModifiedAt; Rec.ModifiedAt) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}