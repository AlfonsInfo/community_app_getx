import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_id.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';

// import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
class LoginController extends GetxController implements GetxControllerAbstract {
  RxBool isIndoLanguageToggle = RxBool(true);
  RxBool isEyeToggleHideItem = RxBool(true);
  RxInt firstChanges = 1.obs;

  RxString username = RxString("");
  RxnString errorTextUsername = RxnString();

  RxString password = RxString("");
  RxnString errorTextPassword = RxnString();
  final formKey = GlobalKey<FormState>().obs;

  RxBool isEverFocusedUsername = RxBool(false);
  RxBool isEverFocusedPassword = RxBool(false);

  final englishLang = AppLocalizationsEn();
  final indoLang = AppLocalizationsId();

  usernameChanged(value) {
    username.value = value;
    validateUsername();
  }

  passwordChanged(value) {
    password.value = value;
    validatePassword();
  }

  toggleLanguage() {
    isIndoLanguageToggle.toggle();
    if (isEverFocusedUsername.value || isEverFocusedPassword.value) {
      validateUsername();
      validatePassword();
    }
  }

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

  validateUsername({BuildContext? context}) {
    Locale currentLocale = Get.locale!;
    if (CommonConditions.validateNotEmptyAndNotContainSpace(username.value)) {
      errorTextUsername.value = isEnglish(currentLocale)
          ? englishLang.empty_validate(englishLang.username)
          : indoLang.empty_validate(indoLang.username);
    } else {
      errorTextUsername.value = null;
    }
  }

  bool isEnglish(Locale currentLocale) => currentLocale.toString() == "en";

  validatePassword({BuildContext? context}) {
    Locale currentLocale = Get.locale!;
    if (CommonConditions.validateNotEmptyAndNotContainSpace(password.value)) {
      errorTextPassword.value = isEnglish(currentLocale)
          ? englishLang.empty_validate(englishLang.password)
          : indoLang.empty_validate(indoLang.password);
      return;
    } else {
      errorTextPassword.value = null;
    }

    if (password.value.length < 5) {
      errorTextPassword.value = isEnglish(currentLocale)
          ? englishLang.minimum_length(englishLang.password, 5)
          : indoLang.minimum_length(indoLang.password, 5);

      return;
    } else {
      errorTextPassword.value = null;
    }
  }

  Future<bool> Function() submitFunction() {
    LoggingUtils.logStartFunction("SubmitFunction");
    return () async {
      await Future.delayed(const Duration(seconds: 0), () {
        validateUsername();
        validatePassword();
        if (errorTextUsername.value == null &&
            errorTextPassword.value == null) {
          Get.toNamed(Routes.home);
        }
      });
      return true;
    };
  }
}
