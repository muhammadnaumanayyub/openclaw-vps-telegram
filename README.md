# 🦞 OpenClaw AI Agent — VPS + Telegram + Gemini

![Status](https://img.shields.io/badge/Status-Live-brightgreen)
![Platform](https://img.shields.io/badge/Platform-Ubuntu%2024.04-orange)
![AI](https://img.shields.io/badge/AI-Gemini%202.5%20Flash-blue)
![Channel](https://img.shields.io/badge/Channel-Telegram-2CA5E0)

> **Author:** Muhammad Nauman Ayyub  
> **Role:** Senior Network & Cloud Cybersecurity Engineer  
> **Stack:** Ubuntu 24.04 · OpenClaw · Telegram · Google Gemini 2.5 Flash

---

## What is This Project?

A self-hosted AI agent running on a personal VPS, controlled via Telegram
using plain English commands. Built as a hands-on lab to explore AI agent
deployment, automation, and security on self-hosted infrastructure.

---

## Architecture
```
Telegram App (Phone)
       ↓
Telegram Bot API
       ↓
OpenClaw Gateway (127.0.0.1:18789)
       ↓
Gemini 2.5 Flash (AI Brain)
       ↓
VPS (executes tasks)
       ↓
Response → Telegram
```

---

## What Can It Do?

- Answer questions about your server in plain English
- Execute shell commands via chat
- Search the web via DuckDuckGo
- Read and write files
- Remember context across conversations
- Run 24/7 as a systemd daemon

---

## Tech Stack

| Component | Technology |
|---|---|
| OS | Ubuntu 24.04 LTS |
| Runtime | Node.js 24.14.1 |
| Agent Framework | OpenClaw 2026.3.28 |
| AI Model | Google Gemini 2.5 Flash |
| Chat Interface | Telegram Bot API |
| Search | DuckDuckGo (free) |
| Process Manager | systemd |
| Firewall | UFW |
| Brute Force Protection | fail2ban |

---

## Project Structure
```
openclaw-vps-telegram/
├── README.md                 ← You are here
├── .env.example              ← API key template
├── .gitignore                ← Keeps secrets off GitHub
├── config/
│   └── openclaw.example.json ← Safe config template
├── scripts/
│   ├── install.sh            ← Automated installer
│   ├── harden.sh             ← Security hardening
│   └── health-check.sh       ← Status checker
└── docs/
    ├── setup-log.md          ← Step by step lab diary
    ├── architecture.md       ← System design
    └── troubleshooting.md    ← Common fixes
```

---

## Security Measures

- Gateway bound to 127.0.0.1 — never exposed to public internet
- Only whitelisted Telegram User ID can interact with the agent
- API keys stored with chmod 600 — never committed to GitHub
- UFW firewall — only SSH allowed inbound
- fail2ban — blocks brute force SSH attacks
- .gitignore — blocks all secrets from being pushed

---

## Setup Guide

Full step by step lab diary available in docs/setup-log.md

---

## Key Learnings

- AI agents are powerful but require careful security planning
- Prompt injection is a real risk — similar to SQL injection
- Infrastructure as Code — document every step as you build
- Self-hosted AI gives full control over data and privacy

---

*Built as a practical lab for AI agent deployment on self-hosted infrastructure.*
