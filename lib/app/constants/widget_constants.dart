import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
abstract class WidgetConstant {
  static const spacingBottomX1 = SizedBox(
    height: 10,
  );
  static const spacingBottomX2 = SizedBox(
    height: 20,
  );
  static const spacingBottomX3 = SizedBox(
    height: 20,
  );

  //* spacing sizer 
  static final spacing2percent = SizedBox(
    height: 2.h,
  );
  //* spacing sizer 
  static final spacing5percent = SizedBox(
    height: 5.h,
  );

  static spacingCustomable (value){
    return SizedBox(
      height: value,
    );
  }

  static const edgeInsetForm = EdgeInsets.only(left: 40, right: 40, bottom: 20);
  static final edgeInsetForm05 =
      EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.h);

  static IconButton eyePassword(
      IconData icon, GetxControllerAbstract controller, value) {
    return IconButton(
        onPressed: () => controller.toggleEye(value), icon: Icon(icon));
  }

  static SnackBar basicSnackBar(text) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2 ),
    );
  }

  static logoutComponent() {
    return Get.defaultDialog(
      title: AppLocalizations.of(Get.context!).logout_alert_title,
      middleText: AppLocalizations.of(Get.context!).logout_alert_middle,
      textConfirm: AppLocalizations.of(Get.context!).logout_alert_confirm,
      textCancel: AppLocalizations.of(Get.context!).logout_alert_cancel,
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.blue, // Warna latar belakang tombol konfirmasi
      radius: 10.0, // Jari-jari sudut dialog
      onCancel: () {},
      onConfirm: () {
        Get.offAllNamed(Routes.login);
      },
    );
  }
}
