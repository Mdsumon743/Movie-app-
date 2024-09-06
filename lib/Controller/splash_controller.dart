import 'dart:async';

import 'package:get/get.dart';
import 'package:movie_app/Screen/bottom_nav_bar.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAll(const BottomNavBar(), transition: Transition.leftToRight);
      },
    );
  }
}
