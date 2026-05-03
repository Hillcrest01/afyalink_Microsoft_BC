codeunit 50102 "Appointment Management"
{
    procedure AssignAppointmentNo(var Rec: Record HOSAppointment)
    var
        Setup: Record "Hospital Setup";
        NoSeriesMgt: Codeunit "No. Series";

    begin
        if Rec."Appointment No." <> '' then exit;
        if not Setup.Get('SETUPS') then
            Error('Hospital setup has not been configured yet');

        Rec."Appointment No." := NoSeriesMgt.GetNextNo(Setup."Appointment No.s", Today, true);

    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}