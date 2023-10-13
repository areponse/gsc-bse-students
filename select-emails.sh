#!/bin/bash                                                                                                                             
file_path='students-list_0923.txt'                                                                                                     
file_save='student-emails.txt'                                                                                                         
if [ -f "$file_path" ]; then                                                                                                           
    new_email=$(awk -F '|' 'NR > 3 { gsub(/^[ \t]+|[ \t]+$/, "", $4); print $4 }' "$file_path")                                        
    echo "$new_email" > "$file_save"                                                                                                   
                                                                                                                                       
    # Loading message                                                                                                                  
    echo -n "Opening Emails preview in ASC Order"                                                                                      
    for i in {1..10}; do                                                                                                               
        echo -n "."                                                                                                                    
        sleep 0.1                                                                                                                      
    done                                                                                                                               
    echo -e "100%\n"                                                                                                                   
    # End of loading                                                                                                                   
    cat "$file_save" | sort > "$file_save.temp"                                                                                        
    mv "$file_save.temp" "$file_save"                                                                                                  
                                                                                                                                       
    echo -e "\n\n\n"                                                                                                                   
    ./main.sh                                                                                                                          
else                                                                                                                                   
    echo "File doesn't exist"                                                                                                          
fi                                                                                                                                     
     
