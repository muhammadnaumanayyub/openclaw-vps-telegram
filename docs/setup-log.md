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

## Step 4 — Install NVM (Node Version Manager)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
```
NVM is required to install the correct version of Node.js.
OpenClaw requires Node.js 22.16 or higher.
Direct apt install gives outdated version — NVM solves this.

## Step 5 — Install Node.js 24
```bash
nvm install 24
nvm use 24
nvm alias default 24
```
Installs Node.js version 24 and sets it as default.

## Step 6 — Verify Node.js Installation
```bash
node --version && npm --version
```
Result: Node.js v24.14.1 | npm 11.11.0 — confirmed working.

## Step 7 — Install OpenClaw
```bash
npm install -g openclaw@latest
```
npm = Node Package Manager (comes with Node.js, like apt but for JavaScript)
-g = install globally so openclaw command works from anywhere
@latest = always install the most recent stable version

## Step 8 — Verify OpenClaw Installation
```bash
openclaw --version
```
Result: OpenClaw 2026.3.28 (f9b1079) — confirmed working.

## Step 9 — Create Telegram Bot
- Opened Telegram and searched for @BotFather
- Sent /newbot command
- Created bot name and username
- Saved the bot token securely

## Step 10 — Get Google Gemini API Key
- Visited aistudio.google.com
- Signed in with Google account
- Created a new API key (free tier)
- Key looks like: AIzaSyxxxxxxxxxxxxxxxxx
- Free tier: 60 requests/minute, 1 million tokens/day
- No credit card required

## Step 11 — OpenClaw Onboarding
```bash
openclaw onboard --install-daemon
```
- --install-daemon flag registers OpenClaw as systemd service
- Survives server reboots automatically
- Wizard asks for: LLM provider, API key, model, chat channel

## Step 12 — OpenClaw Onboarding Wizard
Command used:
openclaw onboard --install-daemon

Options selected and reasons:

1. Security Warning → Yes
   Acknowledged security risks. Single user personal setup.

2. Setup Mode → QuickStart
   Faster setup, can configure details later via openclaw configure.

3. Model Provider → Google
   Selected Google Gemini — free tier, no credit card required.

4. Auth Method → Google Gemini API key
   Used API key generated from aistudio.google.com.

5. Default Model → google/gemini-2.5-flash
   Free, fast, stable. Flash models optimized for everyday tasks.
   Avoided preview models — not stable enough for lab.

6. Channel → Telegram (Bot API)
   Most beginner friendly, recommended by OpenClaw itself.

7. Search Provider → DuckDuckGo (experimental)
   Completely free, no API key required. Good enough for basic searches.

8. Skills installed:
   - clawhub → official OpenClaw skill manager, safe and verified
   - session-logs → logs conversations, useful for debugging

9. Homebrew → No
   Homebrew is a Mac package manager. We are on Ubuntu Linux.

10. Node manager → npm
    Already installed with Node.js 24.

11. Google Places API → No
    We did not install goplaces skill.

12. OpenAI API key → No
    We are using Gemini not OpenAI.

13. Hooks → session-memory only
    Gives OpenClaw memory across conversations.
    Remembers context between Telegram messages.

## Step 13 — Verify OpenClaw Status
Command used:
openclaw status

Result:
- Telegram channel: ON and OK
- Bot token accepted and connected
- No sessions yet (expected — not paired yet)
- 3 warnings noted (security recommendations, not errors)
- All warnings are for advanced multi-user setups, not applicable to our single user personal lab

## Step 14 — Telegram Pairing
Command used:
openclaw pairing approve telegram KDXEAHUE

Result: Approved telegram sender successfully.

## Step 15 — First Successful Test
Sent from Telegram: "What is my server uptime?"
Response received: "Your server has been up for XX days XX minutes."

## Step 16 — Security Hardening

Verified config file ~/.openclaw/openclaw.json contains:
- gateway.bind = loopback (127.0.0.1 only, not public internet)
- dmPolicy = pairing (only paired users can chat)
- groupPolicy = allowlist (groups need explicit permission)
- requireMention = true (bot only responds when mentioned)
- denyCommands = camera, sms, contacts, calendar blocked

File permissions verified:
- ~/.openclaw/ → drwx------ (700) only root can access
- openclaw.json → -rw------- (600) only root can read/write
- credentials/ → drwx------ (700) only root can access

Commands used:
chmod 600 ~/.openclaw/openclaw.json
chmod 700 ~/.openclaw/

## Lab Complete
All phases finished successfully.
Full stack working: Telegram → OpenClaw → Gemini 2.5 Flash → VPS → Telegram

