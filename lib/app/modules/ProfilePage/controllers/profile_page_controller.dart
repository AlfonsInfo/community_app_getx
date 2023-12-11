import 'package:get/get.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class ProfilePageController extends GetxController {

  RxBool isIndoLanguageToggle = Get.find<MainAppController>().isIndonesianLanguage.value.obs;

  toggleLanguage() {
    isIndoLanguageToggle.toggle();
  }
}
