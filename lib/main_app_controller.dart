

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/l10n/l10n.dart';
class MainAppController extends GetxController{
  RxBool isThemeModeBySistem = RxBool(true);
  RxBool isIndonesianLanguage = RxBool(true);

  void setLanguage(RxBool language){
    isIndonesianLanguage = language;
    isIndonesianLanguage.listen((value) { 
      updateLocale(value);
    });
  }

  void updateLocale(value)
  {
    LoggingUtils.logDebugValue(value ? InternationalizationConstants.english : InternationalizationConstants.indonesian , "Function updateLocale()");
    Get.updateLocale(value ?  const Locale(LocalizationConstant.indoLocale) : const Locale(LocalizationConstant.englishLocale));  
  }

  


}