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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// 🔔 Notification Plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// 🔥 GLOBALS
StreamSubscription<Position>? _positionStream;
final Set<String> _notifiedEvents = {};
final Map<String, DateTime> _lastNotificationTime = {};
final Map<String, Location> _cachedLocations = {}; // 🔥 wichtig!

// 📏 Radius (JETZT 300M)
const double EVENT_RADIUS = 300;

// ⏱ Cooldown
const Duration COOLDOWN = Duration(minutes: 30);

/// 🚀 START TRACKING
Future startLocationTracking(
  bool trackingEnabled,
  List<String> eventAddresses, // 🔥 ALLE EVENTS HIER
) async {
  print("🚀 Tracking gestartet");

  if (!trackingEnabled) {
    await stopLocationTracking();
    print("🔕 Tracking AUS");
    return;
  }

  // ❗ verhindert mehrfaches Starten
  if (_positionStream != null) {
    print("⚠️ Tracking läuft bereits");
    return;
  }

  tz.initializeTimeZones();

  LocationPermission permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.whileInUse) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    print("❌ Keine Location Permission");
    return;
  }

  _positionStream = Geolocator.getPositionStream(
    locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high, // 🔥 besser für Akku
      distanceFilter: 50, // 🔥 weniger Updates
    ),
  ).listen((Position position) async {
    print("📍 Position: ${position.latitude}, ${position.longitude}");

    await _checkNearbyEvents(position, eventAddresses);
  });
}

/// 🛑 STOP TRACKING
Future stopLocationTracking() async {
  await _positionStream?.cancel();
  _positionStream = null;
  print("🛑 Tracking gestoppt");
}

/// 🔍 EVENTS CHECK
Future _checkNearbyEvents(
    Position position, List<String> eventAddresses) async {
  for (String address in eventAddresses) {
    try {
      Location loc;

      // 🔥 CACHE verwenden (sehr wichtig!)
      if (_cachedLocations.containsKey(address)) {
        loc = _cachedLocations[address]!;
      } else {
        List<Location> locations = await locationFromAddress(address);
        if (locations.isEmpty) continue;

        loc = locations.first;
        _cachedLocations[address] = loc;
      }

      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        loc.latitude,
        loc.longitude,
      );

      print("📏 $address → ${distance.toInt()} m");

      // 🔥 nur wenn < 300m
      if (distance <= EVENT_RADIUS) {
        // ❌ schon benachrichtigt
        if (_notifiedEvents.contains(address)) {
          continue;
        }

        // ⏱ Cooldown
        if (_lastNotificationTime.containsKey(address)) {
          DateTime lastTime = _lastNotificationTime[address]!;

          if (DateTime.now().difference(lastTime) < COOLDOWN) {
            continue;
          }
        }

        _notifiedEvents.add(address);
        _lastNotificationTime[address] = DateTime.now();

        print("🔥 EVENT IN DER NÄHE!");

        await _showNotification(
          "Event in deiner Nähe 🎉",
          "$address ist nur ${distance.toInt()}m entfernt!",
        );
      }
    } catch (e) {
      print("❌ Fehler bei $address → $e");
    }
  }
}

/// 🔔 NOTIFICATION
Future _showNotification(String title, String body) async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings iosSettings =
      DarwinInitializationSettings();

  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initSettings);

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'nearby_events',
    'Nearby Events',
    description: 'Events in deiner Nähe',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'nearby_events',
    'Nearby Events',
    channelDescription: 'Events in deiner Nähe',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  final tz.TZDateTime now = tz.TZDateTime.from(DateTime.now(), tz.local);

  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecondsSinceEpoch ~/ 1000,
    title,
    body,
    notificationDetails,
  );
}
