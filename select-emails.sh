#!/bin/bash

# Input file containing student records
students_file="students-list_0923.txt"

# Output file to save student emails
output_file="student-emails.txt"

# Use grep to extract student emails and save them to the output file
grep -oE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b' "$students_file" > "$output_file"

echo "Student emails extracted and saved to $output_file."
