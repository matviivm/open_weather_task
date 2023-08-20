import 'package:flutter/material.dart';
import 'package:open_weather/feature/weather/widgets/current_weather_widget.dart';
import 'package:open_weather/feature/weather/widgets/daily_weather_list_widget.dart';

import '../bloc/weather_state.dart';

class WeatherLoadedWidget extends StatelessWidget {
  const WeatherLoadedWidget({
    super.key,
    required this.weatherData,
  });

  final WeatherLoadedState weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CurrentWeatherWidget(
          currentWeatherInfoModel: weatherData.weatherModel.currentWeatherInfo,
          cityName: weatherData.cityName,
        ),
        DailyWeatherListWidget(
          dailyListInfo: weatherData.weatherModel.weeklyWeatherInfo,
        )
      ],
    );
  }
}
