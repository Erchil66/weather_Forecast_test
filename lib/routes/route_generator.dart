import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/src/forecast/forecast_screen.dart';
import 'package:go_router/go_router.dart';

const String mainPage = "/main", startInput = "/";

final goRouter = Provider(
  (ref) => GoRouter(
    initialLocation: mainPage,
    debugLogDiagnostics: true,
    refreshListenable: null,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        name: mainPage,
        path: "/$mainPage",
        builder: (context, state) {
          return ForecastScreen(
            key: state.pageKey,
          );
        },
      ),
    ],
  ),
);
