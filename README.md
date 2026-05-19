# MarburgInFlutterFlow

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.


## iOS Build Hinweis

Falls beim iOS-Build der Fehler `Command PhaseScriptExecution failed with a nonzero exit code` erscheint, in Xcode prüfen:

Runner → Build Settings → User Script Sandboxing → No

Danach das Projekt immer über `ios/Runner.xcworkspace` öffnen, nicht über `ios/Runner.xcodeproj`.
