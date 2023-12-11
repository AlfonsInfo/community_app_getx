import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/modules/HomePage/views/home_page_view.dart';
import 'package:jdlcommunity_getx/app/modules/MenuPage/views/menu_page_view.dart';
import 'package:jdlcommunity_getx/app/modules/ProfilePage/views/profile_page_view.dart';
import '../controllers/tab_navigator_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'tab_navigator_component.dart';

class TabNavigatorView extends GetView<TabNavigatorController> {
  const TabNavigatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Obx(() => WillPopScope(
      onWillPop: () => controller.onWillPopScopeTap(snackBarInstructionForLogout,WidgetConstant.logoutComponent) ,
      child: bodyView[controller.navIndex.value])),
    bottomNavigationBar: Obx(() => homeNavbar()),
    );
  }
}
