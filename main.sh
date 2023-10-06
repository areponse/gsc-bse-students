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
#---------------------------------------Menu for program


echo -e "\n\n Choose What You Want To Do With Our App\n"
echo "1) add New Student"

echo -e "\n"
read -p "Enter Your choice Here: " choice
echo -e "\n"

case $choice in
    1)
        register
        ;;

    *)
        echo "Invalid choice Try again."
        ./main.sh
        ;;
esac
