import 'package:open_weather/common/constants/api_constants.dart';
import 'package:open_weather/model/weather_model.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

abstract class NetworkService {
  Future<WeatherModel?> getWeatherInfo(
    double latitude,
    double longtitude,
  );
}

class HttpNetworkServiceImpl implements NetworkService {
  @override
  Future<WeatherModel?> getWeatherInfo(
    double latitude,
    double longtitude,
  ) async {
    const apiKey = String.fromEnvironment(ApiConstants.apiKey);
    String url =
        '${ApiConstants.baseUrl}?lat=$latitude&lon=$longtitude&appid=$apiKey&units=metric';

  

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return WeatherModel.fromJson(jsonResponse);
    }
    return null;
  }
}
