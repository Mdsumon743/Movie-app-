import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/Controller/tab_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    final text = Theme.of(context).colorScheme.onSurface;
    final button = Theme.of(context).colorScheme.primary;
    final card = Theme.of(context).colorScheme.onPrimary;
    final navController = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(() => navController.page[navController.isTab.value]),
      backgroundColor: background,
      bottomNavigationBar: GNav(
          backgroundColor: card,
          color: text,
          activeColor: button,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          style: GnavStyle.google,
          curve: Curves.linear,
          hoverColor: text.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          haptic: true,
          onTabChange: (value) {
            navController.isTab.value = value;
          },
          rippleColor: text.withOpacity(0.3),
          tabBorderRadius: 30,
          gap: 10,
          tabs: const [
            GButton(
              icon: Icons.home_filled,
              text: ' Home',
            ),
            GButton(
              icon: Icons.tv_outlined,
              text: ' Tv Show',
            ),
            GButton(
              icon: Icons.manage_accounts_rounded,
              text: ' Account',
            ),
          ]),
    );
  }
}
