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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// 🔔 Plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// 🔥 verhindert doppelte Notifications
final Set<String> _scheduledParkingNotifications = {};

Future checkParkingNotification(
  String parkingId,
  String parkingName,
  String availableSpotsString, // 🔥 STRING
  bool notificationsEnabled,
  int threshold,
  bool isFavorite,
) async {
  tz.initializeTimeZones();

  // 🔴 OFF
  if (!notificationsEnabled) return;

  // 🔴 nur Favoriten
  if (!isFavorite) return;

  // 🔧 STRING → INT (SAFE)
  int availableSpots = -1;

// 🔥 ALLES was keine Zahl ist → als 0 behandeln
  if (availableSpotsString.toLowerCase().contains("geschlossen") ||
      availableSpotsString == "---" ||
      availableSpotsString.isEmpty) {
    availableSpots = 0; // 🔥 wie Swift → voll
  } else {
    try {
      availableSpots = int.parse(
        availableSpotsString.replaceAll(RegExp(r'[^0-9]'), ''),
      );
    } catch (e) {
      print("❌ Parse Fehler → $availableSpotsString");
      return;
    }
  }

  print("🚗 $parkingName → $availableSpots Plätze");

  // 🔥 TEST MODUS (10 Sekunden)
  await Future.delayed(Duration(seconds: 10));

  // 🔥 echte Logik wie Swift
  if (availableSpots < threshold) {
    String notificationId = "parking_$parkingId";

    if (_scheduledParkingNotifications.contains(notificationId)) {
      print("⚠️ Schon gesendet");
      return;
    }

    _scheduledParkingNotifications.add(notificationId);

    await _sendParkingNotification(
      parkingId,
      parkingName,
      availableSpots,
    );
  } else {
    _scheduledParkingNotifications.remove("parking_$parkingId");
  }
}

// 🔔 Notification
Future _sendParkingNotification(
  String parkingId,
  String parkingName,
  int availableSpots,
) async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings iosSettings =
      DarwinInitializationSettings();

  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initSettings);

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'parking_channel',
    'Parking Alerts',
    channelDescription: 'Parkplatz Benachrichtigungen',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    parkingId.hashCode,
    "Wenige Parkplätze verfügbar 🚗",
    "$parkingName: Nur noch $availableSpots freie Plätze",
    now.add(Duration(seconds: 1)),
    notificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );

  print("✅ Notification gesendet für $parkingName");
}
