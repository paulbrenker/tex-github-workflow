#!/bin/bash

git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "A git repository must be checked out."
    exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

git fetch origin main

BASE_BRANCH=$(git merge-base origin/main HEAD 2>/dev/null)
if [ -z "$BASE_BRANCH" ]; then
    echo "Could not determine the base branch."
    exit 1
fi

FILES=$(git diff --name-only --diff-filter=ACM $BASE_BRANCH -- "*.tex" | awk -F'/' 'NF==1' | sort | uniq | sed 's/\.tex$//' | jq -R . | jq -s .)
echo "Changed files are: $FILES"


if [ -n "$GITHUB_OUTPUT" ]; then
    echo "files=$FILES" >> "$GITHUB_OUTPUT"
fi