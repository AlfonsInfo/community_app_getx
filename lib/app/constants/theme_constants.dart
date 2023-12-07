import 'package:flutter/material.dart';
import 'package:jdlcommunity_getx/app/utils/theme_manager.dart';


const primaryColor = Colors.blue;
const secondaryColor =  Colors.green;

const hexPrefix = "0xFF";
final colorBlueDark = Color(parseSuffixColor("304C89"));
final colorBlueMedium = Color(parseSuffixColor("648DE5"));
final colorBlueLow = Color(parseSuffixColor("9EB7E5"));


const MaterialColor colorBlueLowMaterial =  MaterialColor(
  0xFF9EB7E5,
  <int, Color>{
    50: Color(0xFF9EB7E5),
    100: Color(0xFF9EB7E5),
    200: Color(0xFF9EB7E5),
    300: Color(0xFF9EB7E5),
    400: Color(0xFF9EB7E5),
    500: Color(0xFF9EB7E5),
    600: Color(0xFF9EB7E5),
    700: Color(0xFF9EB7E5),
    800: Color(0xFF9EB7E5),
    900: Color(0xFF9EB7E5),
  },
);


abstract class ThemeConstants {

  static ColorScheme colorSchemeLight = ColorScheme(
    brightness: Brightness.light, 
    primary: colorBlueDark, 
    onPrimary: Colors.white, 
    secondary: colorBlueLow, onSecondary: Colors.blueAccent, 
    error: Colors.red, 
    onError: Colors.white, 
    background: colorBlueLow, 
    onBackground: Colors.black, 
    surface: Colors.black, 
    onSurface: Colors.white);

  static  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: colorBlueLowMaterial,
    colorScheme: colorSchemeLight,
    iconTheme: IconThemeData(
      color: colorBlueDark
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorBlueDark)
      )
    )
  ); 

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch:Colors.blueGrey,
  );

  static ThemeManager themeManager = ThemeManager();
}


int parseSuffixColor(suffix) => int.parse(hexPrefix+suffix);
