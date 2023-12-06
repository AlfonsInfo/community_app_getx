import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
abstract class LocalizationConstant{
  
  static const localizationsDelegate = [ 
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
  ];
  static const englishLocale = 'en';
  static const indoLocale = 'id';

  static const supportedLocale = [
        Locale(LocalizationConstant.englishLocale),
        Locale(LocalizationConstant.indoLocale),
  ];
}