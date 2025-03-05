### **Introduction to ADB (Android Debug Bridge)**

**ADB** (Android Debug Bridge) is a versatile command-line tool used for managing Android devices and emulators. It allows you to interact with your Android device from a computer, enabling you to perform a wide range of tasks like installing and uninstalling apps, debugging, copying files, and even accessing the device’s shell.

ADB is an essential tool for developers, advanced users, and enthusiasts who want to manage their Android devices beyond what is offered by the standard user interface.

### **Why this project**

> You pay for a device which you can't really control
> You own a device that you don't really own, it owns you

There are so many preinstalled apps on every phone that are completely unnecessary and don't want to be on your phone anymore. If you have Netflix, YouTube, or Google, try to uninstall them ... Well, you can't. You can only disable them, but that doesn't mean they've been removed from your phone. They can still do stuff, and that's what this project is all about. You can check which apps you don't want anymore and remove them intuitively.

### **Prerequisites**

All you need is your Android-based phone and a computer.
Note: It is not necessary to root your mobile device!

### **What You Can Do with ADB**

ADB provides access to several powerful commands that allow you to:

- **Install and Uninstall Apps**: You can install apps from your computer on the Android device or uninstall apps directly from the device.
- **List Installed Apps**: You can view a list of all apps installed on the device.
- **Access Device Shell**: You can interact with the Android device's operating system directly via a command-line interface.
- **File Management**: You can copy files to and from your Android device.
- **Debugging**: ADB can be used to debug apps and monitor device logs.

### **Setting Up ADB on Windows**

Before you can use ADB on your Windows computer, you need to install **ADB tools** and set up your device for communication.

