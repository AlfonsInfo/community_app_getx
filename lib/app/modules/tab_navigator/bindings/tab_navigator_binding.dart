import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/ProfilePage/controllers/profile_page_controller.dart';

import '../controllers/tab_navigator_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabNavigatorController>(
      () => TabNavigatorController(),
    );
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
  }
}
