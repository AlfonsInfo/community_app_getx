import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/slide_show_controller.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut(() => MainAppController());
    Get.lazyPut(() => SlideShowController());
  }
}
