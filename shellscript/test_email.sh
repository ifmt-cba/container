#!/bin/bash

# Regular expression for email validation
regex="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

# Test cases
emails=(
    "galilea.mehmut@example.com"
    "galilea_mehmut123@example.co.uk"
    "ayuba.tama123@example.io"
    "ayuba-tama@example.info"
    "user+name@example.co"
    "user.name@sub.domain.example.com"
    "invalid-email@com"
    "@example.com"
    "user@.com"
    "user@com."
)

# Function to test the regex against each email
function test_email {
    local email=$1
    if [[ $email =~ $regex ]]; then
        echo "$email - Match"
    else
        echo "$email - No Match"
    fi
}

test_email
