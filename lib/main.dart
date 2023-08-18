import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Funiverse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan[400],
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan[400]!,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
