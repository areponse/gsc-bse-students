#!/usr/bin/env bash 
#function for program loader
function load {
            for i in {1..10}; do
              echo -n "."
              sleep 0.1
            done
            echo -e "100%\n"
}
#check if directory exists
folder="negpod_21-q1"
#file initialization
s_email='select-emails.sh'
main='main.sh'
file_path='students-list_0923.txt'
file_save='student-emails.txt'
if [ -f "$s_email" ] && [ -f "$main" ] && [ -f "$file_path" ] && [ -f "$file_save" ];then
if [ -d "$folder" ];then
 echo -n "Moving Files "
 load
 mv -f "$main" "$s_email" "$file_save" "$file_path" "$folder"
 echo -n "Backing up data to alu-cod.online "
load
./backup-Negpod_21.sh
else
 echo -n "creating director "
 load
 mkdir "$folder"

 echo -n "Folder Created Successful !! Moving Files "
 load
 mv -f "$main" "$s_email" "$file_save" "$file_path" "$folder"
 echo -n "Backing up data to alu-cod.online "
load
./backup-Negpod_21.sh
fi
else
echo "Error You Files Dont Exist"
echo -n "Ending Programming "
load
fi
