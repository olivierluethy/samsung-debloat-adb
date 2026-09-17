# =============================================================================
#  Kritische Warnungen vor der Deinstallation
# =============================================================================
# Diese Datei definiert Pakete, deren Entfernung ernsthafte Folgen hat.
# main.ps1 prueft vor JEDER Deinstallation, ob das Paket hier gelistet ist,
# und verlangt in diesem Fall eine ausdrueckliche Bestaetigung.
#
# Zwei Stufen:
#   Critical : Das Geraet wird unbrauchbar oder es gehen Daten unwiderruflich
#              verloren. Zum Fortfahren muss der Nutzer das Wort LOESCHEN tippen.
#   Warning  : Eine wichtige Funktion faellt weg, das Geraet bleibt aber nutzbar.
#              Der Nutzer bestaetigt mit j/n.
#
# Bewusst werden NUR wirklich folgenschwere Pakete gelistet. Wuerde alles eine
# Warnung ausloesen, wuerden Nutzer sie ignorieren und echte Warnungen uebersehen.

$criticalWarnings = @{

    # --- KRITISCH: Geraet wird unbrauchbar oder Datenverlust ---

    "com.sec.android.app.launcher" = @{
        Level   = "Critical"
        Message = "Samsung One UI Home (Startbildschirm/Launcher). Ohne einen zuvor installierten und als Standard gesetzten alternativen Launcher wird Ihr Geraet praktisch unbedienbar: kein Startbildschirm, kein App-Menue, keine Navigation."
    }
    "com.samsung.knox.securefolder" = @{
        Level   = "Critical"
        Message = "Sicherer Ordner (Secure Folder). Alle darin gespeicherten Apps, Fotos und Dateien werden unwiderruflich geloescht und koennen nicht wiederhergestellt werden."
    }
    "com.google.android.apps.messaging" = @{
        Level   = "Critical"
        Message = "Google Nachrichten. Falls dies Ihre Standard-SMS-App ist, koennen Sie danach keine SMS/MMS mehr senden oder empfangen, bis Sie eine andere SMS-App installiert und als Standard gesetzt haben."
    }

    # --- WARNUNG: wichtige Funktion faellt weg, Geraet bleibt nutzbar ---

    "com.samsung.android.bixby.agent" = @{
        Level   = "Warning"
        Message = "Bixby Sprachassistent. Bixby-Sprachbefehle und die Bixby-Taste funktionieren danach nicht mehr."
    }
    "com.samsung.android.bixby.service" = @{
        Level   = "Warning"
        Message = "Bixby-Kernservice. Alle Bixby-Funktionen (Sprache, Routinen, Vision) werden danach nicht mehr funktionieren."
    }
    "com.samsung.android.app.spage" = @{
        Level   = "Warning"
        Message = "Bixby Home / Samsung Free Seite links vom Startbildschirm. Diese Seite ist danach nicht mehr verfuegbar."
    }
    "com.samsung.android.calendar" = @{
        Level   = "Warning"
        Message = "Samsung Kalender. Ihre Termine und Erinnerungen sind ohne eine alternative Kalender-App nicht mehr abrufbar."
    }
    "com.sec.android.app.sbrowser" = @{
        Level   = "Warning"
        Message = "Samsung Internet Browser. Falls dies Ihr Standardbrowser ist, lassen sich Links danach nicht mehr oeffnen, bis ein anderer Browser als Standard gesetzt ist."
    }
    "com.android.chrome" = @{
        Level   = "Warning"
        Message = "Google Chrome. Falls dies Ihr Standardbrowser ist, lassen sich Links danach nicht mehr oeffnen, bis ein anderer Browser als Standard gesetzt ist."
    }
    "com.touchtype.swiftkey" = @{
        Level   = "Warning"
        Message = "SwiftKey Tastatur. Entfernen Sie diese nicht, ohne eine andere Tastatur aktiviert zu haben, sonst koennen Sie unter Umstaenden keinen Text mehr eingeben."
    }
    "com.samsung.android.spay" = @{
        Level   = "Warning"
        Message = "Samsung Pay / Wallet. Hinterlegte Karten und mobiles Bezahlen sind danach nicht mehr verfuegbar."
    }
    "com.samsung.android.samsungpass" = @{
        Level   = "Warning"
        Message = "Samsung Pass. Gespeicherte Passwoerter und biometrische Anmeldungen ueber Samsung Pass stehen danach nicht mehr zur Verfuegung."
    }
    "com.samsung.android.scloud" = @{
        Level   = "Warning"
        Message = "Samsung Cloud. Automatische Backups und die Cloud-Synchronisierung werden deaktiviert."
    }
    "com.samsung.android.shealth" = @{
        Level   = "Warning"
        Message = "Samsung Health. Ohne vorherige Datensicherung koennen Ihre aufgezeichneten Gesundheits- und Fitnessdaten verloren gehen."
    }
    "com.samsung.android.smartswitchassistant" = @{
        Level   = "Warning"
        Message = "Smart Switch Assistant. Der Umzug von Daten auf ein neues Geraet ist danach nur eingeschraenkt moeglich."
    }
}
