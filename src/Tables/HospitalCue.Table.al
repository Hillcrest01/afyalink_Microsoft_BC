table 50105 "Hospital Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer) { }

        field(2; TotalPatients; Integer) { }
        field(3; TotalAppointments; Integer) { }
        field(4; TotalDoctors; Integer) { }
        field(5; TotalBills; Integer) { }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }
}