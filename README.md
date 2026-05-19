# MarburgInFlutterFlow

Dieses Projekt ist eine mit FlutterFlow erstellte Flutter-Version der Marburg-App.  
Es wurde im Rahmen einer Bachelorarbeit entwickelt und dient der funktionsnahen Nachbildung sowie dem Vergleich mit einer nativen iOS-App.

## Projektbeschreibung

Die Anwendung wurde mit der Low-Code-Plattform FlutterFlow entwickelt und anschließend als Flutter-Projekt exportiert. Ziel des Projekts ist es, zentrale Funktionen der bestehenden Marburg-App nachzubilden und die Umsetzung mit FlutterFlow hinsichtlich Funktionalität, Entwicklungsaufwand, UI/UX, Wartbarkeit und nativer iOS-Unterstützung zu untersuchen.

Das Projekt basiert auf Flutter und verwendet die von FlutterFlow generierte Projektstruktur. Ergänzende Anpassungen können nach dem Export direkt im Flutter-Code oder in Xcode vorgenommen werden.

## Getting Started

FlutterFlow-Projekte sind dafür ausgelegt, mit der stabilen Flutter-Version ausgeführt zu werden.

Vor dem Start sollte sichergestellt werden, dass Flutter korrekt installiert ist und die benötigten Abhängigkeiten geladen wurden.

```bash
flutter pub get
```

Anschließend kann das Projekt gestartet werden mit:

```bash
flutter run
```

## Voraussetzungen

Für die lokale Ausführung werden folgende Werkzeuge benötigt:

- Flutter SDK auf dem Stable Channel
- Dart SDK
- Xcode für iOS-Builds
- CocoaPods
- Ein iOS-Simulator oder ein angeschlossenes iOS-Gerät
- Optional: Android Studio oder Visual Studio Code

Die Flutter-Installation kann mit folgendem Befehl überprüft werden:

```bash
flutter doctor
```

## Projekt lokal öffnen

Nach dem Export aus FlutterFlow kann das Projekt lokal geöffnet werden.

Beispiel:

```bash
cd /Users/eliassalama/Desktop/MarburgInFlutterFlow-1.0.0-flutterflow
```

Danach sollten zunächst die Flutter-Abhängigkeiten geladen werden:

```bash
flutter pub get
```

## iOS Build Hinweis

Falls beim iOS-Build der Fehler

```text
Command PhaseScriptExecution failed with a nonzero exit code
```

erscheint, sollte in Xcode folgende Einstellung überprüft werden:

```text
Runner → Build Settings → User Script Sandboxing → No
```

Danach sollte das Projekt immer über die Workspace-Datei geöffnet werden:

```text
ios/Runner.xcworkspace
```

Nicht verwenden:

```text
ios/Runner.xcodeproj
```

## iOS Build bereinigen und neu aufsetzen

Falls es zu Problemen mit Pods, DerivedData oder iOS-Abhängigkeiten kommt, kann das Projekt vollständig bereinigt und neu vorbereitet werden.

Zuerst in das Projektverzeichnis wechseln:

```bash
cd /Users/eliassalama/Desktop/MarburgInFlutterFlow-1.0.0-flutterflow
```

Danach folgende Befehle ausführen:

```bash
flutter clean

rm -rf ios/Pods
rm -rf ios/Podfile.lock
rm -rf ios/.symlinks
rm -rf ~/Library/Developer/Xcode/DerivedData

flutter pub get

cd ios
pod deintegrate
pod install --repo-update
cd ..

flutter run -v
```

Diese Schritte entfernen alte Build-Dateien, löschen vorhandene CocoaPods-Abhängigkeiten und installieren die iOS-Pods anschließend vollständig neu.

## Ausführung im Debug-Modus

Zum Starten der App im Debug-Modus kann folgender Befehl verwendet werden:

```bash
flutter run
```

Für eine ausführliche Ausgabe während des Builds:

```bash
flutter run -v
```

## Projektstruktur

Die Projektstruktur basiert auf dem von FlutterFlow generierten Flutter-Export.

Typische Bestandteile sind:

```text
lib/
├── backend/
├── components/
├── flutter_flow/
├── custom_code/
├── pages/
└── main.dart

ios/
android/
pubspec.yaml
```

Wichtige Bereiche:

- `lib/pages/` enthält die einzelnen Seiten der Anwendung.
- `lib/components/` enthält wiederverwendbare FlutterFlow-Komponenten.
- `lib/backend/` enthält generierte Backend- und Datenbankstrukturen.
- `lib/custom_code/` enthält ergänzende Custom Actions, Custom Widgets oder Custom Functions.
- `lib/flutter_flow/` enthält von FlutterFlow generierte Hilfsdateien, Themes und Utility-Funktionen.
- `ios/` enthält die iOS-spezifische Projektstruktur.

## Wichtige Hinweise

- Das Projekt sollte nach Möglichkeit immer mit der stabilen Flutter-Version ausgeführt werden.
- Änderungen an iOS-spezifischen Einstellungen sollten über Xcode im Workspace vorgenommen werden.
- Nach größeren Änderungen an Abhängigkeiten empfiehlt sich ein erneutes Ausführen von `flutter clean` und `flutter pub get`.
- Bei iOS-Problemen sollte zusätzlich der Ordner `DerivedData` gelöscht werden.
- Für iOS-Builds muss CocoaPods korrekt installiert und aktuell sein.
- Das Projekt sollte für iOS immer über `ios/Runner.xcworkspace` geöffnet werden.

## Hinweise zur Entwicklung

Da dieses Projekt aus FlutterFlow exportiert wurde, können Teile des Codes bei einem erneuten Export überschrieben werden. Eigene Anpassungen sollten daher sorgfältig dokumentiert und möglichst in den dafür vorgesehenen Bereichen wie `custom_code` vorgenommen werden.

Bei manuellen Änderungen am exportierten Flutter-Projekt sollte beachtet werden, dass FlutterFlow weiterhin die primäre Entwicklungsumgebung für visuelle Änderungen und viele App-Flows bleibt.

## Lizenz und Verwendung

Dieses Projekt wurde im Rahmen einer Bachelorarbeit erstellt. Die Nutzung, Weiterentwicklung oder Veröffentlichung sollte nur unter Berücksichtigung des jeweiligen Projektkontexts und der verwendeten Abhängigkeiten erfolgen.
