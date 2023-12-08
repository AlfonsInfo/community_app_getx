
import 'package:flutter/material.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';

class Utils{

  static bool isEnglish(Locale currentLocale) => currentLocale.toString() == InternationalizationConstants.englishLocale;
  static bool isIndonesian(Locale currentLocale) => currentLocale.toString() == InternationalizationConstants.indonesianLocale;

}