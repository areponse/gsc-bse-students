#!/bin/bash

file_path='students-list_0923.txt'
file_save='student-emails.txt'

if [ -f "$file_path" ]; then
    # Extract and sort emails in ascending order
    awk -F '|' 'NR > 2 { gsub(/^[ \t]+|[ \t]+$/, "", $3); print $3 }' "$file_path" | sort > "$file_save"

    # Loading message
    echo -n "Opening Emails preview in ASC Order"
    for i in {1..10}; do
        echo -n "."
        sleep 0.1
    done
    echo -e "100%\n"
    # End of loading

    ./main.sh
else
    echo "File doesn't exist"
fi
