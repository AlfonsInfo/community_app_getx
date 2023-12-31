import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/data/preference_options.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import '../controllers/profile_page_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
part 'profile_page_component.dart';
part 'preferences_component.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  ProfilePageView({Key? key}) : super(key: key);
  final MainAppController mainAppController = Get.put(MainAppController());
  final prefixLocalizations = AppLocalizations.of(Get.context!);
  final TextEditingController dropDownPreferencesSavingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isUseCover = true;


    return RefreshIndicator(
      onRefresh: () async{
        controller.fetchProfileData();
      },
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: ListView(children: [
        //* Foto Profil
        profileImageSection(isUseCover, context),
        WidgetConstant.spacingBottomX1,
        emailBottomProfile(),
        WidgetConstant.spacingBottomX3,
        myProfileSection(context),
        WidgetConstant.spacingBottomX3,
        preferences(context),
        WidgetConstant.spacingBottomX3,
        //* Tombol SignOut
        logoutButton(),
      ]),
    );
  }

  Obx emailBottomProfile() {
    return Obx(() => Skeletonizer(
      enabled: controller.isLoadingProfileData.isTrue,
      containersColor: Colors.grey,
      child: Center(child: Text(controller.userProfile.email ?? "email@example.com"))));
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
