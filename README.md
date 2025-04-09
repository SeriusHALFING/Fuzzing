# Web Fuzzing Automation Script
This repository contains a simple Bash script (web_fuzz.sh) designed to automate basic web fuzzing and reconnaissance tasks using widely-used security tools like Nikto, Dirb, Gobuster, and FFUF.

## 📌 Features
Scans a target web server for common vulnerabilities and hidden paths.

Automatically runs multiple tools and collects their output into timestamped result folders.

Supports optional use of Gobuster and FFUF if they are installed.

## 🧰 Tools Used
Nikto – Web server vulnerability scanner.

Dirb – Web content scanner using a wordlist.

Gobuster (optional) – Directory/file scanner written in Go.

FFUF (optional) – Fast web fuzzer written in Go.

## 🔧 Requirements
Ensure the following tools are installed on your system:



nikto

dirb

(optional) gobuster

(optional) ffuf

Also make sure the default wordlist exists at:

/usr/share/wordlists/dirb/common.txt

## 🚀 Usage

chmod +x web_fuzz.sh

./web_fuzz.sh http://target.com

Replace http://target.com with the URL of your target web application.

## 📂 Output
The script creates a results folder named fuzz_results_YYYYMMDD_HHMMSS containing:

nikto_results.txt – Output from Nikto

dirb_results.txt – Output from Dirb

gobuster_results.txt – Output from Gobuster (if available)

ffuf_results.json – Output from FFUF (if available)

## 📎 Notes
If Gobuster or FFUF are not found in your system's $PATH, they will be skipped.

This is intended for authorized security testing and learning purposes only.

## ⚠️ Disclaimer
Use responsibly. Unauthorized scanning of systems is illegal and unethical.
