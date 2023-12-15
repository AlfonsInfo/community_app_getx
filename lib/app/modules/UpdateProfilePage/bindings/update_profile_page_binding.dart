import 'package:get/get.dart';

import '../controllers/update_profile_page_controller.dart';

class UpdateProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfilePageController>(
      () => UpdateProfilePageController(),
    );
  }
}
