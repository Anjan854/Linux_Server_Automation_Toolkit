# 🛠️ Linux Server Automation Toolkit

A production-ready toolkit of Bash scripts to automate daily system administration tasks like log cleanup, backups to AWS S3, and system resource monitoring with optional email alerts. Designed for Linux servers (local or cloud) and optimized for cron-based scheduling.

---

## 📦 Features

- 🔄 **Automated Log Cleanup**: Deletes log files older than a defined number of days.
- ☁️ **S3 Backups**: Compresses and uploads directories to AWS S3 for cloud storage.
- 🧠 **System Monitoring**: Checks CPU, memory, and disk usage; sends alerts if thresholds are exceeded.
- 📧 **Email Alerts**: Notifies you via email on failures or resource spikes.
- 🕒 **Cron Integration**: Easily schedule all tasks to run daily or weekly.
- 🗂️ **Modular Scripts**: Organized, reusable Bash scripts with clean logging.

---

## 📁 Project Structure

```
linux-server-automation-toolkit/
├── main.sh                      # Master script to run all tasks
├── logs/                        # Stores execution logs
│   └── automation-YYYY-MM-DD.log
├── scripts/                     # Task scripts
│   ├── log_cleanup.sh
│   ├── system_backup.sh
│   └── system_monitor.sh
├── config/                      # Optional: config or .env files
│   └── example.env
└── cron/
    └── crontab.example          # Sample crontab entry
```

---

## 🛠️ Prerequisites

- A Linux environment (e.g., Ubuntu server or EC2 instance)
- `awscli` configured (`aws configure`)
- `mailx` and `msmtp` or `mailutils` for sending email alerts
- Optional: IAM user with access to S3 bucket

---

## 🚀 Quick Start

### 1. Clone the Project

```bash
git clone https://github.com/yourusername/linux-server-automation-toolkit.git
cd linux-server-automation-toolkit
chmod +x main.sh scripts/*.sh
```

### 2. Test the Toolkit Manually

```bash
./main.sh
```

### 3. View Logs

```bash
cat logs/automation-$(date +%F).log
```

---

## 🕒 Setup Crontab (Auto-Schedule Daily Run at 2 AM)

```bash
crontab -e
```

Add this line:

```
0 2 * * * /home/ubuntu/linux-server-automation-toolkit/main.sh >> /home/ubuntu/linux-server-automation-toolkit/logs/cron.log 2>&1
```

---

## 📤 Email Alerts (Optional)

1. Enable 2-Step Verification on your Gmail account
2. Create an App Password
3. Configure `/etc/msmtprc` or mail client with the App Password

---

## 🔍 Sample Output Log

```
===== Automation Toolkit Started: 2025-07-21 02:00:01 =====
[*] Cleaning logs older than 7 days from /var/log
[+] Log cleanup completed.
[*] Creating backup of /home/ubuntu
[*] Uploading to s3://my-bucket/
[+] Backup uploaded successfully.
[+] System resources are within normal limits.
===== Automation Toolkit Finished: 2025-07-21 02:00:08 =====
```

---

## 🧑‍💼 Author & Credits

Project by [Your Name]  
DevOps & Cloud Engineering Portfolio Project

---

## 📜 License

This project is open source under the [MIT License](LICENSE).
