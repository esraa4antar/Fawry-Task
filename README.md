# 📄 mygrep.sh — Custom Grep Script
##  📚 Overview
mygrep.sh is a simple Bash script that mimics basic functionality of the grep command.
It supports:

Searching for a string (case-insensitive) inside a file

Showing line numbers with matches

Inverting the match (show lines that don't match)

Combination of options -n, -v

Help menu with --help

## ⚙️ Usage
./mygrep.sh [options] search_string filename

## 📑 Options:
Option | Description

-n | Show line numbers for each matching line

-v | Invert match (show lines that do not match)

--help | Show help information

## 📂 Example Commands
Search for 'hello' in 'testfile.txt'

./mygrep.sh hello testfile.txt

Search and show line numbers

./mygrep.sh -n hello testfile.txt

Invert match and show line numbers

./mygrep.sh -vn hello testfile.txt

Invert match without line numbers

./mygrep.sh -v hello testfile.txt

Show help

./mygrep.sh --help


## 🚨 Error Handling
The script checks for:

Missing arguments

Missing file

Missing search string (e.g., if you type only -v without a search word)

## Screenshoot
![Screenshot from 2025-04-28 18-22-56](https://github.com/user-attachments/assets/12965bb8-ebe0-4c17-9256-e87ea9153b97)
