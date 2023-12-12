import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class ProfilePageController extends GetxController {

  RxBool isIndoLanguageToggle = Get.find<MainAppController>().isIndonesianLanguage.value.obs;
  UserService userService = Get.find<MainAppController>().userService;

  Rx<UserProfile?> userProfile = null.obs;  
  
  @override
  onInit() async
  {
    userProfile.value = await userService.currentUser();
    super.onInit();
  }

  toggleLanguage() {
    isIndoLanguageToggle.toggle();
  }


}
