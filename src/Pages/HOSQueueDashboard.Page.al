page 50110 HOSQueueDashboard
{
    Caption = 'OPD Queue Dashboard';
    PageType = List;
    ApplicationArea = All;
    SourceTable = HOSQueue;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Token Number"; Rec."Token Number")
                {
                    Caption = 'Token';
                    ToolTip = 'Token Number';
                }
                field("Patient Name"; GetPatientName(Rec."Patient No"))
                {
                    Caption = 'Patient Name';
                    ToolTip = 'Patient full name';
                }
                field(Priority; Rec.Priority)
                {
                    Caption = 'Priority';
                }
                field("Check-in Time"; Rec."Check-in Time")
                {
                    Caption = 'Check-in';
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field("Doctor Name"; GetDoctorName(Rec."Doctor No"))
                {
                    Caption = 'Doctor';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(StartConsultation)
            {
                Caption = 'Start Consultation';
                Image = Start;
                ToolTip = 'Mark patient as In-Progress';

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Waiting then begin
                        Rec.Status := Rec.Status::"In Progress";
                        Rec."Start Time" := Time;
                        Rec.Modify();
                        CurrPage.Update();
                    end else
                        Error('Only waiting patients can be started.');
                end;
            }

            action(CompleteConsultation)
            {
                Caption = 'Complete';
                Image = Approve;
                ToolTip = 'Mark consultation as Completed';

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::"In Progress" then begin
                        Rec.Status := Rec.Status::Completed;
                        Rec."End Time" := Time;
                        Rec.Modify();
                        CurrPage.Update();
                    end else
                        Error('Only in-progress patients can be marked completed.');
                end;
            }

            action(SkipPatient)
            {
                Caption = 'Skip';
                Image = Cancel;
                ToolTip = 'Skip this patient (move to end or mark skipped)';

                trigger OnAction()
                begin
                    if Rec.Status in [Rec.Status::Waiting, Rec.Status::"In Progress"] then begin
                        Rec.Status := Rec.Status::Skipped;
                        Rec.Modify();
                        CurrPage.Update();
                    end else
                        Error('Only waiting or in-progress patients can be skipped.');
                end;
            }

            action(NoShow)
            {
                Caption = 'No-Show';
                Image = Warning;
                ToolTip = 'Mark patient as no-show';

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Waiting then begin
                        Rec.Status := Rec.Status::Skipped;
                        Rec.Notes := 'No-Show';
                        Rec.Modify();
                        CurrPage.Update();
                    end else
                        Error('Only waiting patients can be marked no-show.');
                end;
            }

            action(Refresh)
            {
                Caption = 'Refresh';
                Image = Refresh;
                ToolTip = 'Refresh dashboard';

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
        }

        area(Reporting)
        {
            action(ShowAllToday)
            {
                Caption = 'Show All Today';
                Image = View;

                trigger OnAction()
                begin
                    // CurrPage.SetFilter("Queue Date", Today());
                    // CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin

        // CurrPage.SetFilter("Queue Date", Today());
        // CurrPage.SetFilter(Status, '%1|%2', Status::Waiting, Status::"In-Progress");
    end;

    local procedure GetPatientName(PatientNo: Code[20]): Text[101]
    var
        Patient: Record Patients;
    begin
        if Patient.Get(PatientNo) then
            exit(Patient."First Name" + ' ' + Patient."Other Names")
        else
            exit('');
    end;

    local procedure GetDoctorName(DoctorNo: Code[20]): Text[100]
    var
        Doctor: Record HOSDoctor;
    begin
        if Doctor.Get(DoctorNo) then
            exit(Doctor.Name)
        else
            exit('');
    end;
}