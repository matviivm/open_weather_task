import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_weather/common/constants/ui_constants.dart';
import 'package:open_weather/feature/weather/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer splashScreenTimer;

  @override
  void initState() {
    splashScreenTimer = Timer(
      UIConstants.splashScreenDuration,
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WeatherScreen(),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.yellow,
            Colors.green,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Open weather',
            textAlign: TextAlign.center,
            style: UIConstants.styleWhite36Bold,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'K',
              style: UIConstants.styleOrange30W500,
              children: <TextSpan>[
                TextSpan(
                  text: 'evych Solutions',
                  style: UIConstants.styleWhite28W500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    splashScreenTimer.cancel();
    super.dispose();
  }
}
