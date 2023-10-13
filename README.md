
Cohort Student Management System

This script is designed to manage a cohort of students. It includes various functions for registering, updating, deleting students, viewing the student list, extracting and sorting emails, backing up data, and exiting the application.

Contributors

- Loue Sauveur Christian: Implemented the function for registering students and the backup function to store data in an online server.

- Ashimwe Reponse: Worked on the update function for student record modification. Also, created a Git repository for version control and implemented the backup function to move files to a backup folder.

- Kanisa Thiak: Implemented functions to delete a student record and view all students in the cohort.

- Lesly Ndizeye: Developed a feature to save student emails in sorted order.

- Chance Karambizi: Implemented the "Exit" function, a function to view extracted emails, and the "Load" function for enhanced user experience.

Functionality

Here is a detailed overview of the functions included in this script:

1. Register Student:
   - Purpose: Allows the user to register a new student in the cohort.
   - Usage: Users will be prompted to enter the student's email, age, and student ID. The script validates the email and checks for duplicate student IDs.

2. Update Student Record:
   - Purpose: Enables users to update a student's email and age based on their ID.
   - Usage: Users will provide the student's ID, and if the ID exists, they can enter a new email and age. Email format is validated.

3. Delete Student:
   - Purpose: Permits users to delete a student's record based on their ID.
   - Usage: Users provide the student's ID to be deleted. If the ID exists, the record is removed from the list.

4. View All Students:
   - Purpose: Displays the complete list of students in the cohort.
   - Usage: The script shows the list of students. If the list is empty, it prompts the user to add new students.

5. Extract and Sort Emails:
   - Purpose: Initiates the process of saving student emails in ascending order.

6. View Extracted Emails:
   - Purpose: Displays the extracted and sorted student emails.

7. Backup Data:
   - Purpose: Provides an option to back up data to an online server or backup directory.
   - Usage: Users are prompted to confirm the backup operation. If confirmed, data is backed up accordingly.

8. Exit Application:
   - Purpose: Closes the application.

Usage

1. Clone the repository:

   git clone https://github.com/areponse/gsc-bse-students.git


2. Execute the script:
   
   ./main.sh



Contributors' Notes

- Loue Sauveur Christian focused on the initial setup and data backup.
- Ashimwe Reponse implemented version control and enhanced data backup.
- Kanisa Thiak implemented delete and view functions.
- Lesly Ndizeye worked on email extraction and sorting.
- Chance Karambizi contributed to user experience and the "Exit" function.

This script provides a comprehensive solution for managing student data in a cohort, with contributions from each team member to enhance its functionality.


