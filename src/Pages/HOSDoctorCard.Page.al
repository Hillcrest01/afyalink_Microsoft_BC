page 50103 "Doctor's Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HOSDoctor;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Doctor No."; Rec."Doctor No.") { }
                field(Name; Rec.Name) { }
                field("Registration No."; Rec."Registration No.") { }
                field("Employee ID"; Rec."Employee ID") { }
                field("Specialization Code"; Rec."Specialization Code")
                {
                    trigger OnValidate()
                    var
                        Specializations: Record HOSSpecialization;
                    begin
                        if Specializations.Get(Rec."Specialization Code") then begin
                            Rec."Specialization Description" := Specializations.Description;
                        end;
                    end;
                }
                field("Specialization Description"; Rec."Specialization Description") { }

            }
            group(Qualifications)
            {
                field(Qualification; Rec.Qualification)
                {

                }
                field("Experience Years"; Rec."Experience Years") { }
            }
            group("Contact Details")
            {
                field(Phone; Rec.Phone) { }
                field(Email; Rec.Email) { }
            }
            group("Doctor Status")
            {
                field(Status; Rec.Status) { }
            }
            group(Fees)
            {
                field("Consultation Fee"; Rec."Consultation Fee") { }
                field("Max OPD Patients"; Rec."Max OPD Patients") { }
            }

        }
        area(FactBoxes)
        {

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