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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> migrateField(
  String collectionName,
  String oldFieldName,
  String newFieldName,
) async {
  // Falls FlutterFlow dir String? gibt, dann:
  // collectionName = collectionName!;
  // oldFieldName = oldFieldName!;
  // newFieldName = newFieldName!;

  final col = FirebaseFirestore.instance.collection(collectionName);
  final snap = await col.get();

  for (final doc in snap.docs) {
    final data = doc.data();

    final oldValue = data[oldFieldName];
    final newValue = data[newFieldName];

    // Nur kopieren, wenn es einen alten Wert gibt
    // und das neue Feld leer / nicht vorhanden ist
    if (oldValue != null &&
        (newValue == null || (newValue is String && newValue.isEmpty))) {
      await doc.reference.update({
        newFieldName: oldValue,
      });
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
