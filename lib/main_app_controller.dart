

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/l10n/l10n.dart';
class MainAppController extends GetxController{
  RxBool isThemeModeBySistem = RxBool(false);
  RxBool isIndonesianLanguage = RxBool(true);
  final defaultThemeMode = ThemeMode.light.obs;
  UserService userService = UserService();
  GetStorage box = GetStorage();

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