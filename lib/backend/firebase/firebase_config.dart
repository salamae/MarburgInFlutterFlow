import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBnwEKKxyHQSxJ-L5Zn7m7jyyO7XFeRE-0",
            authDomain: "marburg-ee870.firebaseapp.com",
            projectId: "marburg-ee870",
            storageBucket: "marburg-ee870.firebasestorage.app",
            messagingSenderId: "975088002770",
            appId: "1:975088002770:web:c6be2b7d94ea87d7d46f0b",
            measurementId: "G-KYTSBGJ8MF"));
  } else {
    await Firebase.initializeApp();
  }
}
