page 50102 HOSDoctor
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HOSDoctor;
    CardPageId = "Doctor's Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Doctor No."; Rec."Doctor No.")
                {

                }
                field(Name; Rec.Name) { }
                field("Specialization Code"; Rec."Specialization Code") { }
                field("Registration No."; Rec."Registration No.") { }
                field("Employee ID"; Rec."Employee ID") { }
                field(Phone; Rec.Phone) { }
                field(Email; Rec.Email) { }
                field(Status; Rec.Status) { }
                field(Qualification; Rec.Qualification) { }
                field("Experience Years"; Rec."Experience Years") { }
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