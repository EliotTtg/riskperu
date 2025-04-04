import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAGj8DOav7ZnOHaj5jSuaAe-WDYNvm9K5M",
            authDomain: "riskperu-6d15a.firebaseapp.com",
            projectId: "riskperu-6d15a",
            storageBucket: "riskperu-6d15a.appspot.com",
            messagingSenderId: "149090537058",
            appId: "1:149090537058:web:a23af23062d923e26dcb3b",
            measurementId: "G-EJNCVLJT59"));
  } else {
    await Firebase.initializeApp();
  }
}
