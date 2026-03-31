#!/bin/bash
# =============================================================================
# Script 3: Disk and Permission Auditor
# Author: Abdul Samad Khan | Course: Open Source Software | VITyarthi
# Chosen Software: Git
# Concepts Used: for loop, arrays, if-then-else, ls, du, awk, cut
# =============================================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share/doc/git")

# --- Git's config directory (where git stores global settings) ---
GIT_CONFIG_DIR="$HOME/.config/git"
GIT_GLOBAL_CONFIG="$HOME/.gitconfig"

echo "============================================================"
echo "       Disk and Permission Auditor"
echo "       Auditing System Directories"
echo "============================================================"
printf "%-30s %-20s %-10s\n" "Directory" "Permissions / Owner" "Size"
printf "%-30s %-20s %-10s\n" "---------" "-------------------" "----"

# --- for loop: iterate through each directory and report stats ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using awk from ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3}')
        # Get human-readable size; suppress permission-denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "%-30s %-20s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory does not exist on this system
        printf "%-30s %-20s\n" "$DIR" "[does not exist]"
    fi
done

echo ""
echo "============================================================"
echo "       Git Configuration Directory Check"
echo "============================================================"

# --- Check if Git's config directory exists and show its permissions ---
if [ -d "$GIT_CONFIG_DIR" ]; then
    PERMS=$(ls -ld "$GIT_CONFIG_DIR" | awk '{print $1, $3, $4}')
    echo "[OK] Git config dir found : $GIT_CONFIG_DIR"
    echo "     Permissions           : $PERMS"
else
    echo "[--] $GIT_CONFIG_DIR does not exist (no custom Git config folder set)"
fi

echo ""

# --- Check for the global .gitconfig file ---
if [ -f "$GIT_GLOBAL_CONFIG" ]; then
    PERMS=$(ls -l "$GIT_GLOBAL_CONFIG" | awk '{print $1, $3, $4}')
    SIZE=$(du -sh "$GIT_GLOBAL_CONFIG" | cut -f1)
    echo "[OK] Global .gitconfig found : $GIT_GLOBAL_CONFIG"
    echo "     Permissions              : $PERMS"
    echo "     Size                     : $SIZE"
else
    echo "[--] No global .gitconfig found at $GIT_GLOBAL_CONFIG"
    echo "     Run: git config --global user.name 'Your Name' to create one"
fi

echo "============================================================"
echo " Why permissions matter: Git stores credentials and SSH keys"
echo " in user-only readable files. Open permissions = security risk."
echo "============================================================"
