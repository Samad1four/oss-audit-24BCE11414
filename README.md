# 🔍 The Open Source Audit — Git

> OSS NGMC Capstone Project | VITyarthi | Open Source Software Course

---

## 👤 Student Details

| Field | Details |
|---|---|
| **Student Name** | Abdul Samad Khan |
| **Registration Number** | *(Your Reg No. — e.g. 24BXX00000)* |
| **Slot** | *(Your slot)* |
| **Date of Submission** | March 2026 |

---

## 🖥️ Chosen Software

**Software:** Git
**License:** GNU General Public License v2 (GPL v2)
**Category:** Version Control System
**Official Site:** https://git-scm.com

> *"I'm doing a free operating system — just a hobby, won't be big and professional like GNU."*
> — Linus Torvalds, 1991 (about Linux, which later led to creating Git in 2005)

Git is the version control system Linus Torvalds wrote **in two weeks** in 2005 after BitKeeper — the proprietary tool the Linux kernel team had been using — revoked free access. Rather than surrender to a proprietary tool, Torvalds built his own and released it under the GPL. Today, Git is used by virtually every software project on earth.

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

### Script 1 — System Identity Report
Displays a formatted welcome screen showing: Linux distro, kernel version, logged-in user, home directory, system uptime, CPU architecture, current date/time, and a message about the GPL license covering the OS.

**Concepts used:** Variables, `echo`, command substitution `$()`, `lsb_release`, `uname`, `whoami`, `hostname`, `date`, `uptime`

---

### Script 2 — FOSS Package Inspector
Detects whether Git is installed on the system using `dpkg` (Debian/Ubuntu) or `rpm` (Fedora/RHEL), fetches its version and description, and uses a `case` statement to print a philosophy note about Git and four other major FOSS tools.

**Concepts used:** `if-then-else`, `case` statement, `dpkg -s`, `rpm -qi`, pipe with `grep`, `command -v`

---

### Script 3 — Disk and Permission Auditor
Loops through 6 important system directories (including Git's documentation directory `/usr/share/doc/git`) and reports permissions, ownership, and disk usage. Also checks for Git's global config file (`~/.gitconfig`) and config directory.

**Concepts used:** `for` loop, arrays, `if-then-else`, `ls -ld`, `du -sh`, `awk`, `cut`

---

### Script 4 — Log File Analyzer
Reads a log file line by line, counts keyword occurrences (default: `error`), and prints the last 5 matching lines. Includes robust input validation with a helpful retry/tip message if the file is not found.

**Concepts used:** `while IFS= read -r`, `if-then`, counter variables `$((COUNT + 1))`, `$1` `$2` arguments, `grep -i`, `tail -5`, `wc -l`

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
# or create a test log:
echo -e "INFO: started\nERROR: module failed\nWARNING: low memory\nERROR: timeout" > test.log
./script4_log_analyzer.sh test.log error
```

---

### Script 5 — Open Source Manifesto Generator
Asks the user three interactive questions and generates a personalised open-source philosophy statement, saving it to `manifesto_<username>.txt`. Demonstrates string concatenation, file writing with `>` and `>>`, the `date` command, and includes a comment explaining the alias concept.

**Concepts used:** `read -p`, string concatenation, `>` and `>>` file redirection, `date`, `whoami`, `cat`

---

## ⚙️ Dependencies

All scripts use standard GNU/Linux tools available by default on any Ubuntu/Debian system:

```bash
sudo apt update
sudo apt install git lsb-release coreutils grep gawk
```

---

## 🚀 How to Run

### Step 1 — Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/oss-audit-ROLLNUMBER.git
cd oss-audit-ROLLNUMBER
```

### Step 2 — Make Scripts Executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run Each Script

```bash
# Script 1: System Identity
./script1_system_identity.sh

# Script 2: Package Inspector
./script2_package_inspector.sh

# Script 3: Disk Auditor
./script3_disk_auditor.sh

# Script 4: Log Analyzer (needs a log file)
./script4_log_analyzer.sh /var/log/syslog error
# or with a test file:
echo -e "INFO: ok\nERROR: fail\nERROR: timeout\nWARNING: low disk" > test.log
./script4_log_analyzer.sh test.log error

# Script 5: Manifesto Generator (interactive)
./script5_manifesto_generator.sh
```

---

## 🧠 Shell Concepts Covered

| Concept | Script(s) |
|---|---|
| Variables & command substitution `$()` | 1, 2, 3, 4, 5 |
| `if-then-else` conditional logic | 2, 3, 4 |
| `case` statement | 2 |
| `for` loop with arrays | 3 |
| `while IFS= read -r` loop | 4 |
| Counter variables & arithmetic `$(())` | 4 |
| Command-line arguments `$1`, `$2` | 4 |
| `read` for interactive user input | 5 |
| File writing with `>` and `>>` | 5 |
| `grep`, `awk`, `cut`, `tail`, `wc` | 2, 3, 4 |
| Aliases (concept demonstrated in comments) | 5 |

---

## 📚 Key Learning

Through this project I understood:
- Why Linus Torvalds built Git — and how a proprietary tool's betrayal created the world's most important open-source tool
- How the GPL v2 license protects software freedom and why it cannot be used in closed-source products
- How Linux manages software installation, file permissions, and service directories
- How shell scripting connects automation to the open-source philosophy of transparency and sharing

---

*"Given enough eyeballs, all bugs are shallow."* — Eric S. Raymond, The Cathedral and the Bazaar
