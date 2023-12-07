import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/login_controller.dart';
import 'package:jdlcommunity_getx/app/modules/login/views/slide_show_activity_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final MainAppController mainAppController = Get.put(MainAppController());
  @override
  Widget build(BuildContext context) {
    var prefixLocalizations = controller.appLocalizations.value;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SlideShowActivityImages(),
          const SizedBox(
            height: 20,
          ),
          toggleLanguage(prefixLocalizations!.username,prefixLocalizations,context),
          const SizedBox(
            height: 10,
          ),
          loginForm(prefixLocalizations, context),
          registerButton(prefixLocalizations),
          // const Text("menu slide"),
        ],
      ),
    ));
  }

  Form loginForm(AppLocalizations prefixLocalizations, BuildContext context) {
    return Form(
            child: Column(
          children: [
            Padding(
              padding: WidgetConstant.edgeInsetForm,
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: prefixLocalizations.username)),
            ),
            Padding(
              padding: WidgetConstant.edgeInsetForm,
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: prefixLocalizations.password,
                      suffixIcon: const Icon(FontAwesomeIcons.eyeSlash))),
            ),
            forgotPasswordButton(context),
            loginButton(context),
          ],
        ));
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
                  onPressed: () {}),
            ],
          ),
        );
  }

  Obx toggleLanguage(language,prefixLocalizations,context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Switch(
                onChanged: (bool value) {
                  controller.toggleLanguage();
                  mainAppController.setLanguage(controller.isIndoLanguageToggle);
                  Get.offNamed(Routes.login);
                },
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
    );
  }

  Widget loginButton(context) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm,
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context).login))),
    );
  }

  Padding forgotPasswordButton(context) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppLocalizations.of(context).forgot_password),
        ],
      ),
    );
  }
}
