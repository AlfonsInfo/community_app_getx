import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  
  toggleTheme(ThemeMode themeMode)
  {
    _themeMode =  themeMode == ThemeMode.dark ? ThemeMode.dark :ThemeMode.light;
    notifyListeners();
    return _themeMode;
  }
}