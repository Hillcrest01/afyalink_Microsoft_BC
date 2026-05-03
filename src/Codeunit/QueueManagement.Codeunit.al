codeunit 50103 "Queue Management"
{
    procedure GetQueueNumber(var Record: Record HOSQueue)
    var
        NoSeries: Codeunit "No. Series";
        Setup: Record "Hospital Setup";
    begin
        if Record."Queue No" <> '' then exit;
        if not Setup.Get('SETUP') then
            Error('Hospital setup has not been configured yet');
        Record."Queue No" := NoSeries.GetNextNo(Setup."Queue No.s", Today, true)
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}