codeunit 50101 "Patient Management"
{

    procedure AssignPatientNo(var Rec: Record Patients)
    var
        Setup: Record "Hospital Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if Rec."Patient No." <> '' then
            exit;
        if not Setup.Get('SETUP') then
            Error('Hospital setup has not been configured yet');
        rec."Patient No." := NoSeriesMgt.GetNextNo(Setup."Patient No.s", Today, true);
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}