# Samsung Debloat via ADB

> Take back control of your phone. Remove preinstalled Samsung, Google and partner bloatware — no root required.

<p align="center">
  <img alt="Platform" src="https://img.shields.io/badge/platform-Windows-blue">
  <img alt="Language" src="https://img.shields.io/badge/PowerShell-5.1%2B-5391FE?logo=powershell&logoColor=white">
  <img alt="Root" src="https://img.shields.io/badge/root-not%20required-success">
  <img alt="License" src="https://img.shields.io/badge/license-MIT-green">
  <img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen">
</p>

An interactive PowerShell toolkit that uses **ADB (Android Debug Bridge)** to list and uninstall the unwanted, preinstalled apps ("bloatware") that ship on Samsung Galaxy and other Android devices — the ones you normally can only *disable*, not remove.

Removal is done **per user** (`--user 0`), which cleanly uninstalls the app for the active user without root and without modifying the system partition. Everything can be restored with a factory reset if needed.

---

## Table of Contents

- [Why this project](#why-this-project)
- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
  - [1. Install ADB (platform-tools)](#1-install-adb-platform-tools)
  - [2. Enable USB debugging](#2-enable-usb-debugging)
  - [3. Connect your device](#3-connect-your-device)
  - [4. Allow PowerShell scripts](#4-allow-powershell-scripts)
- [Usage](#usage)
- [What gets removed](#what-gets-removed)
- [Safety & important notes](#safety--important-notes)
- [Manual commands (cheat sheet)](#manual-commands-cheat-sheet)
- [Finding a package name](#finding-a-package-name)
- [Restoring an app](#restoring-an-app)
- [Turn off "Usage data access"](#turn-off-usage-data-access)
- [Contributing](#contributing)
- [Resources](#resources)
- [Disclaimer](#disclaimer)
- [License](#license)

---

## Why this project

> You pay for a device you can't really control.
> You own a device that, in a way, owns you.

Every phone ships with dozens of preinstalled apps that most people never use — and often can't remove. Try uninstalling Netflix, YouTube or a Bixby service through the normal settings: you can only *disable* them. Disabled apps still occupy storage and can keep running background services.

This toolkit lets you review a curated list of such packages and remove the ones you don't want — intuitively, and reversibly.

## Features

- **Interactive uninstaller** — walks you through the process and reports success/failure per app.
- **Per-app safety warnings** — before removing a package that would break your device or take away an important capability, the script stops, explains *exactly what you will lose*, and asks for confirmation. Device-breaking removals (e.g. the launcher) require typing a confirmation word; feature-loss removals ask a simple yes/no.
- **Curated package lists** — well-documented, safe-to-remove Samsung, Google and partner packages, grouped by category.
- **Keep-data option** — choose whether to wipe app data/cache (`--user 0`) or preserve it (`-k`).
- **Optional Samsung UI removal** — a separate, clearly-marked list for advanced users, gated behind explicit confirmation and a backup prompt.
- **Safe by design** — each package is checked before and after removal; nothing is touched on the system partition, so a factory reset restores everything.
- **No root required.**

## Requirements

- A Windows PC with **PowerShell 5.1+** (Windows PowerShell ISE recommended for pasting scripts).
- **ADB / platform-tools** installed and available on your `PATH`.
- An Android device (optimised for **Samsung Galaxy**, but the manual commands work on any Android phone) with **USB debugging** enabled.
- A USB cable.

## Setup

### 1. Install ADB (platform-tools)

Download the official **[Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools)** and add the folder to your `PATH`, or install via a package manager:

```powershell
choco install adb        # Chocolatey
# or
winget install Google.PlatformTools
```

Verify it works:

```powershell
adb version
```

Video walkthroughs for adding ADB to your Windows `PATH`:
- [Setup guide 1 (recommended)](https://www.youtube.com/watch?v=I_W7pzpB09M)
- [Setup guide 2 (more detailed)](https://youtu.be/GERlhgCcoBc)

### 2. Enable USB debugging

1. Go to **Settings → About phone** and tap **Build number** seven times to unlock **Developer options**.
2. Go to **Settings → Developer options** and enable **USB debugging**.

### 3. Connect your device

1. Connect the phone via USB.
2. Confirm the **"Allow USB debugging?"** prompt on the phone.

If the prompt doesn't appear:
- In **Developer options**, tap **Revoke USB debugging authorizations**.
- Unplug and reconnect the cable — the prompt should now appear.

Confirm the device is detected:

```powershell
adb devices
```

### 4. Allow PowerShell scripts

By default Windows blocks unsigned scripts. In an **elevated PowerShell** window:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

`RemoteSigned` lets you run local scripts while still requiring downloaded scripts to be signed.

## Usage

1. Clone or download this repository:

   ```powershell
   git clone https://github.com/olivierluethy/samsung-debloat-adb.git
   cd samsung-debloat-adb
   ```

2. Open **Windows PowerShell ISE** (it has a large script pane) and run the entry point:

   ```powershell
   .\main.ps1
   ```

3. Follow the prompts:
   - **Delete all app data?** — `j` removes apps *and* their cache/data; `n` uses `-k` to keep data.
   - **Remove Samsung UI components too?** — advanced, optional, and gated behind a backup confirmation.

The script checks whether each package is installed, uninstalls it, verifies removal, and prints a colour-coded result with a progress bar.

> **Note:** The script prompts are in German. Answer `j` (ja) for yes and `n` (nein) for no.

## What gets removed

Packages are organised into two files:

| File | Scope | Risk |
|------|-------|------|
| `apps.ps1` (`$apps`) | User-facing bloatware — Bixby, Meta/Facebook, Samsung Pay/Pass, AR/gaming features, streaming apps, Microsoft & Google partner apps, language packs, and more. | Safe — the device keeps working normally. |
| `system.ps1` (`$system`) | Samsung One UI / system components (DeX, LED cover, launcher, ANT+, etc.). | **Advanced** — can degrade the UI. Opt-in only. |
| `warnings.ps1` (`$criticalWarnings`) | Consequence descriptions for packages whose removal breaks the device or removes an important capability. | Safety layer — triggers a confirmation prompt before those packages are removed. |

Each entry is a package name with an inline comment explaining what it is, so you can review and comment out anything you want to keep before running the script.

### How the warnings work

`warnings.ps1` maps risky packages to a plain-language description of the consequence and a severity level:

- **Critical** — removal makes the device unusable or destroys data (e.g. the One UI launcher, Secure Folder, the default SMS app). You must type `LOESCHEN` to proceed; anything else skips the package.
- **Warning** — a major feature goes away but the device keeps working (e.g. Bixby, Samsung Pay, the default browser or calendar). A simple `j`/`n` prompt lets you decide.

Only genuinely consequential packages are listed, so warnings stay meaningful. To add your own, extend the `$criticalWarnings` hashtable in `warnings.ps1`.

## Safety & important notes

- **Do not remove the Samsung launcher** (`com.sec.android.app.launcher`, "Samsung One UI Home") unless you have installed and set an alternative launcher first. Removing it can leave you unable to open apps.
- The **`# GENERAL SYSTEM`** block in `system.ps1` can degrade performance and usability. Only run it if you understand the consequences and have a backup.
- Removal is **per user** and does not modify the read-only system partition, so a **factory reset restores everything**.
- Review each list and comment out (prefix with `#`) any package you want to keep before running.

## Manual commands (cheat sheet)

List all installed packages:

```powershell
adb shell pm list packages --user 0
```

List only user apps / only system apps:

```powershell
adb shell pm list packages -3 --user 0    # user-installed
adb shell pm list packages -s --user 0    # system
```

Save the list to a file for easier filtering:

```powershell
adb shell pm list packages > installed_apps.txt
```

Uninstall an app (removing data):

```powershell
adb shell pm uninstall --user 0 com.example.package
```

Uninstall but keep data and cache:

```powershell
adb shell pm uninstall -k --user 0 com.example.package
```

## Finding a package name

If you want to remove an app that isn't in the lists, find its package name from the **Google Play** or **Galaxy Store** URL. For example, Samsung "My Files":

```
https://play.google.com/store/apps/details?id=com.sec.android.app.myfiles
```

The `id=` value (`com.sec.android.app.myfiles`) is the package name. To remove it:

```powershell
adb shell pm uninstall --user 0 com.sec.android.app.myfiles
```

Alternatively, install a package-viewer app such as **[App Inspector / Package Names](https://play.google.com/store/apps/details?id=com.csdroid.pkg)** to look up any installed package name directly on the phone.

## Restoring an app

To reinstall an app you removed per user, the simplest path is a **factory reset**, or reinstall from the store. To sideload an APK (for example, if you accidentally removed My Files or the Galaxy Store):

```powershell
adb push "C:\Users\<username>\Documents\<app>.apk" /data/local/tmp/
adb shell pm install /data/local/tmp/<app>.apk
```

Download trustworthy APKs from a reputable source such as [APKMirror](https://www.apkmirror.com/).

## Turn off "Usage data access"

Apps with "Usage data access" can monitor which other apps you use and how often. To revoke it:

1. Open **Settings** and search for **Usage data access**.
2. Tap the three-dot menu → **Show system apps**.
3. Open each app and turn the permission off.

## Contributing

Contributions are welcome! If you've verified a package is safe to remove on your device:

1. Fork the repository and create a branch.
2. Add the package to the appropriate list (`apps.ps1` or `system.ps1`) with an inline comment describing what it is.
3. Note your device model and One UI version in the pull request.

Please only submit packages you have personally tested, and clearly flag anything risky.

## Resources

Community references used while building and expanding the package lists:

- [S10 / S10+ bloatware package list (XDA)](https://xdaforums.com/t/my-s10-s10-bloatware-package-name-list.4054003/)
- [ADB to remove built-in apps + usage-data-access guide (XDA)](https://xdaforums.com/t/adb-to-remove-built-in-apps.3932377/)
- [Uninstalling Netflix (OnePlus community)](https://community.oneplus.com/thread/1540015)
- [Finding the Samsung Tips package (Galaxy Store)](https://galaxystore.samsung.com/detail/com.samsung.android.app.tips)
- [Finding the Bixby Vision package (Galaxy Store)](https://galaxystore.samsung.com/detail/com.samsung.android.visionintelligence)

## Disclaimer

This project is provided **as-is**, for educational and personal use. Removing system components can affect device behaviour. You are responsible for what you uninstall from your own device. Back up your data first. The author is not liable for any damage, data loss, or reduced functionality resulting from the use of these scripts.

## License

Released under the [MIT License](LICENSE).
