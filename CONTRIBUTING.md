# 🤝 Contributing Guide

Thank you for your interest in contributing to **Ultra Windows Cache Cleaner**.

Contributions are welcome — improvements, optimizations, bug fixes, and feature ideas.

---

# 📋 Before You Contribute

Please:

- Test changes on Windows 10 or Windows 11
- Run scripts as Administrator
- Verify that no critical system folders are accidentally removed
- Ensure dynamic paths (`%USERPROFILE%`, `%LOCALAPPDATA%`, etc.) are used
- Avoid hardcoding usernames

---

# 🛠 What You Can Contribute

### ✅ Improvements
- Performance optimizations
- Safer deletion logic
- Better error handling
- Improved UV handling
- Faster large-folder removal techniques

### 🚀 New Features
- Safe mode / Aggressive mode toggle
- Disk usage summary report
- Multi-threaded deletion approach
- Scheduled cleanup support
- Interactive CLI flags
- Logging system
- Portable version

### 🧪 Testing & Fixes
- Bug reports
- Reproduction steps
- Windows version compatibility testing
- Large cache scenario testing (10GB+)

---

# 🧾 Code Style Guidelines

For `.hbs` files:

- Use dynamic environment variables
- Avoid label recursion loops
- Avoid breaking execution flow
- Keep structure readable and grouped
- Use silent error handling where appropriate

For readability:

- Add section separators:
:: ================================
:: SECTION NAME
:: ================================
- Keep logic flat where possible
- Avoid unnecessary complexity

---

# 🔒 Safety Rules

This project prioritizes:

- ❌ No system damage
- ❌ No registry modification
- ❌ No user data deletion
- ❌ No hidden behavior
- ❌ No telemetry

If proposing aggressive cleanup logic, clearly explain:

- What it removes
- Why it is safe
- What the risks are

---

# 🐛 Reporting Issues

When opening an issue, include:

- Windows version
- Script version (fast / pro)
- Error message (if any)
- Folder that caused issue
- Approximate folder size (if relevant)

---

# 🔁 Pull Request Process

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request with:
 - Clear description
 - What changed
 - Why it was changed
 - Any risks

---

# 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

# 💡 Philosophy

This project aims to:

- Be simple
- Be transparent
- Be safe
- Be fast
- Respect the user's system

Clean smart. Contribute responsibly.