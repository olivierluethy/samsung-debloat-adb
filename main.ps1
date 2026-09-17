# Skript initialisieren mit UTF-8 Kodierung für Ein- und Ausgabe
Clear-Host
[Console]::InputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "         Samsung App Deinstallation Tool" -ForegroundColor Yellow
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "Aktuelles Datum: $(Get-Date -Format 'dd.MM.yyyy HH:mm')" -ForegroundColor Gray
Write-Host ""

# Arbeitsverzeichnis dynamisch auf den Skriptordner setzen
$workingDirectory = $PSScriptRoot
Set-Location -Path $workingDirectory
Write-Host "Arbeitsverzeichnis: $workingDirectory" -ForegroundColor Green

# Prüfen, ob die Dateien existieren
$appsScript = ".\apps.ps1"
$systemScript = ".\system.ps1"
$warningsScript = ".\warnings.ps1"

# Skripte laden
try {
    . $appsScript
    . $systemScript
    . $warningsScript
}
catch {
    Write-Host "Fehler beim Laden der Skripte: $_" -ForegroundColor Red
    exit
}

# Benutzerabfrage
Write-Host "`n=== Konfiguration der Deinstallation ===" -ForegroundColor Cyan
$deleteData = Read-Host "Möchten Sie alle Anwendungsdaten vollständig löschen? Ja bedeutet, dass die Apps inklusive Cache gelöscht werden. Wenn nein, werden die Apps gelöscht, aber nicht der Cache. (j/n)"
$uninstallFlag = if ($deleteData -eq 'j') { "" } else { "-k" }

Write-Warning "Das Entfernen von Samsung UI-Funktionen kann Ihre Benutzererfahrung beeinträchtigen. Mit Vorsicht fortfahren."
$deleteSamsungUIFunctionality = Read-Host "`nMöchten Sie auch die Samsung UI-Funktionen entfernen? (j/n)"

if ($deleteSamsungUIFunctionality -eq 'j') {
    Write-Host "`nWICHTIG:" -ForegroundColor Yellow
    Write-Host "Stellen Sie sicher, dass Sie Ihre Daten gesichert und einen alternativen Launcher als Standard eingestellt haben." -ForegroundColor Yellow
    $backUpMade = Read-Host "Backup und alternativer Launcher vorbereitet? (j/n)"
    
    if ($backUpMade -ne 'j') {
        Write-Host "Abbruch: Bitte sichern Sie Ihre Daten und richten Sie einen Launcher ein." -ForegroundColor Red
        exit
    }
}

# Gesamtzahl der Apps berechnen
$totalApps = $apps.Count
if ($deleteSamsungUIFunctionality -eq 'j') {
    $totalApps += $system.Count
}

# Funktion zum Prüfen, ob eine App installiert ist
function Test-AppInstalled($packageName) {
    $result = adb shell pm list packages | Where-Object { $_ -eq "package:$packageName" }
    return $null -ne $result
}

# Funktion, die vor folgenschweren Deinstallationen warnt und eine Bestätigung verlangt.
# Gibt $true zurück, wenn entfernt werden darf, sonst $false (App wird übersprungen).
function Confirm-Removal($packageName) {
    $warn = $criticalWarnings[$packageName]
    if (-not $warn) { return $true }  # Keine Warnung hinterlegt -> normal fortfahren

    Write-Host ""
    Write-Host "  ------------------------------------------------------------" -ForegroundColor DarkYellow
    if ($warn.Level -eq 'Critical') {
        Write-Host "  KRITISCHE WARNUNG - $packageName" -ForegroundColor Red
        Write-Host "  $($warn.Message)" -ForegroundColor Red
        Write-Host "  ------------------------------------------------------------" -ForegroundColor DarkYellow
        $confirm = Read-Host "  Zum tatsaechlichen Entfernen 'LOESCHEN' eingeben (alles andere ueberspringt)"
        return ($confirm -ceq 'LOESCHEN')
    }
    else {
        Write-Host "  WARNUNG - $packageName" -ForegroundColor Yellow
        Write-Host "  $($warn.Message)" -ForegroundColor Yellow
        Write-Host "  ------------------------------------------------------------" -ForegroundColor DarkYellow
        $confirm = Read-Host "  Trotzdem entfernen? (j/n)"
        return ($confirm -eq 'j')
    }
}

# Deinstallation durchführen
Write-Host "`n=== Deinstallation wird gestartet ===" -ForegroundColor Cyan
$currentApp = 0
$skipped = 0

foreach ($app in $apps) {
    $currentApp++
    Write-Progress -Activity "Deinstalliere Apps" -Status "$currentApp von $totalApps abgeschlossen" -PercentComplete (($currentApp / $totalApps) * 100)
    Write-Host "Prüfe $app..." -ForegroundColor White

    try {
        if (Test-AppInstalled -packageName $app) {
            if (-not (Confirm-Removal $app)) {
                Write-Host "  Übersprungen: $app wurde auf Ihren Wunsch behalten." -ForegroundColor Cyan
                $skipped++
                continue
            }
            adb shell pm uninstall $uninstallFlag --user 0 "$app" | Out-Null
            # Zweite Überprüfung nach Deinstallation
            if (-not (Test-AppInstalled -packageName $app)) {
                Write-Host "  Erfolg: $app wurde entfernt." -ForegroundColor Green
            }
            else {
                Write-Host "  Fehler: $app konnte nicht entfernt werden." -ForegroundColor Red
            }
        }
        else {
            Write-Host "  Info: $app war bereits nicht installiert." -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "  Fehler: $app konnte nicht entfernt werden. ($_)" -ForegroundColor Red
    }
}

if ($deleteSamsungUIFunctionality -eq 'j') {
    foreach ($generalApp in $system) {
        $currentApp++
        Write-Progress -Activity "Deinstalliere Samsung UI-Komponenten" -Status "$currentApp von $totalApps abgeschlossen" -PercentComplete (($currentApp / $totalApps) * 100)
        Write-Host "Prüfe $generalApp..." -ForegroundColor White
        
        try {
            if (Test-AppInstalled -packageName $generalApp) {
                if (-not (Confirm-Removal $generalApp)) {
                    Write-Host "  Übersprungen: $generalApp wurde auf Ihren Wunsch behalten." -ForegroundColor Cyan
                    $skipped++
                    continue
                }
                adb shell pm uninstall $uninstallFlag --user 0 "$generalApp" | Out-Null
                if (-not (Test-AppInstalled -packageName $generalApp)) {
                    Write-Host "  Erfolg: $generalApp wurde entfernt." -ForegroundColor Green
                }
                else {
                    Write-Host "  Fehler: $generalApp konnte nicht entfernt werden." -ForegroundColor Red
                }
            }
            else {
                Write-Host "  Info: $generalApp war bereits nicht installiert." -ForegroundColor Yellow
            }
        }
        catch {
            Write-Host "  Fehler: $generalApp konnte nicht entfernt werden. ($_)" -ForegroundColor Red
        }
    }
}

# Abschluss
Write-Progress -Activity "Deinstallation" -Completed
Write-Host "`n==============================================================" -ForegroundColor Cyan
Write-Host "         Deinstallation abgeschlossen" -ForegroundColor Green
Write-Host "==============================================================" -ForegroundColor Cyan
if ($skipped -gt 0) {
    Write-Host "$skipped App(s) wurden aufgrund von Warnungen übersprungen und behalten." -ForegroundColor Cyan
}
Write-Host "Vielen Dank für die Nutzung des Tools!" -ForegroundColor Gray