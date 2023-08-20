import 'package:open_weather/model/current_weather_info_model.dart';
import 'package:open_weather/model/daily_weather_info_model.dart';

class WeatherModel {
  final CurrentWeatherInfoModel currentWeatherInfo;
  final List<DailyWeatherInfoModel> weeklyWeatherInfo;

  WeatherModel({
    required this.weeklyWeatherInfo,
    required this.currentWeatherInfo,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final dailyWeatherInfo = data['daily'] as List<dynamic>?;
    return WeatherModel(
        currentWeatherInfo: CurrentWeatherInfoModel.fromJson(data),
        weeklyWeatherInfo: dailyWeatherInfo != null
            ? dailyWeatherInfo
                .map((data) => DailyWeatherInfoModel.fromJson(data))
                .toList()
            : <DailyWeatherInfoModel>[]);
  }
}
