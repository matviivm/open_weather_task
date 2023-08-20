import 'package:open_weather/common/provider_manager.dart';
import 'package:open_weather/feature/weather/bloc/weather_state.dart';
import 'package:open_weather/services/location_service.dart';
import 'package:open_weather/services/network_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class WeatherBloc {
  Stream<WeatherState?> get currentState;

  Future<void> loadWeatherByAddres(String address);
}

class WeatherBlocImpl implements WeatherBloc {
  WeatherBlocImpl() {
    _init();
  }

  final NetworkService networkService = getIt<NetworkService>();
  final LocationService locationService = getIt<LocationService>();
  final BehaviorSubject<WeatherState?> _currentState = BehaviorSubject();

  Future<void> _init() async {
    final isPermissionEnabled = await locationService.isPermissionEnabled();
    if (!isPermissionEnabled) {
      final requestRermission = await locationService.requestPermission();
      if (requestRermission) {
        await _loadWeatherByPosition();
      } else {
        _currentState.add(PermissionDeniedState());
      }
    } else {
      await _loadWeatherByPosition();
    }
  }

  Future<void> _loadWeatherByPosition() async {
    try {
      _currentState.add(WeatherLoadingState());
      final currentPosition = await locationService.getCurrentPosition();
      final cityName =
          await locationService.loadAddressFromPosition(currentPosition);
      final weatherInfo = await networkService.getWeatherInfo(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      weatherInfo != null
          ? _currentState.add(
              WeatherLoadedState(
                cityName: cityName ?? '',
                weatherModel: weatherInfo,
              ),
            )
          : WeatherErrorLoadState();
    } catch (_) {
      _currentState.add(WeatherErrorLoadState());
    }
  }

  @override
  Stream<WeatherState?> get currentState => _currentState;

  @override
  Future<void> loadWeatherByAddres(String address) async {
    try {
      _currentState.add(WeatherLoadingState());
      final coordinatesFromAdress =
          await locationService.loadPositionFromAddress(address);
      if (coordinatesFromAdress != null) {
        final weatherInfo = await networkService.getWeatherInfo(
          coordinatesFromAdress.latitude,
          coordinatesFromAdress.longitude,
        );
        weatherInfo != null
            ? _currentState.add(WeatherLoadedState(
                cityName: address,
                weatherModel: weatherInfo,
              ))
            : WeatherErrorLoadState();
      } else {
        _currentState.add(WeatherErrorLoadState());
      }
    } catch (_) {
      _currentState.add(WeatherErrorLoadState());
    }
  }
}
