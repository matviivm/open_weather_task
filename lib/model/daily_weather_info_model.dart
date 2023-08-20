import 'package:open_weather/common/constants/api_constants.dart';

class DailyWeatherInfoModel {
  final DateTime date;
  final num minTemperature;
  final num maxTemperature;
  final num humidity;
  final String iconUrl;

  DailyWeatherInfoModel({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    required this.iconUrl,
  });

  factory DailyWeatherInfoModel.fromJson(Map<String, dynamic> data) {
    final date = data['dt'] as int;
    final maxTemperature = data['temp']['max'] as num;
    final minTemperature = data['temp']['min'] as num;
    final humidity = data['humidity'] as num;
    final iconUrl = data['weather'][0]['icon'] as String;
    return DailyWeatherInfoModel(
        date: DateTime.fromMillisecondsSinceEpoch(date * 1000),
        maxTemperature: maxTemperature,
        minTemperature: minTemperature,
        humidity: humidity,
        iconUrl: '${ApiConstants.imageUrl}$iconUrl.png');
  }
}
