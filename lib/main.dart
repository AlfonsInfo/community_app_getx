import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/l10n/l10n.dart';
import 'package:jdlcommunity_getx/app/constants/app_constants.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/theme_constants.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstInstall = prefs.getBool(SharedPreferencesKey.isFirstInstall) ?? true;

  runApp(MainApp(isFirstInstall: isFirstInstall));
}

class MainApp extends StatelessWidget {
  MainApp({super.key, required this.isFirstInstall});
  final MainAppController controller = Get.put(MainAppController());
  final bool isFirstInstall;
  @override
  Widget build(BuildContext context) {
    return  Obx(
      () => GetMaterialApp(
        title: AppConstant.application,
        //* ROUTING
        initialRoute: isFirstInstall ? AppPages.initial : AppPages.login,
        getPages: AppPages.routes,
        
        //* THEME
        theme: ThemeConstants.lightTheme,
        darkTheme: ThemeConstants.darkTheme,
        themeMode: controller.isThemeModeBySistem.value ? ThemeMode.system : controller.defaultThemeMode.value,
        debugShowCheckedModeBanner: AppConstant.isDebug,
        
        //* INTERNATIONALIZATION
        locale: controller.locale.value, 
        fallbackLocale: const Locale(LocalizationConstant.englishLocale) ,
        localizationsDelegates: LocalizationConstant.localizationsDelegate,
        supportedLocales:LocalizationConstant.supportedLocale,
    
      ),
    );
  }
} 