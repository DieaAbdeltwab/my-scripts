# 🐳 Docker Images Manager 🚀

A simple and **very cool** bash script to backup and restore Docker images with style! ✨

## 🎯 What it does

Perfect for backing up your Docker images or moving them between systems!

- **Option 1**: 💾 **Backup Mode** - Saves all your Docker images as individual `.tar` files
- **Option 2**: 📦 **Restore Mode** - Loads all `.tar` files back into Docker

## 🔥 Usage

1. Make the script executable:
```bash
chmod +x docker_Images_backup.sh
```

2. Run it:
```bash
./docker_Images_backup.sh
```

3. Choose your option (1 or 2) and watch the magic happen! ✨

## 🎮 How it works

**Backup (Option 1)**:
- 🔍 Scans all Docker images on your system
- 🗑️ Skips dangling/unnamed images automatically
- 💾 Creates individual `.tar` files for each image
- 📂 Saves everything in the same directory as the script

**Restore (Option 2)**:
- 🔍 Looks for all `.tar` files in the script directory
- 📦 Loads each file back into Docker
- 🎊 Your images are ready to use again!

## ✨ Features

- 🎉 Interactive menu with cool emojis
- ⚡ Lightning fast performance
- 🛡️ Safe filename conversion (replaces special characters)
- 🔄 Perfect for system migrations or backups
- 📱 Works on any Linux/macOS system with Docker

## 🎊 That's it!

Simple, clean 😎

---
*Made with ❤️ for Docker enthusiasts*
