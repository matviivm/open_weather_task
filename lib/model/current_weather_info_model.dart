import '../common/constants/api_constants.dart';

class CurrentWeatherInfoModel {
  final String weatherIconUrl;
  final double currentTemperature;
  final num minTemperature;
  final num maxTemperature;
  final int humidity;

  CurrentWeatherInfoModel({
    required this.weatherIconUrl,
    required this.minTemperature,
    required this.maxTemperature,
    required this.currentTemperature,
    required this.humidity,
  });

  factory CurrentWeatherInfoModel.fromJson(Map<String, dynamic> data) {
    final currentTemperature = data['current']['temp'] as double;
    final humidity = data['current']['humidity'] as int;
    final weatherIconUrl = data['current']['weather'][0]['icon'];
    final hourlyWeatherInfo = data['hourly'] as List<dynamic>;
    final hourlyTemperatureInfo = hourlyWeatherInfo
        .map((hourlyInfo) => hourlyInfo['temp'] as num)
        .toList();

    var (minTemperatureValue, maxTemperatureValue) =
        _calculateMinMaxTemperature(hourlyTemperatureInfo);

    return CurrentWeatherInfoModel(
        weatherIconUrl: '${ApiConstants.imageUrl}$weatherIconUrl.png',
        currentTemperature: currentTemperature,
        humidity: humidity,
        maxTemperature: maxTemperatureValue,
        minTemperature: minTemperatureValue);
  }

  static (num, num) _calculateMinMaxTemperature(
      List<num> hourlyTemperature) {
    num minTemparature = hourlyTemperature.first;
    num maxTemperture = hourlyTemperature.first;

    for (var element in hourlyTemperature) {
      if (element > maxTemperture) {
        maxTemperture = element;
      }
      if (element < minTemparature) {
        minTemparature = element;
      }
    }
    return (minTemparature, maxTemperture);
  }
}
