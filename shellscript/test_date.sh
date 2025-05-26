#!/bin/bash

# Regular expressions for different date formats
regex_mm_dd_yyyy="([0-1]?[0-9])\/([0-2]?[0-9]|3[01])\/([0-9]{4})"
regex_yyyy_mm_dd="([0-9]{4})-([0-1]?[0-9])-([0-2]?[0-9]|3[01])"
regex_written_out="([Jj]anuary|[Ff]ebruary|[Mm]arch|[Aa]pril|[Mm]ay|[Jj]une|[Jj]uly|[Aa]ugust|[Ss]eptember|[Oo]ctober|[Nn]ovember|[Dd]ecember) ([0-2]?[0-9]|3[01]), ([0-9]{4})"

# Block of text containing dates in various formats
text="
Here are some dates:
- 12/25/2023
- 2024-05-20
- March 15, 2021
- 01/01/2020
- 1999-12-31
- February 29, 2020
- 10/31/2021
- 2022-11-11
"

# Function to extract and print dates based on a regex
function extract_dates {
    local regex=$1
    local text=$2
    while [[ $text =~ $regex ]]; do
        echo "${BASH_REMATCH[0]}"
        text=${text#*"${BASH_REMATCH[0]}"}
    done
}

# Extract dates in MM/DD/YYYY format
echo "Dates in MM/DD/YYYY format:"
extract_dates "$regex_mm_dd_yyyy" "$text"

# Extract dates in YYYY-MM-DD format
echo "Dates in YYYY-MM-DD format:"
extract_dates "$regex_yyyy_mm_dd" "$text"

# Extract dates in written-out format
echo "Dates in written-out format:"
extract_dates "$regex_written_out" "$text"

