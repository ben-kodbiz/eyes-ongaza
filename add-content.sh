#!/bin/bash

echo "Palestine News Content Creator"
echo "============================"
echo

# Ask for content type
echo "What type of content would you like to add?"
echo "1. Poem"
echo "2. Article"
read -p "Enter your choice (1 or 2): " content_type

# Get common metadata
read -p "Title: " title
read -p "Author: " author

# Generate date
date=$(date +%Y-%m-%d)
echo "Date: $date (today's date will be used)"

# Create filename from title
# Convert to lowercase, replace spaces with hyphens, remove special characters
filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')
filename="${date}-${filename}.md"

# Content specific metadata and file creation
if [ "$content_type" == "1" ]; then
    # Poem specific
    read -p "Dedication (e.g., 'Children of Gaza'): " dedication
    read -p "Add an image? (path relative to /assets/images/ or leave empty): " image_path

    # Create directory if it doesn't exist
    mkdir -p _poems

    # Create the file
    cat > "_poems/$filename" << EOF
---
layout: poem
title: "$title"
date: $date
author: "$author"
dedication: "$dedication"
EOF

    # Add image if provided
    if [ ! -z "$image_path" ]; then
        echo "image: \"/assets/images/$image_path\"" >> "_poems/$filename"
    fi

    # Close front matter and add placeholder
    cat >> "_poems/$filename" << EOF
---

*Your poem content goes here*

## Poem Title or Section

First stanza of your poem
Goes right here with line breaks
Expressing your emotions

Second stanza continues
With more powerful words
Honoring Palestinian resilience

*In memory of those who have lost their lives in Palestine*
EOF

    echo "Poem file created: _poems/$filename"

elif [ "$content_type" == "2" ]; then
    # Article specific
    read -p "Categories (comma separated, e.g., 'History, Context'): " categories_input
    read -p "Add an image? (path relative to /assets/images/ or leave empty): " image_path

    # Format categories
    categories=$(echo "$categories_input" | sed 's/, */", "/g')

    # Create directory if it doesn't exist
    mkdir -p _articles_history

    # Create the file
    cat > "_articles_history/$filename" << EOF
---
layout: post
title: "$title"
date: $date
author: "$author"
categories: ["$categories"]
EOF

    # Add image if provided
    if [ ! -z "$image_path" ]; then
        echo "image: \"/assets/images/$image_path\"" >> "_articles_history/$filename"
    fi

    # Close front matter and add placeholder
    cat >> "_articles_history/$filename" << EOF
---

## Introduction

This article provides information about $title. Replace this placeholder text with your actual content.

## Main Section

Your main content goes here. You can use Markdown formatting for:
- Lists
- *Emphasis*
- **Strong emphasis**
- [Links](https://example.com)

### Subsection

More detailed information can be organized in subsections.

## Conclusion

Summarize your article here and provide any final thoughts or calls to action.
EOF

    echo "Article file created: _articles_history/$filename"

else
    echo "Invalid choice. Please run the script again and select 1 or 2."
    exit 1
fi

echo
echo "File created successfully! You can now edit it to add your content."
echo "After editing, commit and push your changes to update the website."
