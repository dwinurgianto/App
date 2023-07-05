// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:food_app/UI/login.dart';
import 'package:food_app/UI/rootpage.dart';
import 'package:food_app/UI/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD2Rkepmjpu0pC9hs-jcsRcz57hajow6Qk",
          appId: "com.example.food_app",
          messagingSenderId:
              "1086677182682-7b0krv4jipu1dulfgqnvhqt9851r2o0j.apps.googleusercontent.com",
          projectId: "food-app-28f7f"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mbah Nonik Recipe",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
