page 50108 "Hospital Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Hospital Administration';

    layout
    {
        area(RoleCenter)
        {
            part(HospitalOverview; "Hospital Cues")
            {

            }
        }
    }

    actions
    {
        area(Sections)
        {
            group("All Patients")
            {
                Caption = 'All Patients';
                action("Patients List")
                {
                    ApplicationArea = All;
                    Caption = 'View All Patients';
                    RunObject = page Patients;
                }
            }
            group(Navigations)
            {
                Caption = 'All Doctors';

                action(Doctors)
                {
                    ApplicationArea = All;
                    Caption = 'Doctors';
                    RunObject = Page HOSDoctor;
                }


            }
            group(Queues)
            {
                Caption = 'Queues';

                action(Queue)
                {
                    ApplicationArea = All;
                    Caption = 'Queues';
                    RunObject = Page HOSQueue;
                }
                action("Outpatient Dashboard")
                {
                    ApplicationArea = All;
                    Caption = 'Outpatient Dashboard';
                    RunObject = Page HOSQueueDashboard;
                }


            }

            group("Setup")
            {
                Caption = 'Hospital Setup';

                action("Hospital Setup")
                {
                    ApplicationArea = All;
                    Caption = 'Hospital Setup';
                    RunObject = Page "Hospital Setup";
                }


            }
        }
    }

    var
        myInt: Integer;
}