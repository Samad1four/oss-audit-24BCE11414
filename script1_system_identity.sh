#!/bin/bash
# =============================================================================
# Script 1: System Identity Report
# Author: Abdul Samad Khan | Course: Open Source Software | VITyarthi
# Chosen Software: Git (GPL v2)
# Concepts Used: Variables, echo, command substitution $(), formatted output
# =============================================================================

# --- Student & software variables ---
STUDENT_NAME="Abdul Samad Khan"        # Student's full name
SOFTWARE_CHOICE="Git"                   # Chosen open-source software
SOFTWARE_LICENSE="GNU General Public License v2 (GPL v2)"  # Git's license

# --- Gather system information using command substitution ---
DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)                      # Kernel version from uname
USER_NAME=$(whoami)                     # Currently logged-in user
HOME_DIR=$HOME                          # Home directory from env variable
UPTIME=$(uptime -p)                     # Human-readable uptime
DATETIME=$(date '+%d %B %Y, %H:%M:%S') # Formatted current date and time
HOSTNAME=$(hostname)                    # Machine hostname
CPU=$(uname -m)                         # CPU architecture

# --- Display formatted welcome screen ---
echo "============================================================"
echo "       Open Source Audit — System Identity Report"
echo "============================================================"
echo "  Student   : $STUDENT_NAME"
echo "  Software  : $SOFTWARE_CHOICE"
echo "============================================================"
echo "  Hostname  : $HOSTNAME"
echo "  Distro    : $DISTRO"
echo "  Kernel    : $KERNEL"
echo "  Arch      : $CPU"
echo "  User      : $USER_NAME"
echo "  Home Dir  : $HOME_DIR"
echo "  Uptime    : $UPTIME"
echo "  Date/Time : $DATETIME"
echo "============================================================"
echo "  OS License: This system runs on Linux, licensed under"
echo "              the GNU GPL — the same license that protects"
echo "              Git itself. You are free to run, study,"
echo "              modify, and distribute this software."
echo "============================================================"
