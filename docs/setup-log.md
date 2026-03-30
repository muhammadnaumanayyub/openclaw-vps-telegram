# Lab Setup Log
Author: Muhammad Nauman Ayyub

## Step 1 — System Update
```bash
apt update && apt upgrade -y
```
Updated all system packages on Ubuntu 24.04.

## Step 2 — Install Essential Tools
```bash
apt install -y curl wget git ufw fail2ban unzip nano
```
- curl — download files from internet
- ufw — firewall
- fail2ban — blocks brute force SSH attacks
- nano — text editor

## Step 3 — Verify Essential Tools
```bash
curl --version && git --version && nano --version | head -1
```
Result: curl 8.5.0 | git 2.43.0 | nano 7.2 — all confirmed working.


