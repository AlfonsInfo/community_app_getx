import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/data/enum_tab.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';

class TabNavigatorController extends GetxController {
  final navIndex = HomeTab.home.index.obs;
  final historyOfTabs = RxList<int>.empty(growable: true);
  DateTime? currentBackPressTime;

  onSelectedNavIndex(value) {
    LoggingUtils.logFunction("Select Nav Index", true);

    bool isNotDuplicateEntry = historyOfTabs.isEmpty || navIndex.value != value;
    if (isNotDuplicateEntry) {
      historyOfTabs.add(navIndex.value);
    }
    navIndex.value = value;
  }

  onTapNavigation(value) {
    LoggingUtils.logFunction("on Tap Navigation", true);
    onSelectedNavIndex(value);
  }

  onWillPopScopeTap(Function snackBar, Function logoutComponent) {
    LoggingUtils.logFunction("on will pop scope", true);
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      //* handling changing index;
      if (historyOfTabs.isNotEmpty) {
        navIndex.value = historyOfTabs.removeLast();
        currentBackPressTime = null;
        return;
      }else{
        snackBar();
        return Future.value(false);
      }
    }

    if(historyOfTabs.isEmpty){
      logoutComponent();
    }
  }


}


extension ArchiveFunction on TabNavigatorController{
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