

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/login_controller.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/l10n/l10n.dart';
class MainAppController extends GetxController{
  RxBool isThemeModeBySistem = RxBool(true);
  RxBool isIndonesianLanguage = RxBool(true);
  final defaultThemeMode = ThemeMode.light.obs;
  UserService userService = UserService();
  GetStorage box = GetStorage();
  var locale = const Locale(LocalizationConstant.indoLocale).obs;

  Map<String,String> headers = {};

  @override
  onInit() async{
    await GetStorage.init();
  var data = box.read(SharedPreferencesKey.savedPreferencesKey);
  if(data is Map){
    var localeCode = data[SharedPreferencesKey.localLanguage];
    locale.value = Locale(localeCode);
    isIndonesianLanguage.value = localeCode == LocalizationConstant.indoLocale ? true : false;
    Get.find<LoginController>().isIndoLanguageToggle.value = localeCode == LocalizationConstant.indoLocale ? true : false;      
    Get.updateLocale(locale.value);
    setThemeModeBySystem(data);
    setThemeMode(data);
  }
  super.onInit();
  }

  void setThemeModeBySystem(Map<dynamic, dynamic> data) {
    var themeBySystem = data[SharedPreferencesKey.themeBySystem];
    isThemeModeBySistem.value = themeBySystem ;
  }

  void setThemeMode(Map<dynamic, dynamic> data) {
       var themeString = data[SharedPreferencesKey.localTheme];
    if(themeString == ThemeMode.dark.toString()){
      defaultThemeMode.value = ThemeMode.dark;
    }else if(themeString == ThemeMode.light.toString()){
      defaultThemeMode.value = ThemeMode.light;
    }else{
      defaultThemeMode.value = ThemeMode.system;
    }
  }

  toggleThemeMode()
  {
    isThemeModeBySistem.value = false;
    if(defaultThemeMode.value == ThemeMode.light){
      defaultThemeMode.value = ThemeMode.dark;
    }else{
      defaultThemeMode.value = ThemeMode.light;
    }
  }
  void setLanguage(RxBool language){
    isIndonesianLanguage = language;
    isIndonesianLanguage.listen((value) { 
      updateLocale(value);
    });
  }

  getLanguage (){
    return isIndonesianLanguage.value;
  }

  void updateLocale(value)
  {
    LoggingUtils.logDebugValue(value ? InternationalizationConstants.english : InternationalizationConstants.indonesian , "Function updateLocale()");
    Get.updateLocale(value ?  const Locale(LocalizationConstant.indoLocale) : const Locale(LocalizationConstant.englishLocale));  
  }

  


}