# Troubleshooting Guide

## Bot Not Responding in Telegram

**Check 1 — Is OpenClaw running?**
```bash
openclaw status
```
If not running:
```bash
sudo systemctl start openclaw
```

**Check 2 — Did you click Start on the bot?**
Telegram bots only respond after user clicks Start.
Go to your bot and tap Start first.

**Check 3 — Is bot token correct?**
```bash
cat ~/.openclaw/openclaw.json | grep botToken
```

**Check 4 — Restart the gateway**
```bash
sudo systemctl restart openclaw
```

---

## Pairing Code Expired
Codes expire after 1 hour.
Send another message to your bot to get a new code then:
```bash
openclaw pairing approve telegram YOUR-NEW-CODE
```

---

## openclaw command not found
NVM not loaded. Run:
```bash
source ~/.bashrc
```

---

## Gemini API Error
- Verify key at aistudio.google.com
- Check free tier limits not exceeded
- 60 requests/minute, 1 million tokens/day on free tier

---

## Gateway Not Starting
Check logs:
```bash
sudo journalctl -u openclaw -n 100
openclaw logs --follow
```

---

## Check Everything at Once
```bash
openclaw status
openclaw security audit
sudo systemctl status openclaw
sudo ufw status
```

---

## Useful Commands Reference

| Command | Purpose |
|---|---|
| `openclaw status` | Check running status |
| `openclaw logs --follow` | Live logs |
| `openclaw security audit` | Security check |
| `openclaw security audit --fix` | Auto fix issues |
| `openclaw config file` | Show config location |
| `sudo systemctl restart openclaw` | Restart service |
| `sudo systemctl status openclaw` | Service status |
| `sudo journalctl -u openclaw -f` | System logs |

