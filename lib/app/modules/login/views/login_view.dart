import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/login_controller.dart';
import 'package:jdlcommunity_getx/app/modules/login/views/slide_show_activity_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:developer';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var prefixLocalizations = AppLocalizations.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SlideShowActivityImages(),
          const SizedBox(
            height: 20,
          ),
          toggleLanguage(prefixLocalizations.username),
          const SizedBox(
            height: 10,
          ),
          Form(
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
          )),
          Padding(
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
          ),
          // const Text("menu slide"),
        ],
      ),
    ));
  }

  Obx toggleLanguage(languaget) {
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
                  log(languaget);
                },
                value: controller.isIndoLanguage.value,
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
