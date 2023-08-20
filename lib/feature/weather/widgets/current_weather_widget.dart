import 'package:flutter/material.dart';
import 'package:open_weather/common/constants/ui_constants.dart';

import '../../../model/current_weather_info_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.currentWeatherInfoModel,
    required this.cityName,
  });

  final CurrentWeatherInfoModel currentWeatherInfoModel;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: UIConstants.space12),
      padding: const EdgeInsets.symmetric(vertical: UIConstants.space12),
      decoration: const BoxDecoration(
        borderRadius: UIConstants.radius24,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            cityName,
            textAlign: TextAlign.center,
            style: UIConstants.styleWhite36Bold,
          ),
          Image.network(
            currentWeatherInfoModel.weatherIconUrl,
            height: UIConstants.space40,
            width: UIConstants.space40,
          ),
          Text(
            'Current: ${currentWeatherInfoModel.currentTemperature}',
            textAlign: TextAlign.center,
            style: UIConstants.styleWhite22Bold,
          ),
          const SizedBox(
            height: UIConstants.space8,
          ),
          Text(
            'Min temp: ${currentWeatherInfoModel.minTemperature}',
            textAlign: TextAlign.center,
            style: UIConstants.styleWhite22Bold,
          ),
          const SizedBox(
            height: UIConstants.space8,
          ),
          Text(
            'Max temp: ${currentWeatherInfoModel.maxTemperature}',
            textAlign: TextAlign.center,
            style: UIConstants.styleWhite22Bold,
          ),
          Text(
            'Humidity: ${currentWeatherInfoModel.humidity}',
            textAlign: TextAlign.center,
            style: UIConstants.styleWhite22Bold,
          )
        ],
      ),
    );
  }
}
