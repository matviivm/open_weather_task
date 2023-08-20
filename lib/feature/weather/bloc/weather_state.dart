import 'package:open_weather/model/weather_model.dart';

abstract class WeatherState {}

class PermissionDeniedState implements WeatherState {}

class WeatherLoadingState implements WeatherState {}

class WeatherLoadedState implements WeatherState {
  WeatherLoadedState({
    required this.cityName,
    required this.weatherModel,
  });

  final String cityName;
  final WeatherModel weatherModel;
}

class WeatherErrorLoadState implements WeatherState {}
