import 'package:al_things/binding/initial_binding.dart';
import 'package:al_things/routes.dart';
import 'package:al_things/views/home_screen/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/service/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AL Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.splashScreen,
      getPages: routes,
      initialBinding: InitialBinding(),
    );
  }
}
