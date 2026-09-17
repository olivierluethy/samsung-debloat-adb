# This will remove all system apps that Android works with, so you will only be able to switch between the apps you have open, not more. A backup of the Samsung UI is recommended.

$system = @(
    # GENERAL SYSTEM - Miscellaneous System Apps and Services
    "com.dsi.ant.sample.acquirechannels", # ANT+ Channels
    "com.dsi.ant.service.socket", # ANT+ Service Socket
    "com.dsi.ant.server", # ANT+ Server
    "com.dsi.ant.plugins.antplus", # ANT+ Plugin for Devices
    "com.android.egg", # Hidden Easter Egg Game
    "com.sec.android.easyonehand", # Easy One Hand Mode
    "com.sec.android.widgetapp.samsungapps", # Samsung Apps Widget
    "com.sec.android.app.launcher", # Samsung One UI Home aka Samsung App Launcher -- This will remove ground functionality and UI on your samsung device
    "com.samsung.android.mateagent", # Samsung Device Management Agent
    "com.sec.android.easyMover.Agent", # Easy Mover (Data Transfer)
    "com.samsung.android.app.watchmanagerstub", # Samsung Watch Manager Stub
    "com.sec.android.daemonapp", # Samsung Daemon App
    "com.samsung.android.app.social", # Samsung Social Hub
     # SAMSUNG LED COVER - Apps Related to Samsung’s LED Cover
     "com.samsung.android.app.ledbackcover", # LED Back Cover App
     "com.sec.android.cover.ledcover", # LED Cover Service
     # SAMSUNG DEX - Samsung's Desktop Experience Mode
    "com.sec.android.desktopmode.uiservice", # Samsung Dex Service
    "com.samsung.desktopsystemui", # Desktop UI for Dex Mode
    "com.sec.android.app.desktoplauncher" # Dex Launcher
)