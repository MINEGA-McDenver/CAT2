#!/bin/bash

# this Verify if the command line argument count is exactly one.
if [ "$#" -ne 1 ]; then
    echo "Error: Please enter exactly one command line argument."
    exit 1
fi

# this Verify whether the command line argument is a positive integer
if ! [[ "$1" =~ ^[0-9]+$ ]] || [ "$1" -le 0 ]; then
    echo "Error: Please enter a positive integer as the command line argument."
    exit 1
fi

# let Define the function for sum
function sum_of_digits {
    local n=$1
    local sum=0
    while [ "$n" -gt 0 ]; do
        (( sum += n % 10 ))
        (( n /= 10 ))
    done
    echo "$sum"
}

# let Define the  function for product
function product_of_digits {
    local n=$1
    local product=1
    while [ "$n" -gt 0 ]; do
        (( product *= n % 10 ))
        (( n /= 10 ))
    done
    echo "$product"
}

# let Define the function for palindrome
function is_palindrome {
    local n=$1
    local reversed=0
    local original=$n
    while [ "$n" -gt 0 ]; do
        (( reversed = reversed * 10 + n % 10 ))
        (( n /= 10 ))
    done
    if [ "$original" -eq "$reversed" ]; then
        echo "Yes, $original is a palindrome."
    else
        echo "No, $original is not a palindrome."
    fi
}

# let Define the function for prime
function is_prime {
    local n=$1
    if [ "$n" -eq 1 ]; then
        echo "No, 1 is not a prime number."
        return
    fi
    for (( i=2; i<=n/2; i++ )); do
        if [ $((n%i)) -eq 0 ]; then
            echo "No, $n is not a prime number."
            return
        fi
    done
    echo "Yes, $n is a prime number."
}

# Prompt the user to choose an option
echo "Please choose an option:"
echo "1. Display the sum and the product of the digits of the number."
echo "2. Display whether the number is a palindrome or not."
echo "3. Display whether the number is prime or not."
read -p "Enter your choice (1/2/3): " choice

# Call the appropriate function based on the user's choice
case "$choice" in
    1)
        sum=$(sum_of_digits "$1")
        product=$(product_of_digits "$1")
        echo "The sum of the digits of $1 is $sum."
        echo "The product of the digits of $1 is $product."
        ;;
    2)
        is_palindrome "$1"
        ;;
    3)
        is_prime "$1"
        ;;
    *)
        echo "Error: Invalid choice."
        exit 1
        ;;
esac