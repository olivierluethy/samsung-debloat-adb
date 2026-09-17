# List of package names targeted for removal
# This list comprises unnecessary pre-installed packages on Samsung devices that are not typically utilized by users in a traditional manner.
# These packages may collect user data and potentially share or sell it to third parties, despite their lack of practical use.
# Removing all packages from this list poses no risk to the Android device; it will continue to function normally post-removal.

$apps = @(
    # === BIXBY SERVICES ===
    # Samsung's virtual assistant and related features
    "com.samsung.android.bixby.wakeup", # Bixby Wake-up Service - Listens for voice activation
    "com.samsung.android.app.spage", # Bixby Home - Samsung's Bixby dashboard app
    "com.samsung.android.app.routines", # Bixby Routines - Automation tool for Bixby
    "com.samsung.android.bixby.service", # Bixby Service - Core functionality for Bixby
    "com.samsung.android.bixby.agent", # Bixby Voice Agent - Handles voice commands
    "com.samsung.android.bixby.agent.dummy", # Dummy Bixby Agent - Background support for Bixby
    "com.samsung.android.visionintelligence", # Bixby Vision - Image recognition feature

    # === FACEBOOK / META APPS ===
    # Pre-installed Meta services and apps
    "com.facebook.system", # Meta App Installer - Installs Meta apps
    "com.facebook.appmanager", # Meta App Manager - Manages Meta app updates
    "com.facebook.services", # Meta Services - Background services for Meta apps
    "com.facebook.katana", # Facebook App - Main Facebook application

    # === CAR MODE ===
    # Samsung's car-related functionality
    "com.samsung.android.drivelink.stub", # Samsung DriveLink - Stub for Car Mode app

    # === SAMSUNG GAMING FEATURES ===
    # Gaming hub and optimization tools
    "com.samsung.android.game.gamehome", # Gaming Hub - Central app for Samsung gaming
    "com.enhance.gameservice", # Game Service - Background gaming support
    "com.samsung.android.game.gametools", # Game Tools - In-game enhancement features
    "com.samsung.android.game.gos", # Game Optimization Service - Optimizes game performance
    "com.samsung.android.gametuner.thin", # Game Tuner - Performance tuning for games

    # === SAMSUNG INTERNET BROWSER ===
    # Samsung's built-in web browser
    "com.sec.android.app.sbrowser", # Samsung Internet Browser - Main browser app
    "com.samsung.android.app.sbrowseredge", # Samsung Browser Edge Features - Edge panel integration

    # === SAMSUNG MISCELLANEOUS APPS ===
    # Various Samsung utilities and services
    "com.samsung.android.forest", # Digital Detox - App for focus and screen time management
    "com.samsung.android.game.gos", # Game Optimization Service (Duplicate) - Game performance enhancer
    "com.samsung.android.knox.kpecore", # Knox KPE Core - Enterprise security core
    "com.samsung.android.knox.containercore", # Knox Container Core - Secure container service
    "com.samsung.android.rubin.app", # Rubin App - Personalization service
    "com.samsung.android.themestore", # Theme Store - Samsung theme marketplace
    "com.samsung.android.themecenter", # Theme Center - Theme management app

    # === SAMSUNG SPEECH-TO-TEXT LANGUAGE PACKS ===
    # Language packs for Samsung's speech-to-text engine
    "com.samsung.SMT.lang_fr_fr_f00", # French (France) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_de_de_f00", # German (Germany) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_hi_in_f00", # Hindi (India) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_it_it_f00", # Italian (Italy) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_pl_pl_f00", # Polish (Poland) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_ru_ru_f00", # Russian (Russia) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_th_th_f00", # Thai (Thailand) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_en_gb_f00", # English (UK) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_en_us_f00", # English (US) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_es_us_f00", # Spanish (US) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_vi_vn_f00", # Vietnamese (Vietnam) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_es_es_f00", # Spanish (Spain) Language Pack - Speech-to-text support
    "com.samsung.SMT.lang_en_us_l03", # English (US) Alternate Language Pack - Speech-to-text support

    # === GEAR VR SERVICES ===
    # Virtual reality support for Samsung Gear VR
    "com.samsung.android.hmt.vrsvc", # Gear VR Service - Core VR functionality
    "com.samsung.android.app.vrsetupwizardstub", # VR Setup Wizard Stub - Setup assistant for VR
    "com.samsung.android.hmt.vrshell", # Gear VR Shell - VR environment interface
    "com.google.vr.vrcore", # Google VR Core - Google’s VR framework

    # === SAMSUNG CALENDAR ===
    # Samsung's calendar application
    "com.samsung.android.calendar", # Samsung Calendar - Calendar and event management

    # === SAMSUNG KIDS MODE ===
    # Features for child-friendly usage
    "com.samsung.android.kidsinstaller", # Samsung Kids Installer - Installs Kids Mode
    "com.samsung.android.app.camera.sticker.facearavatar.preload", # Face AR Avatar Stickers - Preloaded AR stickers for kids

    # === EDGE FEATURES ===
    # Samsung Edge panel services
    "com.samsung.android.service.peoplestripe", # People Edge Service - Edge panel contacts feature

    # === MICROSOFT SWIFTKEY KEYBOARD ===
    # Pre-installed keyboard app
    "com.swiftkey.swiftkeyconfigurator", # SwiftKey Configurator - Keyboard setup tool
    "com.touchtype.swiftkey", # SwiftKey Keyboard - Main keyboard app

    # === GIMMICKY AR & FUN APPS ===
    # Augmented reality and entertainment apps
    "com.samsung.android.aremoji", # AR Emoji - Creates animated avatars
    "com.google.ar.core", # Google AR Core - Augmented reality framework
    "flipboard.boxer.app", # Flipboard - News and content aggregation app
    "com.samsung.android.wellbeing", # Samsung Wellbeing - Digital wellbeing tracker
    "com.samsung.android.da.daagent", # DA Agent - Diagnostic agent for Samsung
    "com.samsung.android.service.livedrawing", # Live Drawing - Real-time drawing service
    "com.sec.android.mimage.avatarstickers", # Avatar Stickers - AR emoji stickers
    "com.samsung.android.ardrawing", # AR Doodle - AR drawing tool
    "com.samsung.android.aremojieditor", # AR Emoji Editor - Edits AR emojis
    "com.samsung.android.arzone", # AR Zone - Hub for AR features

    # === PRINTING SERVICES ===
    # Printer-related functionality
    "com.android.bips", # BIPS Printing Service - Built-in print service
    "com.google.android.printservice.recommendation", # Print Service Recommendation - Suggests print services
    "com.android.printspooler", # Print Spooler - Manages print jobs

    # === SAMSUNG PAYMENT & AUTHENTICATION ===
    # Samsung Pass, Pay, and wallet services
    "com.samsung.android.samsungpassautofill", # Samsung Pass Autofill - Password autofill service
    "com.samsung.android.authfw", # Authentication Framework - Core auth service
    "com.samsung.android.samsungpass", # Samsung Pass - Password management app
    "com.samsung.android.spay", # Samsung Pay - Mobile payment app
    "com.samsung.android.spayfw", # Samsung Pay Framework - Payment framework
    "com.samsung.android.sdk.mobileservice", # Samsung Mobile Services SDK - Developer kit for services
    "com.samsung.android.digitalkey", # Digital Key - Digital key for Samsung Wallet
    "com.samsung.android.samsungpay.gear", # Samsung Pay for Gear - Payment for wearables
    "com.sec.android.app.billing", # Samsung Checkout - Billing service
    "com.samsung.android.dkey", # Samsung Wallet Digital Key - Wallet key service

    # === SAMSUNG UTILITIES ===
    # Additional Samsung tools and services
    "com.sec.android.daemonapp", # Samsung Weather - Weather forecast app
    "com.samsung.android.app.settings.bixby", # Bixby Settings - Bixby integration in settings
    "com.samsung.android.smartsuggestions", # Smart Suggestions - AI-driven suggestions
    "com.sec.android.widgetapp.webmanual", # Web Manual Widget - Online manual widget
    "com.samsung.android.service.aircommand", # Air Command - S Pen feature hub
    "com.samsung.android.app.tips", # Samsung Tips - Tips and tutorials app

    # === VIDEO & MUSIC STREAMING ===
    # Pre-installed streaming apps
    "com.google.android.youtube", # YouTube - Video streaming app
    "com.google.android.apps.youtube.music", # YouTube Music - Music streaming app
    "com.netflix.mediaclient", # Netflix - Main Netflix streaming app
    "com.netflix.partner.activation", # Netflix Partner Activation - Activation service

    # === SAMSUNG SECURE FEATURES ===
    # Security and cloud services
    "com.samsung.knox.securefolder", # Samsung Secure Folder - Secure app container
    "com.samsung.android.scloud", # Samsung Cloud - Cloud backup service
    "com.samsung.android.mdx", # Samsung Core Services (MDX) - Core device services

    # === GOOGLE APPS & SERVICES ===
    # Pre-installed Google applications
    "com.google.android.apps.googleassistant", # Google Assistant - Virtual assistant app
    "com.android.hotwordenrollment.xgoogle", # Google Assistant Hotword (XGoogle) - Voice activation
    "com.android.hotwordenrollment.okgoogle", # Google Assistant Hotword (OK Google) - Voice activation
    "com.android.chrome", # Google Chrome - Web browser
    "com.google.android.googlequicksearchbox", # Google App - Search and quick access app
    "com.google.android.apps.messaging", # Google Messages - SMS/MMS app
    "com.google.android.documentsui", # Google Files - File management app

    # === SAMSUNG DICTIONARY ===
    # Dictionary service
    "com.diotek.sec.lookup.dictionary", # Samsung Dictionary - Built-in dictionary app

    # === ACCESSIBILITY SERVICES ===
    # Tools for accessibility
    "com.google.audio.hearing.visualization.accessibility.scribe", # Live Transcribe - Real-time transcription

    # === LANGUAGE SUPPORT ===
    # Additional language packs
    "com.samsung.android.language.en_pt", # English-Portuguese Language Pack - Language support

    # === SHARING SERVICES ===
    # Group sharing functionality
    "com.samsung.android.groupshare", # Group Share - Content sharing service

    # === NEWS AGGREGATION ===
    # Pre-installed news app
    "de.axelspringer.yana.zeropage", # Upday - News aggregation app

    # === MICROSOFT PARTNER APPS ===
    # Pre-installed Microsoft software
    "com.microsoft.skydrive", # OneDrive - Cloud storage app
    "com.microsoft.appmanager", # Link to Windows - Phone Link companion
    "com.microsoft.office.officehubrow", # Microsoft 365 (Office) - Office hub app
    "com.microsoft.office.outlook", # Microsoft Outlook - Mail and calendar app
    "com.linkedin.android", # LinkedIn - Social networking app

    # === GOOGLE EXTRAS ===
    # Additional pre-installed Google apps
    "com.google.android.apps.tachyon", # Google Meet - Video calling app (formerly Duo)
    "com.google.android.videos", # Google TV - Movies and TV (formerly Play Movies)
    "com.google.android.play.games", # Google Play Games - Gaming service
    "com.google.android.apps.photos", # Google Photos - Photo backup and gallery
    "com.google.android.apps.docs", # Google Drive - Cloud storage app
    "com.google.android.projection.gearhead", # Android Auto - In-car interface
    "com.google.android.feedback", # Google Feedback - Feedback reporting service
    "com.google.android.apps.subscriptions.red", # Google One - Subscription and storage app

    # === SAMSUNG EDGE PANELS ===
    # Edge panel add-ons
    "com.samsung.android.app.appsedge", # Apps Edge - Edge panel app shortcuts
    "com.samsung.android.app.taskedge", # Tasks Edge - Edge panel task shortcuts

    # === SAMSUNG CONNECTIVITY & SHARING ===
    # Device connectivity and content sharing
    "com.samsung.android.oneconnect", # SmartThings - Smart home hub
    "com.samsung.android.smartmirroring", # Smart View - Screen mirroring
    "com.samsung.android.allshare.service.fileshare", # AllShare File Share - Legacy DLNA file sharing
    "com.samsung.android.allshare.service.mediashare", # AllShare Media Share - Legacy DLNA media sharing
    "com.samsung.android.beaconmanager", # Beacon Manager - Bluetooth beacon service
    "com.samsung.android.easysetup", # Easy Setup - Device onboarding service

    # === SAMSUNG APPS & SERVICES ===
    # Additional Samsung applications
    "com.samsung.android.voc", # Samsung Members - Support and community app
    "com.samsung.android.shealth", # Samsung Health - Fitness and wellness tracker
    "com.samsung.android.tvplus", # Samsung TV Plus - Free live TV streaming
    "com.samsung.android.app.reminder", # Samsung Reminder - Task and reminder app
    "com.samsung.android.smartswitchassistant", # Smart Switch Assistant - Data migration helper
    "com.samsung.android.app.omcagent", # OMC Agent - Carrier customization service
    "com.samsung.android.bixbyvision.framework", # Bixby Vision Framework - Bixby Vision backend

    # === THIRD-PARTY PARTNER APPS ===
    # Preloaded third-party apps from partner deals
    "com.spotify.music", # Spotify - Music streaming app
    "com.amazon.mShop.android.shopping", # Amazon Shopping - Shopping app
    "com.instagram.android"                              # Instagram - Social media app
)