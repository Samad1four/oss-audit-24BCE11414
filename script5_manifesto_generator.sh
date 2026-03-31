#!/bin/bash
# =============================================================================
# Script 5: Open Source Manifesto Generator
# Author: Abdul Samad Khan | Course: Open Source Software | VITyarthi
# Chosen Software: Git
# Concepts Used: read for user input, string concatenation, writing to file
#                with >, date command, alias concept demonstrated in comments
# =============================================================================

# --- Alias concept (demonstrated via comment — aliases are shell shortcuts) ---
# In a real shell session you might run: alias gen='./script5_manifesto_generator.sh'
# Then just type: gen   — this is how aliases reduce typing in open-source workflows

echo "============================================================"
echo "        Open Source Manifesto Generator"
echo "        Powered by Git & GNU Bash"
echo "============================================================"
echo ""
echo "Answer three questions to generate your personal open-source"
echo "philosophy statement. Your answers will be saved to a file."
echo ""

# --- Gather user input using read ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Get current date for the manifesto header ---
DATE=$(date '+%d %B %Y')

# --- Output filename includes username to make it personal ---
OUTPUT="manifesto_$(whoami).txt"

# --- Compose and write the manifesto to a file using > and >> ---
# The > operator creates/overwrites the file; >> appends to it
echo "============================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Generated on: $DATE" >> "$OUTPUT"
echo "  By: $(whoami)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- String concatenation: build the manifesto paragraph ---
echo "Every day, I rely on $TOOL — a tool that exists because" >> "$OUTPUT"
echo "someone chose to build in the open and share their work" >> "$OUTPUT"
echo "freely with the world. To me, freedom in software means" >> "$OUTPUT"
echo "$FREEDOM: the power to read, change, and distribute the" >> "$OUTPUT"
echo "tools that shape our lives without asking for permission." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "I believe in the open-source way. I would build $BUILD" >> "$OUTPUT"
echo "and release it freely, because the greatest software was" >> "$OUTPUT"
echo "not locked behind a paywall — it was shared. Linus Torvalds" >> "$OUTPUT"
echo "did not sell Linux. He posted it to a mailing list and wrote:" >> "$OUTPUT"
echo "'I'm doing a free operating system — just a hobby.'" >> "$OUTPUT"
echo "That hobby now runs the internet, every Android phone," >> "$OUTPUT"
echo "and nearly every supercomputer on earth." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a license. It is a statement that" >> "$OUTPUT"
echo "knowledge belongs to everyone." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm to the user and display the manifesto ---
echo ""
echo "[OK] Manifesto saved to: $OUTPUT"
echo ""
echo "--- Your Manifesto ---"
cat "$OUTPUT"
echo "============================================================"
