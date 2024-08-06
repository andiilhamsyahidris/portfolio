import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:portfolio/app/app_handler.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  String? _currentAdministrativeArea;
  String? get currentAdministrativeArea => _currentAdministrativeArea;

  String? _currentCountry;
  String? get currentCountry => _currentCountry;

  Future<void> getCurrentUserPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

      _currentAdministrativeArea = '${place.administrativeArea}';
      _currentCountry = '${place.country}';
      rebuildUi();
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
