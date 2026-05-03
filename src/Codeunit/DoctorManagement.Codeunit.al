codeunit 50100 "Doctor Management"
{
    procedure AssignDoctorNo(var Rec: Record HOSDoctor)
    var
        Setup: Record "Hospital Setup";
        NoseriesMgt: Codeunit "No. Series";
    begin
        if Rec."Doctor No." <> '' then
            exit;
        if not Setup.Get('SETUP') then
            Error('Hospital setup not yet configured');
        Rec."Doctor No." := NoseriesMgt.GetNextNo(Setup."Doctor No.s", Today, true)

    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}