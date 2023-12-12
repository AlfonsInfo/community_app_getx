import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class ProfilePageController extends GetxController with StateMixin<UserProfile>{

  RxBool isIndoLanguageToggle = Get.find<MainAppController>().isIndonesianLanguage.value.obs;
  UserService userService = Get.find<MainAppController>().userService;

  final UserProfile userProfile = UserProfile();
  RxBool isLoadingProfileData = false.obs;
  
  toggleLanguage() {
    isIndoLanguageToggle.toggle();
  }


}
