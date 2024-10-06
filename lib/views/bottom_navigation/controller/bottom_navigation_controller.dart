import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectIndex = 0;

  void changeTabIndex(int index) {
    selectIndex = index;
    update();
  }
}