1. **Install ADB Tools**:
   - Download and install **[ADB](https://developer.android.com/tools/releases/platform-tools?hl=de)** from the official **Android Developer website** or use a package manager like **Chocolatey** on Windows.
2. **Enable USB Debugging on your Android device**:

   - On your Android device, go to **Settings > About phone**, tap **Build number** 7 times to unlock Developer options.
   - Then, go to **Settings > Developer options** and enable **USB Debugging**.

3. **Connect the Device via USB**:
   - Connect your Android device to your computer via a USB cable.
   - Allow USB debugging on your phone if prompted.
 -    If the data exchange confirmation popup does not appear on the Android device, you can follow these steps to force it to appear:

       - Revoke USB debugging authorizations:
       On your Android device, go to "Settings" -> "Developer options" and select the "Revoke USB debugging authorizations" option.

        - Reconnect: Disconnect and reconnect the USB cable.

        - Popup prompt: After reconnecting, the popup confirming the data exchange should appear on the Android device.

If you have this, go and check out this video here to learn how you can add ADB as your environment variable in Windows.
YouTube Prompt: How to install adb on Windows
[Setup Guide 1 recommended](https://www.youtube.com/watch?v=I_W7pzpB09M)

YouTube Prompt: Android ADB tool
[Setup Guide 2 more detailed](https://youtu.be/GERlhgCcoBc?si=BprpICH6d4HKPjNT)

### **List All Installed Apps and Store in a `.txt` File**

Now, let’s explore how you can **list all installed apps** on your Android device and **store the list in a `.txt` file**.

#### **Listing Installed Apps**

1. **Open Windows PowerShell or Command Prompt**:

   - You can either use **PowerShell** or **Command Prompt** to execute ADB commands.

2. **Run the Following Command to List All Apps**:

   ```bash
   adb shell pm list packages --user 0
   ```

   This command will list all the package names of apps installed on your Android device. You can filter the list for user apps or system apps with specific flags:

   - To list **only user apps**:

     ```bash
     adb shell pm list packages -3 --user 0
     ```

   - To list **only system apps**:
     ```bash
     adb shell pm list packages -s --user 0
     ```

3. **Store the List in a `.txt` File**:

   To save the list of installed apps into a text file, you can redirect the output to a `.txt` file like so:

   But before you run it, it must already exist.

   ```bash
   adb shell pm list packages > C:\path\to\your\file\installed_apps.txt
   ```

   This will save the list of installed apps to `installed_apps.txt` on your computer.
   That way it's much easier to filter and look for apps you might not want to have on your phone.

#### **Uninstall Apps Using ADB**

To uninstall apps via ADB, use the following command:

```bash
adb shell pm uninstall --user 0 com.example.package
```

Replace `com.example.package` with the actual package name of the app you want to remove. You can find the package names from the output of the list command above.

You can also use a script to uninstall multiple apps at once. This will also remove all the data. Example:

```bash
adb shell pm uninstall --user 0 com.example.package1
```

If you want to uninstall the application but keep your data and cache files, you can do so here.

```bash
adb shell pm uninstall -k --user 0 com.example.package1
```

### **How to find package to delete on phone using ADB?**

If you are searching for a specific app that you want to remove from your phone which we didn't cover inside the script or under the links for the resources, eather go to the [Galaxy Store](https://galaxystore.samsung.com/games) or [Google Play Store](https://play.google.com/store/games?device=windows) and go searching for the specific app you are looking for.

Now, if I wanted to remove **Samsung My Files** App, which you can find inside the Google Play Store website, the URL looks like this

```
https://play.google.com/store/apps/details?id=com.sec.android.app.myfiles&hl=gsw
```

Within the URL you can find the ID which is in this case **com.sec.android.app.myfiles**. That's exactly how the package will be then called if I were about to download it. So, if I wanted to remove it using ADB tools, use the premade that you can find here which is **adb shell pm uninstall --user 0 com.example.package1** and then modify the package name from **com.example.package1** to **com.sec.android.app.myfiles** which results to this command: `adb shell pm uninstall --user 0 com.sec.android.app.myfiles`. Note that if you wanted to keep the data created by this app that you whish to delete add between **uninstall** and **--user** **-k** to it. If you want to remove everything from it, don't add **-k** to the command as already covered inside the chapter **Uninstall Apps Using ADB**.

### **Setting PowerShell Execution Policy to Allow Scripts**

By default, Windows PowerShell may block the execution of scripts for security reasons. To allow PowerShell scripts to run, you need to modify the execution policy:

1. **Open PowerShell as Administrator**:

   - Right-click on **PowerShell** and select **Run as Administrator**.

2. **Set the Execution Policy**:
   To allow running scripts, set the execution policy to **RemoteSigned**:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

   - **RemoteSigned** allows you to run scripts written on your computer but requires downloaded scripts to be signed by a trusted publisher.

3. **Confirm the Change**:
   You will be prompted to confirm the change. Type `Y` to confirm.

### **Running the PowerShell Script**

**Important Note:**

1. **Samsung App Launcher**:

   - Do not remove the **Samsung App Launcher**. Removing it will also uninstall the **Samsung One UI Home** app, which is essential for the user interface design of your Samsung device. This specifically pertains to the package **"com.sec.android.app.launcher"**.

2. **Script Caution**:

   - If you plan to run the script section titled **# GENERAL SYSTEM - Miscellaneous System Apps and Services** in PowerShell ISE, be aware that it may negatively impact your phone's performance.

3. **Potential Access Issues**:

   - Without the Samsung App Launcher installed, you may face significant limitations in using your phone. You will likely only be able to access apps that you have previously opened, and switching between them will be possible, but direct access to other apps will be restricted.

4. **Downloading a Samsung App Launcher**:
   - If you still have the Google Play Store app open, you can download a Samsung App Launcher from [this link](https://play.google.com/store/search?q=samsung%20app%20launcher&c=apps&hl=gsw). However, this is only possible if the Play Store is currently open; otherwise, you will not be able to download it.

Please keep these points in mind to ensure the proper functioning of your device.

Once the execution policy is set, you can create and run a PowerShell script to list or uninstall apps. Here’s a simple script for listing and saving apps:

#### **PowerShell Script Example**:

To run the PowerShell script, you just need to copy and paste the entire script into the input field. Make sure to use **Windows PowerShell ISE** and not **Windows PowerShell** as this wouldn't contain a big input field to enter the script you want to run.

### **Turn Off usage data access**

Within the "Usage data access" within your settings, if you have given permission to some apps, they could do the following to monitor which other apps you use and how often, and identify your service provider, language settings, and other usage data.

It is recommended to turn it off for each app. How?

Go to **Settings**
Search **usage data access**
click **usage data access** and then look down the list and click "usage data access" again
Click the 3 dots in the top right
Select **Show system apps**
Click each app and turn it off

This way, those apps won't be able to track you anymore.

### **How to install APK on your phone if you have accidentally removed myfiles from your phone**

Example with Samsung Galaxy Store.

1. **Go to Google and search for APK name**:

```
samsung galaxy store apk
```

2. **Download APK on your computer**:

Download Link of [APKMirror](https://www.apkmirror.com/apk/samsung-electronics-co-ltd/galaxy-apps/galaxy-apps-4-5-88-5-release/samsung-galaxy-store-galaxy-apps-4-5-88-5-android-apk-download/download/?key=96e5f913bf7c74402d389d2ebc34aa22145665ad)

Rename the file and give it a simpler name like:

```bash
com.sec.android.app.samsungapps.apk
```

3. **Create folder inside Documents and put APK inside**:
   It's not recommended to put it inside of Downloads as it's difficult to access it from there. So, just put everything inside of Documents.

4. **Put the file from your computer to phone**:

```bash
adb push "C:\Users\[username]\Documents\Samsung Store\com.sec.android.app.samsungapps.apk" /data/local/tmp/
```

4. **Access file stored in phone and run it**:

```bash
adb shell pm install /data/local/tmp/com.sec.android.app.samsungapps.apk
```

## **More Information**

What is the package name of **Samsung App Cloud**?
https://www.reddit.com/r/Intune/comments/12iyniy/any_know_package_name_of_samsung_app_cloud_so_can/?rdt=52906<br>

How to uninstall **Samsung Gallery App** - Not recommended
https://android.stackexchange.com/questions/234132/what-is-the-package-name-for-the-default-samsung-gallery-app<br>

How to uninstall **Samsung Store Apps** - Not recommended
https://stackoverflow.com/questions/65102614/samsung-store-apps-installer-package-name<br>

How to uninstall **Netflix**
https://community.oneplus.com/thread/1540015<br>

Successfully uninstall **upday**, now I have zero news.
https://xdaforums.com/t/successfully-uninstalled-upday-now-i-have-sohu-news-can-i-uninstall-that-too.4135515/<br>

How to find package of **Samsung Tips** to uninstall it succesffully
https://galaxystore.samsung.com/detail/com.samsung.android.app.tips?langCd=da<br>

How to find package of **Bixby Vision** to uninstall it succesffully
https://galaxystore.samsung.com/detail/com.samsung.android.visionintelligence<br>

How to find package of **Google Messages** to uninstall it succesffully
https://play.google.com/store/apps/details?id=com.google.android.apps.messaging&hl=de_CH<br>

ChatGPT Chat for the creation of the script
https://chatgpt.com/share/67964fed-96ec-8008-a60e-96b7f0b5a7d9<br>

How to uninstall most popular apps - Part 1
https://xdaforums.com/t/my-s10-s10-bloatware-package-name-list.4054003/<br>

How to uninstall most popular apps - Part 2 (with included instructions on how to disable access to usage data)
https://xdaforums.com/t/adb-to-remove-built-in-apps.3932377/

### **Conclusion**

ADB is a powerful tool that enables you to manage Android devices efficiently. You can list and uninstall apps, as well as perform a variety of other tasks, all through simple commands. Setting up ADB is quick and allows you to interact with your device directly from your computer. You can use PowerShell to automate tasks and manage your apps, and you can change the execution policy on Windows to allow running scripts.

If you follow the steps outlined above, you’ll be able to list all apps on your device and uninstall any unnecessary ones, all while saving the data in a `.txt` file for reference.
