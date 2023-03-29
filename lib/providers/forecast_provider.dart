import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/models/models.dart';
import 'package:forecast/services/call_api.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/constants.dart';

final forecastProvider = ChangeNotifierProvider((ref) => ForecastProvider());

class ForecastProvider extends ChangeNotifier {
  runfirst() async {
    await SharedPrefs.write(KeysCred.keyInput, KeysCred.keyApi);
    /*
     * 
     * Request location
     *
     */
    final ifNotAllow = await Permissionlocation.isAllowLocation();
    if (ifNotAllow == false) {
      await Permissionlocation.getLocationpermission();
      if ((await Permission.location.isGranted)) {
        getPositionCurrent();
      }
    } else {
      getPositionCurrent();
    }
  }

  /*
     * 
     * Get Current position with today forecast
     *
     */

  Forecast todayCast = Forecast();

  getPositionCurrent() async {
    final postion = await Permissionlocation.determinePosition();
    final response = await ServiceWeatherCall.returnKeyLocation(
      lat: postion.latitude,
      long: postion.longitude,
    );

    if (response.key != null) {
      final responseForecast = await ServiceWeatherCall.getTodayForecast(
        locationkey: "${response.key}",
      );
      if (responseForecast.dailyForecasts!.isNotEmpty) {
        todayCast = responseForecast;
        notifyListeners();
      }
    }
  }

  /*
   * 
   * Search Places 
   * 
   */
  List<LocationPlace> searchPlace = <LocationPlace>[];
  searchText({String? text}) {
    Future.delayed(
        const Duration(
          seconds: 1,
        ), () async {
      final response = await ServiceWeatherCall.autoComplete(textSearch: text);
      if (response.isNotEmpty) {
        searchPlace = response;
        notifyListeners();
      }
    });
  }
}
