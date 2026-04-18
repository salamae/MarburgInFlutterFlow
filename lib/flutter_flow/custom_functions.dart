import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatDateDE(String dateString) {
  try {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
    return DateFormat('d. MMMM yyyy', 'de_DE').format(dateTime);
  } catch (e) {
    return null; // Return null if parsing fails
  }
}

String? formatTimeFromString(String timeStr) {
  final pattern = timeStr.trim().split(':').length == 3 ? 'HH:mm:ss' : 'HH:mm';
  final t = DateFormat(pattern).parseStrict(timeStr.trim());
  return DateFormat('HH:mm').format(t); // ohne Sekunden
}

String tomorrowDateString() {
  final now = DateTime.now();
  final tomorrow =
      DateTime(now.year, now.month, now.day).add(const Duration(days: 1));
  return DateFormat('yyyy-MM-dd').format(tomorrow);
}

DateTime startFourWeeksFromNowDT() {
  final now = DateTime.now();

  return DateTime(
    now.year,
    now.month,
    now.day + 28,
    now.hour,
    now.minute,
    now.second,
    now.millisecond,
    now.microsecond,
  );
}

DateTime endOneMonthAfterFourWeeksDT() {
  final start = DateTime.now().add(const Duration(days: 28));

  int year = start.year;
  int month = start.month + 1;
  if (month == 13) {
    month = 1;
    year += 1;
  }

  final lastDay = DateTime(year, month + 1, 0).day;
  final day = math.min(start.day, lastDay);

  return DateTime(year, month, day, start.hour, start.minute, start.second);
}

String nextMonthNameFromDateDE(DateTime selected) {
  final nextMonth = DateTime(selected.year, selected.month + 1, 1);
  return DateFormat('MMMM', 'de_DE').format(nextMonth);
}

String nextFridayYMD() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  // Monday=1 ... Sunday=7
  final weekday = today.weekday;

  int daysUntilFriday = DateTime.friday - weekday;
  if (daysUntilFriday < 0) daysUntilFriday += 7;

  final friday = today.add(Duration(days: daysUntilFriday));
  return DateFormat('yyyy-MM-dd').format(friday);
}

String nextMondayAfterWeekendYMD() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final weekday = today.weekday;

  int daysUntilFriday = DateTime.friday - weekday;
  if (daysUntilFriday < 0) daysUntilFriday += 7;

  final friday = today.add(Duration(days: daysUntilFriday));
  final monday = friday.add(const Duration(days: 3)); // Fr+3 = Mo
  return DateFormat('yyyy-MM-dd').format(monday);
}

List<String>? splitEventCategories(String? input) {
  if (input == null) return [];
  final s = input.trim();
  if (s.isEmpty) return [];

  final parts = <String>[];
  final buf = StringBuffer();
  int parenDepth = 0;

  void flush() {
    final item = buf.toString().trim();
    buf.clear();
    if (item.isNotEmpty) parts.add(item);
  }

  for (int i = 0; i < s.length; i++) {
    final ch = s[i];

    if (ch == '(') {
      parenDepth++;
      buf.write(ch);
      continue;
    }
    if (ch == ')') {
      if (parenDepth > 0) parenDepth--;
      buf.write(ch);
      continue;
    }

    // Split only OUTSIDE parentheses:
    if (parenDepth == 0 && (ch == ',' || ch == '/')) {
      flush();
      continue;
    }

    buf.write(ch);
  }
  flush();

  return parts;
}

