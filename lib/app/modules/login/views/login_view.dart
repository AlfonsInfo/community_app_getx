import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/login_controller.dart';
import 'package:jdlcommunity_getx/app/modules/login/views/slide_show_activity_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';


class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final MainAppController mainAppController = Get.put(MainAppController());

  @override
  Widget build(BuildContext context) {
    var prefixLocalizations = AppLocalizations.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
            const SlideShowActivityImages(),
            WidgetConstant.spacingBottomX2,
            toggleLanguage(prefixLocalizations, context),
            WidgetConstant.spacingBottomX1,
            loginForm(prefixLocalizations, context),
            registerButton(prefixLocalizations),
            bottomMenuView(prefixLocalizations)
          ],
        ));
  }

  Obx toggleLanguage(
      AppLocalizations prefixLocalizations, BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(prefixLocalizations.language),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Switch(
                    onChanged: (bool value) {
                      mainAppController
                          .setLanguage(controller.isIndoLanguageToggle);
                      controller.toggleLanguage();
                    },
                    inactiveThumbColor: Colors.grey,
                    value: controller.isIndoLanguageToggle.value,
                    activeThumbImage: Image.asset(
                      ImageAssetPaths.indonesianFlag,
                      fit: BoxFit.fitHeight,
                    ).image,
                    inactiveThumbImage: Image.asset(
                      ImageAssetPaths.englishFlag,
                      fit: BoxFit.fitHeight,
                    ).image,
                    // activeColor: Colors.red,
                    // inactiveThumbColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginForm(AppLocalizations prefixLocalizations, BuildContext context) {
    return Form(
      child: Column(
        children: [
          Obx(
            () => Padding(
              padding: WidgetConstant.edgeInsetForm05,
              child: TextFormField(
                  onChanged: (value) => controller.usernameChanged(value),
                  onTap: () {
                    controller.checkEverFocusedOnUsername();
                  },
                  decoration: InputDecoration(
                      labelText: prefixLocalizations.username,
                      errorText: controller.errorTextUsername.value)),
            ),
          ),
          Obx(
            () => Padding(
              padding: WidgetConstant.edgeInsetForm05,
              child: TextFormField(
                  onChanged: (value) => controller.passwordChanged(value),
                  onTap: () {
                    controller.checkEverFocusedOnPassword();
                  },
                  obscureText: controller.isEyeToggleHideItem.value,
                  decoration: InputDecoration(
                      errorText: controller.errorTextPassword.value,
                      labelText: prefixLocalizations.password,
                      suffixIcon: controller.isEyeToggleHideItem.value
                          ? WidgetConstant.eyePassword(FontAwesomeIcons.eye,
                              controller, controller.isEyeToggleHideItem)
                          : WidgetConstant.eyePassword(
                              FontAwesomeIcons.eyeSlash,
                              controller,
                              controller.isEyeToggleHideItem))),
            ),
          ),
          forgotPasswordButton(context),
          loginButton(context),
        ],
      ),
    );
  }

  Padding forgotPasswordButton(context) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              child: Text(AppLocalizations.of(context).forgot_password),
              onPressed: () => Get.to("")),
        ],
      ),
    );
  }

  Padding registerButton(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(prefixLocalizations.donthaveaccount),
          TextButton(
              child: Text(prefixLocalizations.register),
              onPressed: () {
                Get.toNamed(Routes.register);
              }),
        ],
      ),
    );
  }

  Widget loginButton(context) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm,
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: ()  => controller.submitFunction(),
              child: Text(AppLocalizations.of(context).login))),
    );
  }

  SingleChildScrollView bottomMenuView(AppLocalizations prefixLocalizations) {
    List<Map<String, dynamic>> bottomItem = List.of([
      {
        "title": prefixLocalizations.about_jdlc,
        "logo": FontAwesomeIcons.circleInfo
      },
      {
        "title": prefixLocalizations.biometric,
        "logo": FontAwesomeIcons.fingerprint
      },
      {
        "title": prefixLocalizations.contact_us,
        "logo": FontAwesomeIcons.addressBook
      },
      {
        "title": prefixLocalizations.terms_condition,
        "logo": FontAwesomeIcons.imagePortrait
      },
    ]);

    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 120, // <-- you should put some value here
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bottomItem.length,
              itemBuilder: (context, index) =>
                  bottomItemWidget(bottomItem, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomItemWidget(List<Map<String, dynamic>> bottomItem, int index) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(bottomItem[index]['logo']),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(bottomItem[index]['title']),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
