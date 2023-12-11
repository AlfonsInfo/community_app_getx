import 'package:flutter/material.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  
  toggleTheme(ThemeMode themeMode)
  {
    LoggingUtils.logFunction("Toggle Theme", true);
    _themeMode =  themeMode == ThemeMode.dark ? ThemeMode.dark :ThemeMode.light;
    notifyListeners();
    return _themeMode;
  }
}