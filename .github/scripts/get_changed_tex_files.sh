#!/bin/bash

git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "A git repository must be checked out."
    exit 1
fi

FILES=$(git diff --name-only --diff-filter=ACM origin/main -- "*.tex" | awk -F'/' 'NF==1' | sort | uniq | sed 's/\.tex$//' | jq -R . | jq -s .)

echo "Changed files are: $FILES"


if [ -n "$GITHUB_OUTPUT" ]; then
    echo "files=$FILES" >> "$GITHUB_OUTPUT"
fi