bool hasCommonCategories(
  String? a,
  String? b,
) {
  if (a == null || b == null) return false;
  final s1 = a.trim();
  final s2 = b.trim();
  if (s1.isEmpty || s2.isEmpty) return false;

  List<String> splitCats(String input) {
    final parts = <String>[];
    final buf = StringBuffer();
    int parenDepth = 0;

    void flush() {
      final item = buf.toString().trim();
      buf.clear();
      if (item.isNotEmpty) parts.add(item);
    }

    for (int i = 0; i < input.length; i++) {
      final ch = input[i];

      if (ch == '(') {
        parenDepth++;
        buf.write(ch);
        continue;
      }
      if (ch == ')') {
        if (parenDepth > 0) parenDepth--;
        buf.write(ch);
        continue;
      }

      // Split nur AUSSERHALB von Klammern
      if (parenDepth == 0 && (ch == ',' || ch == '/')) {
        flush();
        continue;
      }

      buf.write(ch);
    }
    flush();

    // normalisieren: lower + trim + Mehrfachspaces
    return parts
        .map((e) => e.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  final listA = splitCats(s1);
  final listB = splitCats(s2);
  if (listA.isEmpty || listB.isEmpty) return false;

  final setA = listA.toSet();
  for (final x in listB) {
    if (setA.contains(x)) return true;
  }
  return false;
}

String? stoebernDate(String dateString) {
  try {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
    return DateFormat('EEEE, dd. MMMM', 'de_DE').format(dateTime);
  } catch (e) {
    return null; // Return null if parsing fails
  }
}

String openStatusTextMulti(
  List<String>? timeFromList,
  List<String>? timeToList,
) {
  if (timeFromList == null || timeToList == null) return '';
  final n = timeFromList.length < timeToList.length
      ? timeFromList.length
      : timeToList.length;
  if (n == 0) return '';

  int parseHHmm(String s) {
    final t = s.trim();
    final parts = t.split(':');
    if (parts.length < 2) return 0;
    final h = int.tryParse(parts[0]) ?? 0;
    final m = int.tryParse(parts[1]) ?? 0;
    return h * 100 + m;
  }

  String norm(String s) {
    final t = s.trim();
    final parts = t.split(':');
    if (parts.length >= 2) {
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    }
    return t;
  }

  final now = DateTime.now();
  final currentTime = now.hour * 100 + now.minute;

  // Sammle gültige Slots
  final slots = <({int open, int close, String openStr})>[];
  for (var i = 0; i < n; i++) {
    final from = timeFromList[i].trim();
    final to = timeToList[i].trim();
    if (from.isEmpty || to.isEmpty) continue;

    final open = parseHHmm(from);
    final close = parseHHmm(to);

    // 24h offen
    if (norm(from) == '00:00' && norm(to) == '00:00') {
      return '24 Stunden geöffnet';
    }

    slots.add((open: open, close: close, openStr: from));
  }

  if (slots.isEmpty) return '';

  // 1) Jetzt geöffnet?
  for (final s in slots) {
    // iOS-Logik: kein Overnight-Handling -> open <= now <= close
    if (currentTime >= s.open && currentTime <= s.close) {
      return 'Jetzt geöffnet';
    }
  }

  // 2) Nächste Öffnungszeit heute (kleinste openTime, die noch > currentTime ist)
  int? bestToday;
  String? bestTodayStr;

  for (final s in slots) {
    if (s.open > currentTime) {
      if (bestToday == null || s.open < bestToday) {
        bestToday = s.open;
        bestTodayStr = s.openStr;
      }
    }
  }

  String fmtFromHHmm(int hhmm) {
    final h = hhmm ~/ 100;
    final m = hhmm % 100;
    final dt = DateTime(2000, 1, 1, h, m);
    return DateFormat('HH:mm', 'de_DE').format(dt);
  }

  if (bestToday != null) {
    return 'Öffnet um ${fmtFromHHmm(bestToday)}';
  }

  // 3) Sonst: morgen früheste Öffnungszeit (kleinste openTime)
  slots.sort((a, b) => a.open.compareTo(b.open));
  final first = slots.first.open;
  return 'Öffnet um ${fmtFromHHmm(first)}';
}

bool isOpenNowMulti(
  List<String>? timeFromList,
  List<String>? timeToList,
) {
  if (timeFromList == null || timeToList == null) return false;
  final n = timeFromList.length < timeToList.length
      ? timeFromList.length
      : timeToList.length;
  if (n == 0) return false;

  int parseHHmm(String s) {
    final t = s.trim();
    final parts = t.split(':');
    if (parts.length < 2) return 0;
    final h = int.tryParse(parts[0]) ?? 0;
    final m = int.tryParse(parts[1]) ?? 0;
    return h * 100 + m;
  }

  String norm(String s) {
    final t = s.trim();
    final parts = t.split(':');
    if (parts.length >= 2) {
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
    }
    return t;
  }

  final now = DateTime.now();
  final currentTime = now.hour * 100 + now.minute;

  for (var i = 0; i < n; i++) {
    final from = timeFromList[i].trim();
    final to = timeToList[i].trim();
    if (from.isEmpty || to.isEmpty) continue;

    // 24h offen
    if (norm(from) == '00:00' && norm(to) == '00:00') return true;

    final open = parseHHmm(from);
    final close = parseHHmm(to);

    // iOS: nur "zwischen" (kein Overnight)
    if (currentTime >= open && currentTime <= close) return true;
  }

  return false;
}

DateTime? parseIsoDate(String input) {
  return DateTime.tryParse(input);
}

String htmlToText(String text) {
  return text
      .replaceAll('<br/>', '\n')
      .replaceAll('<br />', '\n')
      .replaceAll('<br>', '\n');
}

List<DateTime> getUniqueEventDates(List<EventsRecord> events) {
  final seen = <String>{};
  final uniqueDates = <DateTime>[];

  for (final event in events) {
    final String dateString = event.date;
    final DateTime date = DateTime.parse(dateString);

    final key = '${date.year}-${date.month}';

    if (!seen.contains(key)) {
      seen.add(key);
      uniqueDates.add(DateTime(date.year, date.month));
    }
  }

  uniqueDates.sort((a, b) => a.compareTo(b));
  return uniqueDates;
}

String? favDate(String dateString) {
  try {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
    return DateFormat('MMMM yyyy', 'de_DE').format(dateTime);
  } catch (e) {
    return null; // Return null if parsing fails
  }
}
