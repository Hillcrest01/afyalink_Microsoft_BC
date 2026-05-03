page 50111 HOSQueue
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HOSQueue;
    CardPageId = "Queue Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Queue No"; Rec."Queue No")
                {

                }
                field("Token Number"; Rec."Token Number") { }
                field("Patient Name"; GetPatientName(Rec."Patient No")) { }
                field("Doctor Name"; GetDoctorName(Rec."Doctor No")) { }
                field("Appointment No"; Rec."Appointment No") { }
                field("Check-in Time"; Rec."Check-in Time") { }
                field(Status; Rec.Status) { }
                field(Priority; Rec.Priority) { }

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

    local procedure GetPatientName(PatientNo: Code[20]): Text[100]
    var
        Patient: Record Patients;
    begin
        if Patient.Get(PatientNo) then
            exit(Patient."First Name" + ' ' + Patient."Other Names")
        else
            exit(' ');

    end;

    local procedure GetDoctorName(DoctorNo: Code[20]): Text[100]
    var
        Doctor: Record HOSDoctor;
    begin
        if Doctor.Get(DoctorNo) then
            exit(Doctor.Name)
        else
            exit(' ');

    end;
}