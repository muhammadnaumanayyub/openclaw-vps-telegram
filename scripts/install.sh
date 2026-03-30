#!/bin/bash
# ============================================================
# install.sh — Automated OpenClaw Setup for Ubuntu 24.04
# Author: Muhammad Nauman Ayyub
# Senior Network & Cloud Cybersecurity Engineer
# ============================================================
# HOW TO USE:
#   bash scripts/install.sh
# ============================================================

set -e  # Stop script if any command fails

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}  OpenClaw VPS Setup — Ubuntu 24.04      ${NC}"
echo -e "${GREEN}  Author: Muhammad Nauman Ayyub           ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""

# --- Step 1: System Update ---
echo -e "${YELLOW}[1/5] Updating system packages...${NC}"
apt update && apt upgrade -y
echo -e "${GREEN}✓ System updated${NC}"

# --- Step 2: Essential Tools ---
echo -e "${YELLOW}[2/5] Installing essential tools...${NC}"
apt install -y curl wget git ufw fail2ban unzip nano
echo -e "${GREEN}✓ Essential tools installed${NC}"

# --- Step 3: NVM + Node.js 24 ---
echo -e "${YELLOW}[3/5] Installing NVM and Node.js 24...${NC}"
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  echo "NVM already installed, skipping."
fi
nvm install 24
nvm use 24
nvm alias default 24
echo -e "${GREEN}✓ Node.js $(node --version) installed${NC}"

# --- Step 4: OpenClaw ---
echo -e "${YELLOW}[4/5] Installing OpenClaw...${NC}"
npm install -g openclaw@latest
echo -e "${GREEN}✓ OpenClaw $(openclaw --version) installed${NC}"

# --- Step 5: Firewall ---
echo -e "${YELLOW}[5/5] Configuring UFW firewall...${NC}"
ufw allow OpenSSH
ufw --force enable
echo -e "${GREEN}✓ Firewall configured${NC}"

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}  Installation Complete!                  ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""
echo -e "${YELLOW}NEXT STEPS:${NC}"
echo "1. Get Gemini API key from aistudio.google.com"
echo "2. Get Telegram bot token from @BotFather"
echo "3. Run: openclaw onboard --install-daemon"
echo "4. Follow docs/setup-log.md for full guide"
echo ""
