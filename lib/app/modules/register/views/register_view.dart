import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var prefixLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(prefixLocalizations.register),
        centerTitle: true,
      ),
      body: ListView(children: [
        formRegister(prefixLocalizations, context),
      ]),
    );
  }

  Form formRegister(AppLocalizations prefixLocalizations , BuildContext context) {
    return Form(
        child: Center(
      child: Column(
        children: [
          WidgetConstant.spacingBottomX3,
          WidgetConstant.spacingBottomX3,
          inputFullName(prefixLocalizations),
          inputUsername(prefixLocalizations),
          inputEmail(prefixLocalizations),
          inputPassword(prefixLocalizations),
          reInputPassword(prefixLocalizations),
          registerButton(context)
        ],
      ),
    ));
  }

    Widget registerButton(context) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm,
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.login);
              },
              child: Text(AppLocalizations.of(context).register))),
    );
  }

  Padding inputFullName(AppLocalizations prefixLocalizations) {
    return Padding(
          padding: WidgetConstant.edgeInsetForm05,
          child: TextFormField(
            decoration:
                InputDecoration(labelText: prefixLocalizations.full_name),
          ),
        );
  }

  Padding inputUsername(AppLocalizations prefixLocalizations) {
    return Padding(
          padding: WidgetConstant.edgeInsetForm05,
          child: TextFormField(
            decoration:
                InputDecoration(labelText: prefixLocalizations.username),
          ),
        );
  }

  Padding inputEmail(AppLocalizations prefixLocalizations) {
    return Padding(
          padding: WidgetConstant.edgeInsetForm05,
          child: TextFormField(
            decoration: InputDecoration(labelText: prefixLocalizations.email),
          ),
        );
  }

  Obx reInputPassword(AppLocalizations prefixLocalizations) {
    return Obx(
          () => Padding(
            padding: WidgetConstant.edgeInsetForm05,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: prefixLocalizations.reinput_password,
                suffixIcon: controller.isEyeToggleHideItem2.value
                    ? WidgetConstant.eyePassword(FontAwesomeIcons.eye,
                        controller, controller.isEyeToggleHideItem2)
                    : WidgetConstant.eyePassword(FontAwesomeIcons.eyeSlash,
                        controller, controller.isEyeToggleHideItem2),
              ),
            ),
          ),
        );
  }

  Obx inputPassword(AppLocalizations prefixLocalizations) {
    return Obx(
      () => Padding(
        padding: WidgetConstant.edgeInsetForm05,
        child: TextFormField(
            obscureText: controller.isEyeToggleHideItem1.value,
            decoration: InputDecoration(
                labelText: prefixLocalizations.password,
                suffixIcon: controller.isEyeToggleHideItem1.value
                    ? WidgetConstant.eyePassword(FontAwesomeIcons.eye,
                        controller, controller.isEyeToggleHideItem1)
                    : WidgetConstant.eyePassword(FontAwesomeIcons.eyeSlash,
                        controller, controller.isEyeToggleHideItem1))),
      ),
    );
  }
}
