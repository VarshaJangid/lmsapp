import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/ui/splash/splash_screen.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA4bN9ZLXHkEw36wDDid0Gxxh5dPqwG",
        // authDomain: "lmsa-4dfbb.firebaseapp.com",
        projectId: 'lmsa-4dfbb',
        storageBucket: "lmsa-4dfbb.appspot.com",
        messagingSenderId: "901323277270",
        appId: '1:901323277270:android:ddef35339cda39ddbf9a77',
        // measurementId: "G-94RQHTWT50",
      ),
    );
  }
  await FirebaseAppCheck.instance.activate();
  FlutterError.onError = (FlutterErrorDetails details) {
    // if (isInDebugMode) {
    // } else {}
  };

  runZoned<Future<void>>(() async {
    timeDilation = 1.0;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    runApp(const MyApp());
  }, onError: (error, stackTrace) async {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'LMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: true,
      home: const SplashScreen(),
    );
  }
}
