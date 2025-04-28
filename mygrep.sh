#!/bin/bash

# --- Function to show usage info ---
show_help() {
  echo "Usage: $0 [OPTIONS] search_string filename"
  echo "Options:"
  echo "  -n    Show line numbers"
  echo "  -v    Invert match (show non-matching lines)"
  echo "  --help Show this help message"
  exit 0
}

# --- Argument Validation ---
if [[ $# -lt 1 ]]; then
  echo "Error: Too few arguments."
  show_help
fi

# --- Handle --help separately ---
if [[ "$1" == "--help" ]]; then
  show_help
fi

# --- Default values ---
show_line_numbers=false
invert_match=false

# --- Option Parsing ---
while [[ "$1" == -* ]]; do
  case "$1" in
    -n)
      show_line_numbers=true
      ;;
    -v)
      invert_match=true
      ;;
    *)
      echo "Error: Unknown option '$1'"
      show_help
      ;;
  esac
  shift
done

# After parsing options, $1 should be search string
search_string="$1"
filename="$2"

# --- Validate search string and filename ---
if [[ -z "$search_string" ]]; then
  echo "Error: Missing search string."
  show_help
fi

if [[ -z "$filename" ]]; then
  echo "Error: Missing filename."
  show_help
fi

if [[ ! -f "$filename" ]]; then
  echo "Error: File '$filename' not found."
  exit 1
fi

# --- Main Logic ---
line_number=0
while IFS= read -r line; do
  ((line_number++))
  
  # Case-insensitive match
  if [[ "$line" =~ $search_string ]]; then
    matched=true
  elif [[ "${line,,}" =~ ${search_string,,} ]]; then
    matched=true
  else
    matched=false
  fi

  # Invert match if needed
  if $invert_match; then
    matched=$(! $matched && echo true || echo false)
  fi

  # Print if matched
  if $matched; then
    if $show_line_numbers; then
      echo "${line_number}:$line"
    else
      echo "$line"
    fi
  fi
done < "$filename"

