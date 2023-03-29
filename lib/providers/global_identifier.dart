import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/constants/constants.dart';

enum LocationStatus { isAllow, notAllow, blank }

final locationRefresh = ChangeNotifierProvider((ref) => PageRefreshpath());

final isDuplicate = StateProvider<bool>((ref) => false);

class PageRefreshpath extends ChangeNotifier {
  LocationStatus state = LocationStatus.blank;
  LocationStatus get statusAuth => state;
  statusListen() async {
    final which = await Permissionlocation.isAllowLocation();
    if (which == true &&
        (SharedPrefs.read(KeysCred.keyInput) != "" ||
            SharedPrefs.read(KeysCred.keyInput) != null)) {
      state = LocationStatus.isAllow;
      notifyListeners();
    } else {
      state = LocationStatus.notAllow;
      notifyListeners();
    }
  }
}
