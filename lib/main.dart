import 'package:flutter/material.dart';

import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.blue,
          useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
