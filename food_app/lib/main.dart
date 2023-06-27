// ignore_for_file: unused_import

import "package:flutter/material.dart";
import 'package:food_app/UI/splash.dart';
import 'package:food_app/UI/rootpage.dart';
import 'package:food_app/UI/splash.dart';


void main() {
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
