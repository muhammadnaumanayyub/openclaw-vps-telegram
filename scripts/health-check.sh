#!/bin/bash
# ============================================================
# health-check.sh — OpenClaw Status Checker
# Author: Muhammad Nauman Ayyub
# Senior Network & Cloud Cybersecurity Engineer
# ============================================================
# HOW TO USE:
#   bash scripts/health-check.sh
# ============================================================

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}  OpenClaw Health Check                   ${NC}"
echo -e "${GREEN}  Author: Muhammad Nauman Ayyub           ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""

# --- Check 1: OpenClaw version ---
echo -e "${YELLOW}[1/6] OpenClaw Version:${NC}"
openclaw --version 2>/dev/null \
  && echo -e "${GREEN}✓ OpenClaw found${NC}" \
  || echo -e "${RED}✗ OpenClaw not found${NC}"

# --- Check 2: Node.js ---
echo -e "${YELLOW}[2/6] Node.js Version:${NC}"
node --version 2>/dev/null \
  && echo -e "${GREEN}✓ Node.js found${NC}" \
  || echo -e "${RED}✗ Node.js not found${NC}"

# --- Check 3: systemd service ---
echo -e "${YELLOW}[3/6] OpenClaw systemd service:${NC}"
systemctl is-active openclaw \
  && echo -e "${GREEN}✓ Service is running${NC}" \
  || echo -e "${RED}✗ Service is NOT running — run: systemctl start openclaw${NC}"

# --- Check 4: Gateway port ---
echo -e "${YELLOW}[4/6] Gateway port 18789:${NC}"
ss -tlnp | grep 18789 \
  && echo -e "${GREEN}✓ Gateway is listening${NC}" \
  || echo -e "${RED}✗ Gateway not listening${NC}"

# --- Check 5: UFW Firewall ---
echo -e "${YELLOW}[5/6] UFW Firewall:${NC}"
ufw status | head -3
echo -e "${GREEN}✓ Firewall checked${NC}"

# --- Check 6: fail2ban ---
echo -e "${YELLOW}[6/6] fail2ban:${NC}"
systemctl is-active fail2ban \
  && echo -e "${GREEN}✓ fail2ban active${NC}" \
  || echo -e "${RED}✗ fail2ban inactive — run: systemctl start fail2ban${NC}"

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${YELLOW}For deep check run:${NC}"
echo "openclaw status"
echo "openclaw security audit --deep"
echo -e "${GREEN}=========================================${NC}"
