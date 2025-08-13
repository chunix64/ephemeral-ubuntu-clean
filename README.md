> ⚠️ **Development Warning**
> This script is not finished yet, so it may not be fully optimized.

# 🧹 ephemeral-ubuntu-clean

**Free up disk space** in short-lived Ubuntu/Debian based environments  
(Colab, Kaggle, GitHub Actions, free VPS build servers, temporary SSH sessions)  

---

## ✨ Features
- 🗑 Remove preinstalled packages you don't need  
- 📦 Clean APT cache, old kernels, temporary files  
- 🪶 Free **10–50+ GB** depending on environment  
- 🛠 Safe defaults for CI/CD, cloud labs, and throwaway VPS  
- ⚡ Fast execution — finishes in minutes

---

## 🛠 Supported Environments
| Platform           | Tested | Notes |
|--------------------|--------|-------|
| **GitHub Actions** | ✅ | `ubuntu-latest` runners |
| **Google Colab**   | ✅ | use `du -sh /` to see real size, df not works true in overlayfs |
| **Kaggle**         | ❌ | Untest |
| **Free VPS**       | ❌ | Untest |
| Local Ubuntu       | ❌ | **Not supported** — will remove useful desktop tools |

---

## 🚀 Quick Start

### GitHub Actions
```yaml
- name: Clean up
  uses: yourusername/ephemeral-ubuntu-clean@main
````

### Google Colab / Kaggle

```bash
!curl -sL https://raw.githubusercontent.com/yourusername/ephemeral-ubuntu-clean/main/clean.sh | bash
```

---

## ⚠️ Warnings

* **Not** for normal desktop/server Ubuntu — it’s aggressive.
* Removes packages like LibreOffice, games, big SDKs, unused locales, etc.
* May remove cached datasets if they’re stored in standard temp/cache dirs.

---

## 🔍 For Power Users

* Environment detection: script auto-detects Colab, Kaggle, GitHub Actions, or generic cloud VPS.
* Pass `--force` to skip environment checks.
* Use `--dry-run` to see what will be removed without deleting.
* All cleanup steps are modular — edit `clean.sh` to disable parts.
* Logs are grouped and colorized for CI readability.

---

## 📊 Expected Space Freed

| Environment      | Space before | Space after  | Gain   |
| ---------------- | ------------ | ------------ | ------ |
| GitHub Actions   | \~27 GB free | \~68 GB free | +41 GB |
| Google Colab     | \~70 GB free | \~92 GB free | +22 GB |
| Kaggle           | \~XX GB free | \~XX GB free | +XX GB |

*(Values vary — your mileage may vary)*

---

## 💡 Notes
- Github action clean is indirect fork of [slimhub_actions](https://github.com/rokibhasansagar/slimhub_actions) with wider support

---

## ⚖️ License

Apache 2.0 License — free and open source.
