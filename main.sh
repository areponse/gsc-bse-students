#!/usr/bin/env bash
#function for program loader
function load {
    #thi loop will loop up to 10 every after 0.1 sec we will display one dot
            for i in {1..10}; do
              echo -n "."
              sleep 0.1
            done
            echo -e "100%\n"
}
#this is welcome message
echo -e "\n\n***************** Welcome To Bachelor of Software Engineering cohort list of students ***************\n"
echo -n "Starting App "
            load
file_path="students-list_0923.txt"

#----------------------------------------function To Register student
function register {
 #get inputs with read function
 read -p "Enter Student Email: " email
 read -p "Enter Student Age : " age
 read -p "Enter Student Id : " id
 
 #check if email is alu email or not
 if [[ $email == *"@alustudent.com" ]]; then
#check if file exists
 if [ -e "$file_path" ]; then
 echo "adding Student"
 else
     #if file doesn't exist add student and create table header design
  printf "+----------------------------+----------------------------+-------------------------------------\n">$file_path
 printf "| %-26s | %-26s | %-36s |\n" "student Id" "Age" "Email">>$file_path
 # Print separator line
 printf "+----------------------------+----------------------------+-------------------------------------\n">>$file_path
 #this is the message to display when adding data
 echo "Creating Table and Adding Data"
 fi
 sleep 1
 #use grep to search if student id  exists student id i made it primary or unique no 2 student are allowed to have the same student id 
 if grep -E "^\|[[:space:]]*$id[[:space:]]*\|" $file_path; then
 #message Error  notification
 echo -e "\n\n****The Student Id Already Exists***\n"
 #restart app for user to enter new data using sleep to wait a bit and clear every thing and open main.sh
 sleep 2
 clear
 ./main.sh
 #if the student id doesnt exist then add data to file
 else
 # Print table rows this print will save data without changing the format %-... are to show width if you use echo the formating won't work
 printf "| %-26s | %-26s | %-36s |\n" "$id" "$age" "$email" >>$file_path
 printf "+----------------------------+----------------------------+-------------------------------------\n">>$file_path
 #loading message
 echo -n "opening preview loading ";
 #this is the load function im calling
            load
 #end of loading 
 #this will open preview of student
 cat $file_path
 #this is to nitifiy a user that we are ruturning home
 echo -e "\n\n returning to Home\n\n"
  #this is the load function im calling
            load
 #end of loading 
        clear
       ./main.sh
 fi

 else
      #this is error reporting when user enter invalid alu email 
     echo -e "\n\n**************** This is Not A valid ALU Student Email ****************\n\n"
      #this is will call the function again and user will be able to enter data again
  register
fi
}

