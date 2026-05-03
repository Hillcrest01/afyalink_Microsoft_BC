query 50100 "Doctors Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(DataItemName; HOSDoctor)
        {
            column(Doctor_No_; "Doctor No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Specialization_Code; "Specialization Code") { }
            column(Specialization_Description; "Specialization Description") { }
            column(Email; Email) { }
            column(Phone; Phone) { }
            column(Registration_No_; "Registration No.") { }
            column(Consultation_Fee; "Consultation Fee") { }
            column(Status; Status) { }
            column(Max_OPD_Patients; "Max OPD Patients") { }

        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}