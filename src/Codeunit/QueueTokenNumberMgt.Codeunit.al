codeunit 50104 "Token Management"
{
    procedure GetTokenNumber(var Rec: Record HOSQueue)
    var
        Setup: Record "Hospital Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Rec."Token Number" <> '' then exit;
        if not Setup.Get('SETUP') then
            Error('Hospital setup not yet configured');
        Rec."Token Number" := NoSeries.GetNextNo(Setup."Queue Token", Today, true)
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}