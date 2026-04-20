// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// DO NOT REMOVE ABOVE

import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// 🔔 Notification Plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// 🔥 GLOBAL STATE
StreamSubscription<Position>? _positionStream;
List<String> _currentAddresses = [];

final Set<String> _notifiedEvents = {};
final Set<String> _failedAddresses = {};
final Map<String, DateTime> _lastNotificationTime = {};
final Map<String, Location> _cachedLocations = {};

DateTime? _lastResetTime;

// 📏 Radius
const double EVENT_RADIUS = 300;

// ⏱ Cooldown
const Duration COOLDOWN = Duration(minutes: 30);

///////////////////////////////////////////////////////////////
/// 🚀 START TRACKING (JETZT REALTIME)
///////////////////////////////////////////////////////////////

Future startLocationTracking(
  bool trackingEnabled,
  List<String> eventAddresses,
) async {
  if (!trackingEnabled) {
    await stopLocationTracking();
    print("🔕 Tracking AUS");
    return;
  }

  _currentAddresses = eventAddresses;

  if (_positionStream != null) {
    print("🔄 Tracking läuft → Adressen aktualisiert");
    return;
  }

  print("🚀 Tracking gestartet");

  tz.initializeTimeZones();

  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    print("❌ Keine Location Permission");
    return;
  }

  _positionStream = Geolocator.getPositionStream(
    locationSettings: LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 0, // 🔥 JEDES UPDATE
    ),
  ).listen((Position position) async {
    print("📍 Position: ${position.latitude}, ${position.longitude}");

    // 🔥 IMMER CHECKEN
    await _checkNearbyEvents(position);
  });
}

///////////////////////////////////////////////////////////////
/// 🛑 STOP TRACKING
///////////////////////////////////////////////////////////////

Future stopLocationTracking() async {
  await _positionStream?.cancel();
  _positionStream = null;
  print("🛑 Tracking gestoppt");
}

///////////////////////////////////////////////////////////////
/// 🧠 NORMALIZE ADDRESS
///////////////////////////////////////////////////////////////

Map<String, String> normalizeAddressParts(String address) {
  String clean = address
      .toLowerCase()
      .replaceAll("ß", "ss")
      .replaceAll("straße", "strasse")
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  final match = RegExp(r'(.+?)\s*(\d+[a-zA-Z]?)').firstMatch(clean);

  if (match != null) {
    return {
      "street": match.group(1)!.trim(),
      "number": match.group(2)!.trim(),
    };
  }

  return {
    "street": clean,
    "number": "",
  };
}

///////////////////////////////////////////////////////////////
/// ❌ INVALID ADDRESS FILTER
///////////////////////////////////////////////////////////////

bool isInvalidAddress(String address) {
  if (address.trim().isEmpty) return true;
  if (address.contains("Postfach")) return true;
  if (address.contains(", ,")) return true;
  if (address.length < 8) return true;
  return false;
}

///////////////////////////////////////////////////////////////
/// 🔍 MAIN CHECK (IMMER ALLE EVENTS)
///////////////////////////////////////////////////////////////

Future _checkNearbyEvents(Position position) async {
  // 🔥 reset failed addresses alle 2 Minuten
  if (_lastResetTime == null ||
      DateTime.now().difference(_lastResetTime!) > Duration(minutes: 2)) {
    _failedAddresses.clear();
    _lastResetTime = DateTime.now();
  }

  for (String rawAddress in _currentAddresses) {
    try {
      if (_failedAddresses.contains(rawAddress)) continue;

      if (isInvalidAddress(rawAddress)) {
        _failedAddresses.add(rawAddress);
        continue;
      }

      final parts = normalizeAddressParts(rawAddress);

      String streetKey = parts["street"]!;
      String number = parts["number"]!;
      String fullKey = "${streetKey}_$number";

      if (streetKey.contains("marburg") && number.isEmpty) {
        _failedAddresses.add(rawAddress);
        continue;
      }

      Location loc;

      if (_cachedLocations.containsKey(rawAddress)) {
        loc = _cachedLocations[rawAddress]!;
      } else {
        List<Location> locations;

        try {
          locations = await locationFromAddress(rawAddress);
        } catch (e) {
          try {
            locations = await locationFromAddress(streetKey);
          } catch (e) {
            _failedAddresses.add(rawAddress);
            continue;
          }
        }

        if (locations.isEmpty) {
          _failedAddresses.add(rawAddress);
          continue;
        }

        loc = locations.first;
        _cachedLocations[rawAddress] = loc;
      }

      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        loc.latitude,
        loc.longitude,
      );

      if (distance > 20000) continue;

      print("📏 $rawAddress → ${distance.toInt()} m");

      if (distance <= EVENT_RADIUS) {
        if (_notifiedEvents.contains(fullKey)) continue;

        if (_lastNotificationTime.containsKey(fullKey)) {
          if (DateTime.now().difference(_lastNotificationTime[fullKey]!) <
              COOLDOWN) {
            continue;
          }
        }

        _notifiedEvents.add(fullKey);
        _lastNotificationTime[fullKey] = DateTime.now();

        print("🔥 EVENT IN DER NÄHE!");

        await _showNotification(
          "Event in deiner Nähe 🎉",
          "$rawAddress ist nur ${distance.toInt()}m entfernt!",
          fullKey,
        );
      }
    } catch (e) {
      print("❌ Fehler bei $rawAddress → $e");
      _failedAddresses.add(rawAddress);
    }
  }
}

///////////////////////////////////////////////////////////////
/// 🔔 NOTIFICATION
///////////////////////////////////////////////////////////////

Future _showNotification(
  String title,
  String body,
  String eventId,
) async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings iosSettings =
      DarwinInitializationSettings();

  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initSettings,

    // 🔥 DAS IST DER WICHTIGE TEIL
    onDidReceiveNotificationResponse: (response) {
      final payload = response.payload;

      if (payload != null) {
        print("📲 Notification geklickt → $payload");

        // 🔥 HIER SPEICHERN
        FFAppState().selectedEventId = payload;
      }
    },
  );

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'nearby_events',
    'Nearby Events',
    channelDescription: 'Events in deiner Nähe',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title,
    body,
    notificationDetails,
    payload: eventId,
  );
}
