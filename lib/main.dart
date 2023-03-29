import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forecast/constants/colors.dart';
import 'package:forecast/constants/constants.dart';
import 'package:forecast/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRoute = ref.watch(goRouter);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: PalleteColors.yellow,
            ),
            primaryColor: PalleteColors.yellow,
          ),
          routeInformationParser: goRoute.routeInformationParser,
          routerDelegate: goRoute.routerDelegate,
          routeInformationProvider: goRoute.routeInformationProvider,
        );
      },
    );
  }
}
