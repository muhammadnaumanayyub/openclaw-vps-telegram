# System Architecture

## Overview
Self-hosted AI agent running on Ubuntu 24.04 VPS.
Controlled via Telegram. Powered by Google Gemini 2.5 Flash.

## Data Flow
```
You (Telegram App on Phone)
          │
          │ HTTPS
          ▼
Telegram Bot API (api.telegram.org)
          │
          │ Polling
          ▼
OpenClaw Gateway (127.0.0.1:18789)
  ┌───────────────────────────┐
  │ Authenticates user        │
  │ Manages pairing/sessions  │
  │ Routes messages to agent  │
  └───────────┬───────────────┘
              │
              ▼
       OpenClaw Agent
  ┌───────────────────────────┐
  │ Processes instructions    │
  │ Decides which tools to use│
  │ Manages context/memory    │
  └───────────┬───────────────┘
              │
       ┌──────┴──────────┐
       ▼                 ▼
Google Gemini API    Local Tools
(AI Brain)           (shell, files,
                      web search)
       │
       ▼
Response → Telegram → Your Phone
```

## Components

| Component | Version | Role |
|---|---|---|
| Ubuntu | 24.04 LTS | Host operating system |
| Node.js | 24.14.1 | OpenClaw runtime |
| OpenClaw | 2026.3.28 | Agent framework |
| Gemini 2.5 Flash | Latest | AI language model |
| Telegram Bot API | Latest | User interface |
| DuckDuckGo | Free | Web search |
| systemd | Built-in | Process management |
| UFW | Built-in | Firewall |
| fail2ban | Latest | Brute force protection |

## Security Boundary
```
PUBLIC INTERNET
      │
      │ (blocked by UFW)
      ▼
VPS (Ubuntu 24.04)
      │
      ├── Port 22 (SSH only — UFW allows)
      │
      └── Port 18789 (OpenClaw Gateway)
              bound to 127.0.0.1 ONLY
              never exposed to internet
```

## Why Gateway is on Localhost Only
Telegram communicates with OpenClaw through the
Telegram Bot API — not directly. OpenClaw polls
Telegram servers outbound. No inbound port needed.
Binding to 127.0.0.1 means even if a hacker scans
your VPS ports they cannot find or reach the gateway.

## Authentication Layers
1. Telegram account (you must own the phone number)
2. Pairing code (one time approval per device)
3. allowFrom whitelist (only your user ID accepted)
4. Gateway auth token (internal protection)

