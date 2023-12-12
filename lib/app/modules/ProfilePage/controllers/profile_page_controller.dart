import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class ProfilePageController extends GetxController with StateMixin<UserProfile>{

  RxBool isIndoLanguageToggle = Get.find<MainAppController>().isIndonesianLanguage.value.obs;
  UserService userService = Get.find<MainAppController>().userService;

  UserProfile userProfile = UserProfile();
  RxBool isLoadingProfileData = false.obs;
  
  toggleLanguage() {
    isIndoLanguageToggle.toggle();
  }


  @override
  void onInit() {
    fetchProfileData();
    super.onInit();
  }

  fetchProfileData() async{
    try{
      isLoadingProfileData.value = true; 
      userProfile = await userService.currentUser();
      await Future.delayed(const Duration(seconds: 3));
    }catch(e)
    {
      LoggingUtils.logError("fetchProfileData", e.toString());
    }finally{
      isLoadingProfileData.value = false;
    }
  }


}
