codeunit 50106 "Bill Management"
{
    procedure AssignBillNumber(var Rec: Record "Bill Header")
    var
        Setup: Record "Hospital Setup";
        NoseriesMgt: Codeunit "No. Series";
    begin
        if Rec."Bill No." <> '' then
            exit;
        if not Setup.Get('SETUP') then
            Error('Hospital setup not yet configured');
        Rec."Bill No." := NoseriesMgt.GetNextNo(Setup."Bill No", Today, true)

    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}