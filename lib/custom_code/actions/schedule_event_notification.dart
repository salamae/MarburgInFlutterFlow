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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// Plugin Instanz
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future scheduleEventNotification(
  String title,
  String body,
  String timeString,
  bool notificationsEnabled,
  int reminderMinutes,
  String eventId,
  bool isFavorite,
) async {
  tz.initializeTimeZones();

  // 🔴 Wenn Switch AUS → alles löschen
  if (!notificationsEnabled) {
    await flutterLocalNotificationsPlugin.cancel(eventId.hashCode);
    print("🔕 Notifications deaktiviert");
    return;
  }

  // 🔴 Wenn Favorit entfernt → löschen
  if (!isFavorite) {
    await flutterLocalNotificationsPlugin.cancel(eventId.hashCode);
    print("❌ Favorit entfernt → Notification gelöscht");
    return;
  }

  // 🔧 STRING → DATETIME (fix für "12:00:00")
  DateTime parsedTime;

  try {
    if (timeString.length <= 8) {
      final now = DateTime.now();

      final parts = timeString.split(":");

      parsedTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
        int.parse(parts[2]),
      );
    } else {
      parsedTime = DateTime.parse(timeString);
    }
  } catch (e) {
    print("❌ Fehler beim Parsen: $e");
    return;
  }

  // 🔴 Reminder Zeit berechnen (30 oder 60 Minuten)
  DateTime reminderTime =
      parsedTime.subtract(Duration(minutes: reminderMinutes));

  // 🔧 Init Settings
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // 🔔 Notification Details
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'event_channel',
    'Event Notifications',
    channelDescription: 'Erinnerungen für Events',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  final tz.TZDateTime scheduledTZTime =
      tz.TZDateTime.from(reminderTime, tz.local);

  // ❗ Vergangenheit verhindern
  if (scheduledTZTime.isBefore(tz.TZDateTime.now(tz.local))) {
    print("⏰ Zeit liegt in der Vergangenheit → keine Notification");
    return;
  }

  // 🔔 Notification planen
  await flutterLocalNotificationsPlugin.zonedSchedule(
    eventId.hashCode,
    title,
    body,
    scheduledTZTime,
    notificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );

  print("✅ Notification geplant für: $scheduledTZTime");
}
