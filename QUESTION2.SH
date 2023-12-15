#!/bin/bash

echo "Enter filename: "
read filename

if [ -e "$filename" ]
then
    echo "The file '$filename' exists."
    if [ -f "$filename" ]
    then
        echo "It is an ordinary file."
        echo "Access permissions: $(stat -c '%a' $filename)"
        echo "Size: $(stat -c '%s' $filename) bytes"
        echo "Last modified: $(stat -c '%y' $filename)"
    elif [ -d "$filename" ]
    then
        echo "It is a directory."
        num_files=$(find $filename -type f | wc -l)
        num_dirs=$(find $filename -type d | wc -l)
        echo "Number of files: $num_files"
        echo "Number of subdirectories: $num_dirs"
    fi
else
    echo "The file '$filename' does not exist."
fi