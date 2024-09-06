import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/Custom%20Widget/custom_text.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    final text = Theme.of(context).colorScheme.onSurface;
    final button = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/anim/load.json', height: 200.h, width: 150.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: 'Movie',
                    color: text,
                    fontWeight: FontWeight.w600,
                    size: 18),
                CustomText(
                    text: 'App',
                    color: button,
                    fontWeight: FontWeight.w600,
                    size: 18),
              ],
            )
          ],
        ),
      ),
    );
  }
}
