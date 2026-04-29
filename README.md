# Linux Admin & Security Suite 🛡️

This repository contains a collection of **essential** Bash scripts focused on System Administration, Network Diagnostics, and Security Auditing. 

## 🚀 Overview
The goal of this suite is to provide a set of reliable tools for everyday SysAdmin tasks: monitoring security logs, auditing file permissions, and managing remote data synchronization with robust protocols.

## 🛠️ Core Components

| Script | Responsibility | Key Technical Feature |
| :--- | :--- | :--- |
| `auth_report.sh` | **Security Auditing** | Parses `/var/log/auth.log` to detect and rank brute-force attempts. |
| `sync_remote.sh` | **Networking** | Implements `scp` over SSH for efficient delta-transfer sync. |
| `pingscan.sh` | **Connectivity** | Automated batch testing of network hosts with timestamped logging. |
| `killer_risorse.sh` | **Process Enforcement** | Monitors CPU thresholds and handles clean process termination. |
| `audit_perms.sh` | **Security Check** | Scans for world-writable files to identify potential security holes. |
| `delete_logs.sh` | **Maintenance** | Automates log rotation with a 7-day retention policy and dry-run safety. |

## 🧠 Technical Highlights

### 1. Log Analysis & Security
* **Automated Auditing:** `auth_report.sh` processes system authentication logs using a pipeline of `grep`, `awk`, and `sort`. It extracts the top 10 IP addresses associated with failed login attempts, providing a quick snapshot of potential threats.
* **Permission Hardening:** `audit_perms.sh` uses advanced `find` parameters to locate files with insecure permission bits, a fundamental step in server hardening.

### 2. Network Operations
* **Optimized Sync:** Moving beyond simple copies, `sync_remote.sh` utilizes `rsync -avzP`. This ensures that only file differences are transferred, saving bandwidth and allowing the process to resume after a disconnection.
* **Connectivity Mapping:** `pingscan.sh` reads a list of target hosts and generates a status report, demonstrating basic network diagnostic automation.

### 3. Resource Management
* **Enforcement Logic:** `killer_risorse.sh` interacts with the Linux process table (`ps`) to identify and terminate (via `SIGTERM`) processes that exceed defined performance thresholds, ensuring system stability.

## 💻 Setup & Configuration

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/Andrea-Raccuia/Linux-Admin-Security.git](https://github.com/Andrea-Raccuia/Linux-Admin-Security.git)
2. **Configuration:**
   Open `sync_remote.sh` and update the `DESTINAZIONE` variable with your specific remote details using the standard SSH format:
   
   ```bash
   DESTINAZIONE="username@remote-ip:/path/to/destination/"
3. **Execution Permissions:**
   Grant execution rights to all scripts before running:
   ```bash
   chmod +x *.sh
4. **Security Note:**
   Scripts like `auth_report.sh` require root privileges to read system logs. Run them with `sudo`:
   ```bash
   sudo ./auth_report.sh
##🛡️ Best Practices Implemented
**Safety First**: Scripts like delete_logs.sh include confirmation prompts and "Dry-Run" visualizations before making permanent changes to the filesystem.

**Error Handling**: Standard error redirection (>&2) and explicit exit codes are used to ensure scripts behave predictably in automated environments or cronjobs.

**Modular Logic**: Focus on single-responsibility scripts that can be easily integrated into larger administrative workflows, following the Unix philosophy.
