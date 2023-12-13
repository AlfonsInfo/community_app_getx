import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/data/preference_options.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfilePageController extends GetxController with StateMixin<UserProfile>{

  RxBool isIndoLanguageToggle = Get.find<MainAppController>().isIndonesianLanguage.value.obs;
  UserService userService = Get.find<MainAppController>().userService;
  

  UserProfile userProfile = UserProfile();
  RxBool isLoadingProfileData = false.obs;

  Rx<PreferenceSaveOption> locally =   PreferenceSaveOption(
    label: 'locally',
    name:  AppLocalizations.of(Get.context!).local_preferences,
    description: ""
  ).obs;

  Rx<PreferenceSaveOption> accountbased =     PreferenceSaveOption(
    label: 'accountbased',
    name:  AppLocalizations.of(Get.context!).account_based_preferences,
    description: ""
  ).obs;

  var preferencesOption = RxList([
  PreferenceSaveOption(
    label: 'locally',
    name:  AppLocalizations.of(Get.context!).local_preferences,
    description: ""
  ),
  PreferenceSaveOption(
    label: 'accountbased',
    name:  AppLocalizations.of(Get.context!).account_based_preferences,
    description: ""
  ),
]);
  
  toggleLanguage() {
    isIndoLanguageToggle.toggle();
    locally.refresh();
    accountbased.refresh();
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
