

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/l10n/l10n.dart';
class MainAppController extends GetxController{
  RxBool isThemeModeBySistem = RxBool(true);
  RxBool isIndonesianLanguage = RxBool(true);
  
  void setLanguage(RxBool language){
    isIndonesianLanguage = language;
    isIndonesianLanguage.listen((value) { 
      updateLocale();
    });
  }

  void updateLocale()
  {
    Get.updateLocale(isIndonesianLanguage.value ?  const Locale(LocalizationConstant.indoLocale) : const Locale(LocalizationConstant.englishLocale));  
  }

  


}