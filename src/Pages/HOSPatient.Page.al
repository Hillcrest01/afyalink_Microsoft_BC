page 50104 "Patients"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Patients;
    CardPageId = "Patient Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Patient No."; Rec."Patient No.")
                {

                }
                field("First Name"; Rec."First Name") { }
                field("Other Names"; Rec."Other Names") { }
                field(Email; Rec.Email) { }
                field(Gender; Rec.Gender) { }
                field("Date of Birth"; Rec."Date of Birth") { }
                field(Mobile; Rec.Mobile) { }
                field(Status; Rec.Status) { }
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