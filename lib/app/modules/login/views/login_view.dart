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

part 'login_component.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final MainAppController mainAppController = Get.put(MainAppController());

  final _formKey = GlobalKey<FormState>();
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

 

}
