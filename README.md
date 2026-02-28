# 🧹 Ultra Windows Cache Cleaner

High-performance Windows cleanup utilities for developers and power users.

This repository includes two optimized batch scripts:

- ⚡ **ultra-clean-fast.bat** → Maximum speed version (no size calculation)
- 🚀 **ultra-clean-pro.bat** → Advanced version with extended cleaning logic

Both scripts:

- ✅ Work on any username (dynamic paths)
- ✅ Require Administrator privileges
- ✅ Clean system + developer caches
- ✅ Handle large folders (like `uv` cache) safely
- ✅ Stop & restart Windows Update properly
- ✅ Designed for Windows 10 / 11

---

# 📦 Included Scripts

## 1️⃣ ultra-clean-fast.bat

**Purpose:**  
Fastest possible cleanup using CMD only.

### Features

- Clears Windows temp folders
- Clears user temp folders
- Removes developer caches (npm, pnpm, pip, gradle, etc.)
- Clears Unreal Engine cache
- Clears Epic Games cache
- Clears NVIDIA shader cache
- Handles large `uv` cache using move-delete strategy
- No size calculation (maximum speed)

### Best For

- Quick cleanup
- Low-risk fast execution
- Regular maintenance

---

## 2️⃣ ultra-clean-pro.bat

**Purpose:**  
More complete cleanup logic with structured handling.

### Features

- Everything in FAST version
- More extended cache coverage
- More structured folder handling
- Professional layout
- Safer system folder content-clean strategy

### Best For

- Heavy developer environments
- Large cache accumulation
- Occasional deep cleanup

---

# 🗂 What Gets Cleaned

### 🧰 System Folders (content only)
- `%TEMP%`
- `%SystemRoot%\Temp`
- `%SystemRoot%\Prefetch`
- Windows Update download cache
- Crash dumps
- Logs
- LiveKernelReports

### 👤 User Temp & Cache
- `%LOCALAPPDATA%\Temp`
- INetCache
- D3DSCache
- Shader caches

### 🧑‍💻 Developer Caches
- `.cache`
- `.npm`
- `.pnpm-store`
- `.gradle`
- `pip cache`
- `Yarn Cache`
- `ms-playwright-go`
- `uv`
- Unreal Engine cache
- Docker cache
- Epic Games launcher cache

### 🎮 Application Data
- NVIDIA cache
- Qoder
- antigravity
- GameSave Manager
- Naughty Dog cache
- dgVoodoo
- And more

---

# 🚀 How To Use

## Step 1
Right-click the script you want to run.

## Step 2
Select:
Run as Administrator


## Step 3
Wait for cleanup to complete.

## Step 4 (Recommended)
Restart your PC.

---

# ⚠️ Important Notes

- Must be run as Administrator
- Windows Update download cache will be cleared
- Some apps may recreate their cache on next launch
- Large folders (like `uv`) may take time depending on disk speed
- SSD recommended for best performance

---

# 🛠 Designed For

- Developers
- Node.js users
- pnpm users
- Unreal Engine users
- Docker users
- Game modders
- Users running out of SSD space

---

# 💡 Why This Exists

Windows accumulates:

- Shader cache
- Node package caches
- Installer leftovers
- Windows update downloads
- Application temp data

These scripts provide an aggressive but safe cleanup approach without damaging the OS.

---

# 📜 License

MIT License — free to use and modify.

---

# ⭐ Contributing

Pull requests welcome.

Potential improvements:

- Safe mode vs Nuclear mode toggle
- Disk space analytics
- Multi-thread deletion
- GUI wrapper
- Scheduled cleanup task

---

# 🔥 Recommended Workflow

1. Run `ultra-clean-fast.bat` regularly
2. Use `ultra-clean-pro.bat` occasionally for deeper cleanup
3. Restart PC
4. Enjoy reclaimed disk space

---

Use responsibly. Clean smart.