# 🔍 The Open Source Audit Git

> OSS NGMC Capstone Project | VITyarthi | Open Source Software Course

---

## 👤 Student Details

| Field | Details |
|---|---|
| **Student Name** | Abdul Samad Khan |
| **Registration Number** | 24BCE11414 |
---

## 🖥️ Chosen Software

**Software:** Git
**License:** GNU General Public License v2 (GPL v2)
**Category:** Version Control System
**Official Site:** https://git-scm.com

Git is the version control system Linus Torvalds wrote in approximately **ten days** in April 2005, after BitKeeper , the proprietary VCS the Linux kernel team had been using , revoked free access. Rather than accept dependence on another proprietary tool, Torvalds built his own and released it under the GPL v2. Today, Git underpins virtually every software project on earth.

---

## 💻 Environment

These scripts were developed and tested on **Windows 11 using Git Bash** , the Unix-compatible shell that ships with Git for Windows. Git Bash provides a POSIX-compliant Bash environment on Windows, giving access to standard Linux commands (`grep`, `awk`, `ls`, `du`, `uname`, `whoami`, `date`, etc.) without needing a full Linux installation or virtual machine.

**Shell:** GNU Bash (bundled with Git for Windows)
**Tested on:** Windows 10 + Git Bash 2.x
**Also compatible with:** Ubuntu, Debian, Kali Linux, WSL2

---

## 📁 Repository Structure

```
oss-audit-[rollnumber]/
│
├── script1_system_identity.sh     # System Identity Report
├── script2_package_inspector.sh   # FOSS Package Inspector
├── script3_disk_auditor.sh        # Disk and Permission Auditor
├── script4_log_analyzer.sh        # Log File Analyzer
├── script5_manifesto_generator.sh # Open Source Manifesto Generator
└── README.md                      # This file
```

---

## 📜 Script Descriptions

### Script 1 , System Identity Report
Displays a formatted welcome screen showing the OS environment, kernel/shell version, logged-in user, home directory, system uptime, CPU architecture, current date/time, and a message about the GPL licence covering the OS. Works on both Git Bash (Windows) and native Linux.

**Concepts used:** Variables, `echo`, command substitution `$()`, `uname`, `whoami`, `hostname`, `date`, `uptime`, `/etc/os-release`
---

### Script 2 , FOSS Package Inspector
Detects whether Git is installed, checks using `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL) if available, and falls back to `command -v git` for Git Bash on Windows. Uses a `case` statement to print philosophy notes for Git and four other major FOSS tools.

**Concepts used:** `if-then-elif-else`, `case` statement, `dpkg -s`, `rpm -qi`, `command -v`, pipe with `grep`

---

### Script 3 , Disk and Permission Auditor
Loops through key system directories and checks Git's global configuration file (`~/.gitconfig`). Reports permissions, ownership, and disk usage for each. On Git Bash, paths like `/etc` map to Git's installation directory , the script handles both environments gracefully.

**Concepts used:** `for` loop, arrays, `if-then-else`, `ls -ld`, `du -sh`, `awk '{print $1,$3}'`, `cut -f1`

---

### Script 4 , Log File Analyzer
Reads a log file line by line, counts how many lines contain a keyword (default: `error`), and prints the last 5 matching lines. Includes robust input validation and a helpful usage tip if the file is not found.

**Concepts used:** `while IFS= read -r`, `if-then`, counter variables `$((COUNT + 1))`, `$1`/`$2` arguments, `grep -i`, `tail -5`, `wc -l`

**Usage:**
```bash
# On Git Bash or Linux , create a test log first:
echo -e "INFO: started\nERROR: module failed\nWARNING: low memory\nERROR: timeout" > test.log
./script4_log_analyzer.sh test.log error

# On Linux with a real system log:
./script4_log_analyzer.sh /var/log/syslog error
```

---

### Script 5 , Open Source Manifesto Generator
Asks the user three interactive questions and generates a personalised open-source philosophy statement, saving it to `manifesto_<username>.txt`. The alias concept is demonstrated in a comment inside the script.

**Concepts used:** `read -p`, string concatenation, `>` and `>>` file redirection, `date`, `whoami`, `cat`

---

## ⚙️ Dependencies

### On Git Bash
Git Bash includes everything needed out of the box. Just ensure Git for Windows is installed:

- Download from: https://git-scm.com/download/win
- During installation, select **"Use Git Bash as default shell"**
- All standard tools (`grep`, `awk`, `cut`, `ls`, `du`, `date`, `uname`) are included

---

## 🚀 How to Run

### On Git Bash (Windows)

**Step 1 , Install Git for Windows**
Download and install from https://git-scm.com/download/win. This gives you Git Bash.

**Step 2 , Clone or download this repository**
Open Git Bash and run:
```bash
git clone https://github.com/YOUR_USERNAME/oss-audit-ROLLNUMBER.git
cd oss-audit-ROLLNUMBER
```

**Step 3 , Make scripts executable**
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

**Step 4 , Run each script**
```bash
# Script 1: System Identity
./script1_system_identity.sh

# Script 2: Package Inspector
./script2_package_inspector.sh

# Script 3: Disk Auditor
./script3_disk_auditor.sh

# Script 4: Log Analyzer , create a test log first on Git Bash
echo -e "INFO: ok\nERROR: fail\nERROR: timeout\nWARNING: low disk" > test.log
./script4_log_analyzer.sh test.log error

# Script 5: Manifesto Generator (interactive , it will ask you questions)
./script5_manifesto_generator.sh
```
---

## 🧠 Shell Concepts Covered

| Concept | Script(s) |
|---|---|
| Variables & command substitution `$()` | 1, 2, 3, 4, 5 |
| `if-then-else` and `elif` conditional logic | 2, 3, 4 |
| `case` statement | 2 |
| `for` loop with arrays | 3 |
| `while IFS= read -r` loop | 4 |
| Counter variables & arithmetic `$(())` | 4 |
| Command-line arguments `$1`, `$2` | 4 |
| `read -p` for interactive user input | 5 |
| File writing with `>` (create) and `>>` (append) | 5 |
| `grep`, `awk`, `cut`, `tail`, `wc` | 2, 3, 4 |
| Aliases (concept demonstrated in script comment) | 5 |

---

## 📚 Key Learning

Through this project I understood:
- Why Linus Torvalds built Git , and how a proprietary tool's betrayal directly created the world's most important open-source tool
- How the GPL v2 licence protects software freedom and prevents modified versions from going proprietary
- How Git Bash brings Linux shell scripting to Windows , making open-source tooling accessible without a VM
- How shell scripting connects automation to the open-source philosophy of transparency and sharing
- How Linux manages file permissions, directory ownership, and software installation

---

## 🔗 References

- Git Official Site: https://git-scm.com
- GPL v2 Licence Text: https://spdx.org/licenses/GPL-2.0-only.html
- GNU Bash Manual: https://gnu.org/software/bash/manual
- The Linux Command Line (free): https://linuxcommand.org

---

*"Given enough eyeballs, all bugs are shallow."* , Eric S. Raymond, The Cathedral and the Bazaar
