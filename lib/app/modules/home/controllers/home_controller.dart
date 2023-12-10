import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/data/enum_tab.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';

class HomeController extends GetxController {
  final navIndex = HomeTab.home.index.obs;
  final historyOfTabs = RxList<int>.empty(growable: true);
  final isFirstLogin = true.obs;
  DateTime? currentBackPressTime;

  onSelectedNavIndex(value) {
    LoggingUtils.logFunction("Select Nav Index", true);

    bool isNotDuplicateEntry = historyOfTabs.isEmpty || navIndex.value != value;
    if (isNotDuplicateEntry) {
      historyOfTabs.add(navIndex.value);
    }

    navIndex.value = value;

    LoggingUtils.logDebugValue(historyOfTabs.toString(), "history");
    LoggingUtils.logDebugValue(historyOfTabs.toString(), "history");

    LoggingUtils.logDebugValue(navIndex.value.toString(), "current index");
  }

  onTapNavigation(value) {
    LoggingUtils.logFunction("on Tap Navigation", true);
    onSelectedNavIndex(value);
    isFirstLogin.value = false;
    Get.toNamed(Routes.home);
  }

  onWillPopScopeTap(logoutComponent) {
    LoggingUtils.logFunction("on will pop scope", true);
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      //* handling changing index;
      if (historyOfTabs.isNotEmpty) {
        navIndex.value = historyOfTabs.removeLast();
        LoggingUtils.logDebugValue(navIndex.value.toString(), "current index");
        LoggingUtils.logDebugValue(historyOfTabs.toString(), "history tab");
        return;
      }
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(WidgetConstant.basicSnackBar("double tap for logout"));
      return Future.value(false);
    }

    if(historyOfTabs.isEmpty){
      logoutComponent;
    }

    // if (isFirstLogin.value == false && historyOfTabs.isEmpty) {
    //   Get.back();
    // }

  }

  Future<bool> doubleTapForLogout() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(WidgetConstant.basicSnackBar("TEST"));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
