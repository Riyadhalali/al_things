import 'package:al_things/views/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:al_things/views/home_screen/screen/home_screen.dart';
import 'package:al_things/views/sign_in_screen/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(builder: (controller) {
        return pages[controller.selectIndex];
      }),
      bottomNavigationBar:
          GetBuilder<NavigationController>(builder: (controller) {
        return BottomNavigationBar(
            currentIndex: controller.selectIndex,
            onTap: controller.changeTabIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ]);
      }),
    );
  }
}
