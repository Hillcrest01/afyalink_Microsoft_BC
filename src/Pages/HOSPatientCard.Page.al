page 50105 "Patient Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Patients;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Patient No."; Rec."Patient No.")
                {

                }
                field("First Name"; Rec."First Name") { }
                field("Other Names"; Rec."Other Names") { }
                field("Id Number"; Rec."Id Number") { }
                field(Password; Rec.Password) { }
                field(Gender; Rec.Gender) { }
                field("Date of Birth"; Rec."Date of Birth") { }
                field("Registration Date"; Rec."Registration Date") { }
                field(Status; Rec.Status) { }

            }
            group("Contact Details")
            {
                field(Mobile; Rec.Mobile) { }
                field("Alternate Phone"; Rec."Alternate Phone") { }
                field(Email; Rec.Email) { }
            }
            group("Address Details")
            {
                field("Address Line 1"; Rec."Address Line 1") { }
                field(City; Rec.City) { }
                field(State; Rec.State)
                {
                    Caption = 'County';

                }
                field("Postal Code"; Rec."Postal Code") { }

            }
            group("Emergency Contacts")
            {
                field("Emergency Contact Name"; Rec."Emergency Contact Name") { }
                field("Emergency Contact Phone"; Rec."Emergency Contact Phone") { }

            }
            group("Additional Details")
            {
                field("Blood Group"; Rec."Blood Group") { }
                field("Known Allergies"; Rec."Known Allergies") { }
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