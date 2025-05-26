#!/bin/bash

# Regular expression for URL extraction
regex='(https?:\/\/(www\.)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}([\/?][^\s]*)?)'

# Block of text containing URLs
text="
Here are some URLs:
- https://www.example.com
- http://example.com
- https://example.co.uk/path?query=param
- http://www.example.org/test
- https://subdomain.example.net
- http://example.com/path/to/resource
- https://example.com?name=value&key=123
Visit https://www.another-example.com for more info.
Check out this site: http://example.io
"

# Extract and print URLs
while [[ $text =~ $regex ]]; do
    echo "${BASH_REMATCH[0]}"
    text=${text#*"${BASH_REMATCH[0]}"}
done

