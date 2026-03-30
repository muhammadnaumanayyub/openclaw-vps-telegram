#!/bin/bash
# ============================================================
# harden.sh — OpenClaw Security Hardening
# Author: Muhammad Nauman Ayyub
# Senior Network & Cloud Cybersecurity Engineer
# ============================================================
# HOW TO USE:
#   bash scripts/harden.sh
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}  OpenClaw Security Hardening             ${NC}"
echo -e "${GREEN}  Author: Muhammad Nauman Ayyub           ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""

# --- Step 1: Protect config files ---
echo -e "${YELLOW}[1/5] Securing config file permissions...${NC}"
chmod 600 ~/.openclaw/openclaw.json
chmod 700 ~/.openclaw/
echo -e "${GREEN}✓ Config permissions set to 600${NC}"

# --- Step 2: Enable fail2ban ---
echo -e "${YELLOW}[2/5] Enabling fail2ban...${NC}"
systemctl enable fail2ban
systemctl start fail2ban
echo -e "${GREEN}✓ fail2ban active${NC}"

# --- Step 3: Verify UFW ---
echo -e "${YELLOW}[3/5] Verifying firewall...${NC}"
ufw status
echo -e "${GREEN}✓ Firewall verified${NC}"

# --- Step 4: Run OpenClaw security audit ---
echo -e "${YELLOW}[4/5] Running OpenClaw security audit...${NC}"
openclaw security audit
echo -e "${GREEN}✓ Security audit complete${NC}"

# --- Step 5: Restart gateway ---
echo -e "${YELLOW}[5/5] Restarting OpenClaw gateway...${NC}"
systemctl restart openclaw
echo -e "${GREEN}✓ Gateway restarted${NC}"

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}  Hardening Complete!                     ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""
echo -e "${YELLOW}Run regularly:${NC}"
echo "openclaw security audit --deep"
echo "openclaw security audit --fix"
echo ""

