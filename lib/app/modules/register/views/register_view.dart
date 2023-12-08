import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
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
          inputFullName(prefixLocalizations,context),
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
              onPressed: () => controller.onRegisterPressed(),
              child: Text(AppLocalizations.of(context).register))),
    );
  }

  Widget inputFullName(AppLocalizations prefixLocalizations, BuildContext context) {
    return Obx(
      () => Padding(
            padding: WidgetConstant.edgeInsetForm05,
            child: TextFormField(
              onChanged: (value) => controller.fullNameChanged(value),
              decoration:InputDecoration(
                labelText: prefixLocalizations.full_name,
                errorText: controller.errorFullName.value
                ),
            ),
          ),
    );
  }

  Widget inputUsername(AppLocalizations prefixLocalizations) {
    return Obx(
      () => Padding(
            padding: WidgetConstant.edgeInsetForm05,
            child: TextFormField(
              onChanged: (value) => controller.usernameChanged(value),
              decoration:
                  InputDecoration(
                    labelText: prefixLocalizations.username,
                    errorText: controller.errorUsername.value
                    ),
            ),
          ),
    );
  }

  Widget inputEmail(AppLocalizations prefixLocalizations) {
    return Obx(
      () =>  Padding(
            padding: WidgetConstant.edgeInsetForm05,
            child: TextFormField(
            onChanged: (value) => controller.emailChanged(value),
              decoration: InputDecoration(
                labelText: prefixLocalizations.email,
                errorText: controller.errorEmail.value
                ),
            ),
          ),
    );
  }

  Obx reInputPassword(AppLocalizations prefixLocalizations) {
    return Obx(
          () => Padding(
            padding: WidgetConstant.edgeInsetForm05,
            child: TextFormField(
            obscureText: controller.isEyeToggleHideItem2.value,
              onChanged: (value) => controller.reinputPasswordChanged(value),

              decoration: InputDecoration(
                errorText: controller.errorReInputPassword.value,
                errorMaxLines: 2,
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
            onChanged: (value) => controller.passwordChanged(value),
            decoration: InputDecoration(
                errorMaxLines: 2,
                errorText: controller.errorPassword.value,
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
