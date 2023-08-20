import 'package:get_it/get_it.dart';
import 'package:open_weather/services/location_service.dart';
import 'package:open_weather/services/network_service.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<LocationService>(() => LocationServiceImpl());
  getIt.registerLazySingleton<NetworkService>(() => HttpNetworkServiceImpl());
}
