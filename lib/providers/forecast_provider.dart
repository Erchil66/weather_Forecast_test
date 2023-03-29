import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  getPositionCurrent() async {
    final postion = await Permissionlocation.determinePosition();
    log("${postion.latitude}", name: "LATITUDE");
    log("${postion.longitude}", name: "LONGITUDE");
  }
}
