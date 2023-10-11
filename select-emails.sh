#!/bin/bash

# Specify the input text file containing email addresses
input_file="select-emails.sh"

# Specify the output file to save the extracted email addresses
output_file="student-emails.txt"

# Use grep and a regular expression to select email addresses
grep -o -E '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\b' "$input_file" > "$output_file"
