import 'package:get/get.dart';

import '../controllers/tab_navigator_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabNavigatorController>(
      () => TabNavigatorController(),
    );
  }
}
