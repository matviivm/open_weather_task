import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_weather/model/coordinates_model.dart';

abstract class LocationService {
  Future<bool> isPermissionEnabled();

  Future<bool> requestPermission();

  Future<Coordinates> getCurrentPosition();

  Future<Coordinates?> loadPositionFromAddress(String address);

  Future<String?> loadAddressFromPosition(Coordinates coordinates);
}

class LocationServiceImpl implements LocationService {
  @override
  Future<bool> isPermissionEnabled() async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    final locationStatus = await Geolocator.checkPermission();
    return isLocationServiceEnabled &&
        (locationStatus == LocationPermission.always ||
            locationStatus == LocationPermission.whileInUse);
  }

  @override
  Future<bool> requestPermission() async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return false;
    }
    final locationPermision = await Geolocator.requestPermission();
    return locationPermision == LocationPermission.always ||
        locationPermision == LocationPermission.whileInUse;
  }

  @override
  Future<Coordinates> getCurrentPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return Coordinates(
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude,
    );
  }

  @override
  Future<Coordinates?> loadPositionFromAddress(String address) async {
    final positions = await locationFromAddress(address);
    if (positions.isNotEmpty) {
      final position = positions.first;
      return Coordinates(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    }
    return null;
  }

  @override
  Future<String?> loadAddressFromPosition(Coordinates coordinates) async {
    final address = await placemarkFromCoordinates(
      coordinates.latitude,
      coordinates.longitude,
    );
    if (address.isNotEmpty) {
      return address.first.locality;
    }
    return null;
  }
}
