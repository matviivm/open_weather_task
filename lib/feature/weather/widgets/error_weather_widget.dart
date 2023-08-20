import 'package:flutter/material.dart';
import 'package:open_weather/common/constants/ui_constants.dart';

class ErrorWeatherWidget extends StatelessWidget {
  const ErrorWeatherWidget({
    super.key,
    required this.errorText,
  });

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error,
          size: UIConstants.space60,
          color: Colors.red,
        ),
        const SizedBox(
          height: UIConstants.space12,
        ),
        Text(
          errorText,
          style: UIConstants.styleBlack14Bold,
        ),
      ],
    );
  }
}
