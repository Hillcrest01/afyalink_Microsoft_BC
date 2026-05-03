page 50109 "Hospital Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Hospital Cue";

    layout
    {
        area(Content)
        {
            cuegroup(Overview)
            {
                field(TotalPatients; Rec.TotalPatients)
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::Patients);
                    end;
                }

                field(TotalDoctors; Rec.TotalDoctors)
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::HOSDoctor);
                    end;
                }
                field(TotalAppointments; Rec.TotalAppointments)
                {
                    ApplicationArea = All;
                    DrillDown = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::HOSAppointment);
                    end;
                }

            }
        }

    }

    trigger OnOpenPage()
    var
        PatientRec: Record Patients;
        DocRec: Record HOSDoctor;
        AppRec: Record HOSAppointment;
    begin
        if not Rec.Get(1) then begin
            Rec.Init();
            Rec."Primary Key" := 1;
            Rec.Insert();
        end;

        Rec.TotalPatients := PatientRec.Count();
        Rec.TotalDoctors := DocRec.Count();
        Rec.TotalAppointments := AppRec.Count();
        // Rec.TotalBills := BillRec.Count();

        Rec.Modify();
    end;
}