import 'package:get/get.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => MainAppController(),permanent: true);
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
  }
}
