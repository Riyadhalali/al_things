import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    controller.navigateToHome();
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder(
          init: SplashController(),
          builder: (controller) {
            return Center(
                child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(35.0),
                    image: DecorationImage(
                        image: AssetImage('assets/logo/logo.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                Text(
                  'AL-Things',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                )
              ],
            ));
          }),
    );
  }
}
