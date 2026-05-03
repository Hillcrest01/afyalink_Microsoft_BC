query 50101 "All Patients"
{
    QueryType = Normal;

    elements
    {
        dataitem(DataItemName; Patients)
        {
            column(Patient_No_; "Patient No.")
            {

            }
            column(First_Name; "First Name") { }
            column(Other_Names; "Other Names") { }
            column(Email; Email) { }
            column(Password; Password) { }
            column(Registration_Date; "Registration Date") { }
            column(Id_Number; "Id Number") { }
            column(Date_of_Birth; "Date of Birth") { }
            column(Gender; Gender) { }
            column(Alternate_Phone; "Alternate Phone") { }
            column(Address_Line_1; "Address Line 1") { }
            column(City; City) { }
            column(State; State) { }
            column(Postal_Code; "Postal Code") { }
            column(Emergency_Contact_Name; "Emergency Contact Name") { }
            column(Emergency_Contact_Phone; "Emergency Contact Phone") { }
            column(Status; Status) { }
            column(Blood_Group; "Blood Group") { }
            column(Known_Allergies; "Known Allergies") { }

            // filter(FilterName; SourceFieldName)
            // {

            // }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}