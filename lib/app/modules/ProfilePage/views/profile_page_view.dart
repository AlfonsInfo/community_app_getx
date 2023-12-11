import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/data/user_dummy.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import '../controllers/profile_page_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'profile_page_component.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  ProfilePageView({Key? key}) : super(key: key);
  final MainAppController mainAppController = Get.put(MainAppController());
  final prefixLocalizations = AppLocalizations.of(Get.context!);

  @override
  Widget build(BuildContext context) {
    bool isUseCover = true;
    return ListView(children: [
      //* Foto Profil
      profileImageSection(isUseCover, context),
      WidgetConstant.spacingBottomX1,
      Center(child: Text(DumyData.loginUser.email)),
      WidgetConstant.spacingBottomX3,
      myProfileSection(context),
      WidgetConstant.spacingBottomX3,
      preferences(context),
      WidgetConstant.spacingBottomX3,
      //* Tombol SignOut
      logoutButton()
    ]);
  }

  Padding logoutButton() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(onPressed: (){
        WidgetConstant.logoutComponent();
      }, child: Text(prefixLocalizations.logout)),
    );
  }
}
