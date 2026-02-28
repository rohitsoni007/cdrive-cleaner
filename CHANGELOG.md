# 📜 Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project follows [Semantic Versioning](https://semver.org/).

---

# [1.0.0] - 2026-02-28

## 🎉 Initial Release

### Added
- `ultra-clean-fast.bat`
  - High-speed cleanup mode
  - Dynamic user path support
  - System temp content cleaning
  - Developer cache removal
  - Windows Update stop/start handling
  - Fast UV cache move-delete strategy
  - No size calculation for maximum speed

- `ultra-clean-pro.bat`
  - Extended cleanup coverage
  - Structured folder handling
  - Dynamic environment variables
  - Safer system folder content cleaning
  - Enhanced UV handling logic

- Dynamic username support (no hardcoded paths)

---

## 🧹 Cleaned Categories

- Windows temp folders
- Windows Update download cache
- Crash dumps & logs
- Shader cache
- Developer caches (npm, pnpm, pip, gradle)
- Unreal Engine cache
- Docker cache
- Epic Games cache
- NVIDIA cache
- Application-specific caches

---

## 🔒 Safety

- No registry modifications
- No system file deletion
- No user personal file deletion
- No telemetry
- No hidden processes

---

## ⚡ Performance Notes

- Optimized for SSD environments
- Designed for large cache trees (5GB–20GB+)
- UV folder handled separately to prevent hanging
- Silent error handling to avoid script crashes

---

# 📌 Future Roadmap

- Safe mode vs Aggressive mode switch
- Disk usage analytics option
- Logging system
- Scheduled task automation
- Optional CLI flags
- Multi-thread deletion experiments

---
