import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_id.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/app/utils/utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

part 'login_controller_input.dart';
part 'login_controller_validation.dart';

class LoginController extends GetxController implements GetxControllerAbstract {
  RxBool isIndoLanguageToggle = RxBool(true);
  RxBool isEyeToggleHideItem = RxBool(true);

  RxString username = RxString("");
  RxString password = RxString("");

  RxnString errorTextUsername = RxnString();
  RxnString errorTextPassword = RxnString();

  RxBool isEverFocusedUsername = RxBool(false);
  RxBool isEverFocusedPassword = RxBool(false);
  RxBool isValidValueForSubmitted = RxBool(false);

  RxInt countSubmitHit = 0.obs;
  final englishLang = AppLocalizationsEn();
  final indoLang = AppLocalizationsId();
  final isLoading = false.obs;


  @override
  toggleEye(RxBool value) => value.toggle();
  
  checkEverFocusedOnUsername() {
    isEverFocusedUsername.value = true;
  }

  checkEverFocusedOnPassword() {
    isEverFocusedPassword.value = true;
  }

  

  @override
  void onInit() {
    ever(isIndoLanguageToggle, (_) {});
    super.onInit();
  }


  resetState()
  {
    isEyeToggleHideItem.value = true;
    username = "".obs;
    errorTextUsername.value = null;
    password= "".obs;
    errorTextPassword.value = null;
    isEverFocusedUsername.value = false;
    isEverFocusedPassword.value = false;
    isValidValueForSubmitted.value = false;
  }
    
}
