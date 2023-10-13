#!/bin/bash

students_file="students-list_0923.txt"
output_file="student-emails.txt"

cut -d ',' -f 1 "$students_file" | sort > "$output_file"
