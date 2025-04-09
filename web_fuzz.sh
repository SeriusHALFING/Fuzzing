#!/bin/bash

# Usage: ./web_fuzz.sh http://target.com

TARGET=$1

# Default wordlist
WORDLIST="/usr/share/wordlists/dirb/common.txt"

if [ -z "$TARGET" ]; then
  echo "Usage: $0 http://target.com"
  exit 1
fi

echo "==================================="
echo " Web Fuzzing Script"
echo " Target: $TARGET"
echo "==================================="

# Create output directory
OUTDIR="fuzz_results_$(date +%Y%m%d_%H%M%S)"
mkdir "$OUTDIR"

echo "[*] Running Nikto..."
nikto -h "$TARGET" -output "$OUTDIR/nikto_results.txt"

echo "[*] Running Dirb..."
dirb "$TARGET" "$WORDLIST" -o "$OUTDIR/dirb_results.txt"


if command -v gobuster &> /dev/null; then
  echo "[*] Running Gobuster..."
  gobuster dir -u "$TARGET" -w "$WORDLIST" -o "$OUTDIR/gobuster_results.txt"
else
  echo "[!] Gobuster not found. Skipping..."
fi


if command -v ffuf &> /dev/null; then
  echo "[*] Running FFUF..."
  ffuf -u "${TARGET}/FUZZ" -w "$WORDLIST" -o "$OUTDIR/ffuf_results.json" -of json
else
  echo "[!] FFUF not found. Skipping..."
fi

echo "==================================="
echo "[+] Fuzzing completed!"
echo "[+] Results saved in: $OUTDIR"
echo "==================================="
