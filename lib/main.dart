import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Controller/splash_controller.dart';
import 'package:movie_app/Screen/splash.dart';
import 'package:movie_app/Theme/theme.dart';

void main() {
  SplashController().onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Movie App',
        theme: ThemeProperties().lightTheme,
        darkTheme: ThemeProperties().darkTheme,
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
