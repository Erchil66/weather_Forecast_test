import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/src/forecast/forecast_screen.dart';
import 'package:forecast/src/input_cred/input_cred_manual.dart';
import 'package:go_router/go_router.dart';

const String mainPage = "/", startInput = "/";

final goRouter = Provider(
  (ref) => GoRouter(
    initialLocation: mainPage,
    debugLogDiagnostics: true,
    // refreshListenable: ref.read(locationRefresh),
    // redirect: (context, stateCur) {
    //   final stateDup = ref.read(isDuplicate.notifier);
    //   final location = ref.read(locationRefresh);
    //   final states = location.statusAuth == LocationStatus.isAllow;
    //   final getKeyInput = SharedPrefs.read(KeysCred.keyInput);
    //   final currentSubLoc1 = stateCur.subloc == "/$startInput";
    //   final currentSubLoc = stateCur.subloc == "/$mainPage";
    //   if (!states &&
    //       currentSubLoc1 &&
    //       (getKeyInput == "" || getKeyInput == null)) {
    //     return startInput;
    //   }
    //   if (!stateDup.state &&
    //       states &&
    //       (!currentSubLoc || currentSubLoc) &&
    //       (getKeyInput != "" || getKeyInput != null)) {
    //     return "/$mainPage";
    //   }

    //   return null;
    // },
    routes: [
      GoRoute(
        name: mainPage,
        path: mainPage,
        builder: (context, state) {
          return ForecastScreen(
            key: state.pageKey,
          );
        },
      ),
      // GoRoute(
      //   name: startInput,
      //   path: "/$startInput",
      //   builder: (context, state) {
      //     return InputCredManualScreen(
      //       key: state.pageKey,
      //     );
      //   },
      // ),
    ],
  ),
);
