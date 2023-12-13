import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/data/preference_options.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_id.dart';


class ProfilePageController extends GetxController with StateMixin<UserProfile>{

  RxBool isIndoLanguageToggle = Get.find<MainAppController>().isIndonesianLanguage.value.obs;
  UserService userService = Get.find<MainAppController>().userService;
  

  UserProfile userProfile = UserProfile();
  RxBool isLoadingProfileData = false.obs;

  static final englishLang = AppLocalizationsEn();
  static final indoLang = AppLocalizationsId();

  Rx<PreferenceSaveOption> preferenceSelectedSavingMethod = PreferenceSaveOption().obs;

  var preferencesOption = RxList([
    PreferenceSaveOption(
      label: PreferenceConstant.locally,
      nameIndo:  indoLang.local_preferences,
      nameEng:  englishLang.local_preferences,
      descriptionIndo: "Menambahkan preferensi lokal, preferensi akan berlaku untuk perangkat ini",
      descriptionEng:"Adding local preferences, the preferences will apply to this device"

    ),
    PreferenceSaveOption(
      label: PreferenceConstant.accountBased,
      nameIndo:  indoLang.account_based_preferences,
      nameEng:  englishLang.account_based_preferences,
      descriptionIndo: "Menambahkan preferensi pada akun Anda, preferensi akan berlaku untuk akun ini",
      descriptionEng:"Adding account based preferences, the preferences will apply to this account"
    ),
  ]);
  
  toggleLanguage() {
    isIndoLanguageToggle.toggle();
  }


  @override
  void onInit() {
    fetchProfileData();
    preferenceSelectedSavingMethod.value = preferencesOption[0];
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


  savePreference() async{
    if(preferenceSelectedSavingMethod.value.label == PreferenceConstant.locally){
        var dependency = Get.find<MainAppController>();
        var box = dependency.box;

        var currentCondition = {
          SharedPreferencesKey.localLanguage : isIndoLanguageToggle.value ? InternationalizationConstants.indonesianLocale : InternationalizationConstants.englishLocale,
          SharedPreferencesKey.localTheme: dependency.defaultThemeMode.value.toString(),
          SharedPreferencesKey.themeBySystem: dependency.isThemeModeBySistem.value
        };
        box.write(SharedPreferencesKey.savedPreferencesKey, currentCondition);
    }else{
      //* soon
    }
  }


}
