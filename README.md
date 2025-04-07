# Gnirehtet Reverse Tethering Script

This project provides an automated Bash script for setting up **reverse tethering** on Linux using Gnirehtet. Reverse tethering allows you to share your computer's internet connection with your Android device via USB, without requiring root access on the device.

---

## Features
- Automated installation of the Gnirehtet APK on the connected Android device.
- Launches the relay server and starts reverse tethering seamlessly.
- Supports stopping the reverse tethering with cleanup of the relay server process.

---

## Requirements
1. **Linux Operating System**
   - Ensure you have a terminal to run the script.
2. **adb (Android Debug Bridge)**
   - Install using:
     ```bash
     sudo apt-get install android-tools-adb
     ```
   - Verify installation:
     ```bash
     adb version
     ```
3. **Gnirehtet Binary and APK**
   - Download the Rust version for Linux:  
     [Gnirehtet Rust for Linux (v2.5.1)](https://github.com/Genymobile/gnirehtet/releases/download/v2.5.1/gnirehtet-rust-linux64-v2.5.1.zip)
   - Extract the downloaded ZIP file and place the following files in the script directory:
     - `gnirehtet` (Linux binary)
     - `gnirehtet.apk` (Android APK)

4. **Enable USB Debugging on Android**
   - Go to **Settings > Developer Options > USB Debugging** and enable it.
   - If Developer Options are not visible, unlock them by tapping **Build Number** in "About Phone" multiple times.

---

## Installation
1. Save the script as `gnirehtet.sh` in the same directory as the extracted Gnirehtet files (`gnirehtet` and `gnirehtet.apk`).
2. Make the script executable:
   ```bash
   chmod +x gnirehtet.sh
    ./gnirehtet.sh
