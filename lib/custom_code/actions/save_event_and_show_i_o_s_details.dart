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

import 'dart:io' show Platform;

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

DateTime _parseIsoDateAndTime(String date, String time) {
  final d = date.trim();

  // akzeptiert "19:30" oder "19:30:00" oder "19.30 Uhr"
  var t = time.trim().replaceAll('Uhr', '').replaceAll('.', ':').trim();

  final parts = t.split(':');
  final hh = (parts.isNotEmpty ? parts[0] : '00').padLeft(2, '0');
  final mm = (parts.length > 1 ? parts[1] : '00').padLeft(2, '0');
  final ss = (parts.length > 2 ? parts[2] : '00').padLeft(2, '0');

  // WICHTIG: hier muss "$dT..." sein (d + "T"), nicht "$dT" als Variable
  return DateTime.parse('${d}T$hh:$mm:$ss');
}

Future<bool> saveEventAndShowIOSDetails(
  String title,
  String date,
  String time,
  int durationMinutes,
  String description,
  String location,
) async {
  final deviceCalendar = DeviceCalendarPlugin();

  // 1) Permission (triggert iOS Prompt beim ersten Mal)
  final hasPermResult = await deviceCalendar.hasPermissions();
  final hasPerm =
      (hasPermResult?.isSuccess ?? false) && (hasPermResult?.data ?? false);

  if (!hasPerm) {
    final reqResult = await deviceCalendar.requestPermissions();
    final granted =
        (reqResult?.isSuccess ?? false) && (reqResult?.data ?? false);
    if (!granted) return false;
  }

  // 2) Timezone (damit Zeiten korrekt sind)
  tzdata.initializeTimeZones();
  try {
    final localTzName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTzName));
  } catch (_) {
    tz.setLocalLocation(tz.getLocation('UTC'));
  }

  final startDt = _parseIsoDateAndTime(date, time);
  final endDt = startDt.add(Duration(minutes: durationMinutes));
  final tzStart = tz.TZDateTime.from(startDt, tz.local);
  final tzEnd = tz.TZDateTime.from(endDt, tz.local);

  // 3) Kalender wählen (Default + schreibbar)
  final calResult = await deviceCalendar.retrieveCalendars();
  final calendars = calResult?.data;

  if (!(calResult?.isSuccess ?? false) ||
      calendars == null ||
      calendars.isEmpty) {
    return false;
  }

  final Calendar targetCal = calendars.firstWhere(
    (c) => (c.isDefault ?? false) && !((c.isReadOnly ?? false)),
    orElse: () => calendars.firstWhere(
      (c) => !((c.isReadOnly ?? false)),
      orElse: () => calendars.first,
    ),
  );

  final calendarId = targetCal.id;
  if (calendarId == null) return false;

  // 4) Strings säubern (leer => null)
  final cleanTitle = title.trim().isEmpty ? '(Ohne Titel)' : title.trim();
  final desc = description.trim().isEmpty ? null : description.trim();

  // WICHTIG für Map/rote Adresse: gib eine "volle" Adresse als location:
  // "Straße Hausnr, PLZ Stadt, Land"
  final loc = location.trim().isEmpty ? null : location.trim();

  // 5) Event erstellen
  final event = Event(
    calendarId,
    title: cleanTitle,
    description: desc,
    location: loc,
    start: tzStart,
    end: tzEnd,
  );

  final createResult = await deviceCalendar.createOrUpdateEvent(event);
  final eventId = createResult?.data;

  final ok = (createResult?.isSuccess ?? false) &&
      (eventId != null && eventId.isNotEmpty);

  if (!ok) return false;

  // 6) iOS: native Detailansicht anzeigen (NICHT Editor)
  // -> genau der Look wie rechts (EKEventViewController)
  if (Platform.isIOS) {
    await deviceCalendar.showiOSEventModal(eventId!);
  }

  return true;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
