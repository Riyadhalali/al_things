import 'package:al_things/views/splash_screen/controller/splash_controller.dart';
import 'package:get/get.dart';

import '../core/class/crud.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(SplashController());
  }
}
