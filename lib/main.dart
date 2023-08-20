import 'package:flutter/material.dart';
import 'package:open_weather/common/provider_manager.dart';
import 'package:open_weather/feature/splash/splash_screen.dart';

void main() {
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Weather',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: SplashScreen(),
        ),
      ),
    );
  }
}
