#!/bin/bash
# =============================================================================
# Script 2: FOSS Package Inspector
# Author: Abdul Samad Khan | Course: Open Source Software | VITyarthi
# Chosen Software: Git
# Concepts Used: if-then-else, case statement, dpkg/apt, pipe with grep
# =============================================================================

# --- Package to inspect ---
PACKAGE="git"   # The FOSS package we are auditing

echo "============================================================"
echo "         FOSS Package Inspector — $PACKAGE"
echo "============================================================"

# --- Detect package manager and check if Git is installed ---
# Try dpkg first (Debian/Ubuntu), fall back to rpm (RHEL/Fedora)
if command -v dpkg &>/dev/null; then
    # dpkg-based system (Ubuntu, Debian, Kali, etc.)
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo "[OK] $PACKAGE is INSTALLED on this system."
        echo ""
        echo "--- Package Details ---"
        # Use dpkg -s to get version, license, and summary info
        dpkg -s "$PACKAGE" | grep -E 'Version|Homepage|Description'
    else
        echo "[!!] $PACKAGE is NOT installed."
        echo "     Install it with: sudo apt install git"
    fi

elif command -v rpm &>/dev/null; then
    # rpm-based system (Fedora, RHEL, CentOS)
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "[OK] $PACKAGE is INSTALLED on this system."
        echo ""
        echo "--- Package Details ---"
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo "[!!] $PACKAGE is NOT installed."
        echo "     Install it with: sudo dnf install git"
    fi

else
    # Neither dpkg nor rpm found — check if git binary exists at all
    if command -v git &>/dev/null; then
        echo "[OK] $PACKAGE is available. Version: $(git --version)"
    else
        echo "[!!] Could not determine package manager. Please check manually."
    fi
fi

echo ""
echo "--- Open Source Philosophy Note ---"

# --- case statement: print philosophy note based on package name ---
case "$PACKAGE" in
    git)
        echo "Git: Born in 2005 when Linus Torvalds needed a version control"
        echo "     system that proprietary tools could not give him — speed,"
        echo "     distributed design, and freedom. He built it in two weeks."
        echo "     Today, nearly every software project in the world uses it."
        ;;
    python3 | python)
        echo "Python: A language shaped entirely by its community since 1991."
        echo "        The PSF license grants you every freedom to use, modify,"
        echo "        and distribute it — even in commercial products."
        ;;
    vlc)
        echo "VLC: Built by students at Ecole Centrale Paris who needed to"
        echo "     stream video on campus. Now it plays anything, anywhere,"
        echo "     licensed under LGPL/GPL."
        ;;
    firefox)
        echo "Firefox: A nonprofit browser fighting for an open web."
        echo "         Mozilla exists to ensure the internet stays free"
        echo "         and accessible to everyone."
        ;;
    apache2 | httpd)
        echo "Apache: The web server that helped build the World Wide Web."
        echo "        Powers roughly 30% of all websites globally under"
        echo "        the permissive Apache 2.0 license."
        ;;
    *)
        echo "$PACKAGE: An open-source tool built on transparency,"
        echo "           community collaboration, and the freedom to share."
        ;;
esac

echo "============================================================"