#----------------------------------------Function to update a student record by ID
function update_student() {
    read -p "Enter student ID to update: " student_id
    if grep -q "^\|[[:space:]]*$student_id[[:space:]]*\|" $file_path; then
        read -p "Enter new email: " new_email
        read -p "Enter new age: " new_age

        # Check if the new email is a valid ALU student email
        if [[ $new_email == *"@alustudent.com" ]]; then
            # Updating record in-place while preserving the format
            sed -E -i "s/^\|[[:space:]]*$student_id[[:space:]]*\|[[:space:]]*[^|]*[[:space:]]*\|[[:space:]]*[^|]*[[:space:]]*\|$/| $(printf "%-26s" "$student_id") | $(printf "%-26s" "$new_age") | $(printf "%-36s" "$new_email") |/" $file_path
            echo -n "Student record updated."
        else
            echo "Please enter a valid ALU student email."
        fi
    else
        echo "Student with ID $student_id not found."
    fi
        load

        #this is to nitifiy a user that we are ruturning home
        echo -e "\n\n returning to Home\n\n"
        #this is the load function im calling
        load
    clear
    ./main.sh
}
#---------------------------------------function To Delete student
function delete_student {
    #get student Id
    read -p "Enter The Student Id To Delete: " id
    #check If file Exists To Avoid Errors
    if [ -f "$file_path" ]; then
    #use Grep To Search Student Id that matches the pattern
        grep -E -n "^\|[[:space:]]*$id[[:space:]]*\|" "$file_path" | while read -r line; do
        #lines matches including numbers and split them (with line numbers)
            line_num=$(echo "$line" | cut -d ':' -f 1)
            #delete the line that matched the search and the next line
            sed -i "${line_num}d;$(($line_num+1))d" "$file_path"
        done
        echo "Deleted row with Student ID: $id"

        echo -e "\n\n **** Preparing Your Preview **** \n\n"
            load
        #end of loading 
        clear
        view_student
    else
        echo "Error: File not found at path: $file_path"
        echo -e "\n\n **** returning to Home ****\n\n"
            load
        #end of loading 
        clear
        ./main.sh
    fi

}
function view_student {
# Check if the file exists
if [ -f "$file_path" ]; then
#check if file is empty
if [ -s "$file_path" ]; then
#message
echo -e "\n\n \t\t\t*** Viewing All Students ***\n\n\n"
#display students
cat "$file_path"
#and also call restart the app for user to choice other
./main.sh
else
echo "No Student Found. Try Adding New Students."
echo -e "\n\n **** returning to Home **** \n\n"
#call the load function
load
#clear everything and restart the app for user
clear
./main.sh
fi
else
echo "File Not Found."
echo -e "\n\n **** returning to Home **** \n\n"
load
clear
./main.sh
fi

}
function email_save {                                                                                                                
    echo -n "Saving Emails in ASC"                                                                                                   
    sleep 0.6                                                                                                                        
    clear                                                                                                                            
    ./select-emails.sh                                                                                                                 
}                                                                                                                                      
function view_email {                                                                                                                
            #loading message                                                                                                         
            echo -n "opening Emails preview in ASC Order";                                                                           
            load                                                                                                                     
 # End of loading                                                                                                                    
            cat student-emails.txt                                                                                                           
            ./main.sh                                                                                                                                                                                                                                                
}
#backup function                                                                                                                       
function back_up {                                                                                                                     
    read -p "Are Sure You Want To Backup Your data (Y or N) if you backup this data everything will be backed up and you wont be able \
to run this program unless you go to online sever or backup directory : " opt                                                          
                                                                                                                                       
   if [ "$opt" == 'Y' ] || [ "$opt" == 'y' ]; then                                                                                     
            echo -n "opening Backup";                                                                                                  
            load                                                                                                                       
    ./move-to-directory.sh                                                                                                             
    else                                                                                                                               
    echo $opt                                                                                                                          
            echo -n "returning to home";                                                                                               
            load                                                                                                                       
    ./main.sh                                                                                                                          
    fi                                                                                                                                 
}
function exit_main {                                                                                                                   
    #send message for closing app                                                                                                      
    echo -n "Closing App The App Wait For Seconds To Finsh"                                                                            
    sleep 0.6                                                                                                                          
    clear                                                                                                                              
    #kill the main process                                                                                                           
    pkill -f './main.sh'                                                                                                                                                                                                                                     
}   
#---------------------------------------Menu for program

echo -e "\n\n Choose What You Want To Do With Our App\n"
echo "1) add New Student"
echo "2) Update Student"
echo "3) delete student"
echo "4) view all students"
echo "5) extract and sort emails"
echo "6) view extracted emails"
echo "7) Backup file on online Serve"
echo "8) Exit Program"

echo -e "\n"
read -p "Enter Your choice Here: (1-8) " choice
echo -e "\n"

case $choice in
    1) 
        register
        ;;
    2) 
        update_student
        ;;
    3)  
	      delete_student
	      ;;
    4)   
	      view_student
	      ;;
    5)
         email_save
	 ;;
    6)                                                                                                                                 
      view_email                                                                                                                     
      ;;                                                                                                                               
    7)                                                                                                                                 
        back_up                                                                                                                      
        ;;                                                                                                                             
    8)                                                                                                                                 
        exit_main                                                                                                                    
        ;; 
	
    *)
        echo "Invalid choice Try again. (1-8)"
        ./main.sh
        ;;
esac
