import 'package:flutter/material.dart';
import 'package:jdlcommunity_getx/app/utils/theme_manager.dart';


const primaryColor = Colors.blue;
const secondaryColor =  Colors.green;

abstract class ThemeConstants {
  static  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
  ); 

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch:Colors.teal 
  );

  static ThemeManager themeManager = ThemeManager();
}