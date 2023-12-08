part of 'register_controller.dart';

extension RegisControllerValidation on RegisterController {
  bool validateFullName() {
    LoggingUtils.logStartFunction("validateFullName");
    Locale currentLocale = Get.locale!;
    if (CommonConditions.isEmptyValue(inputFullName.value)) {
      errorFullName.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.full_name)
          : englishLang.empty_validate(englishLang.full_name);
      isValidDataRegis.value = false;
    } else {
      errorFullName.value = null;
      isValidDataRegis.value = true;
    }

    return isValidDataRegis.value;
  }

  bool validateUsername() {
    LoggingUtils.logStartFunction("validateUsername");
    Locale currentLocale = Get.locale!;
    if (CommonConditions.isEmptyValue(inputUsername.value)) {
      errorUsername.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.username)
          : englishLang.empty_validate(englishLang.username);
      isValidDataRegis.value = false;
    } else {
      errorUsername.value = null;
      isValidDataRegis.value = true;
    }
    return isValidDataRegis.value;
  }

  bool validateEmail() {
    LoggingUtils.logStartFunction("validateEmail");
    Locale currentLocale = Get.locale!;
    if (CommonConditions.isEmptyValue(inputEmail.value)) {
      errorEmail.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.email)
          : englishLang.empty_validate(englishLang.email);
      isValidDataRegis.value = false;
    } else {
      errorEmail.value = null;
      isValidDataRegis.value = true;
    }
    return isValidDataRegis.value;
  }

  bool validatePassword() {
    LoggingUtils.logStartFunction("validate password");
    Locale currentLocale = Get.locale!;
    validateNotEmptyPassword(currentLocale,errorPassword, inputPassword, indoLang.password, englishLang.password);
    validatePasswordLength(currentLocale ,errorPassword, inputPassword, indoLang.password, englishLang.password);
    return isValidDataRegis.value;
  }

  bool validateReinputPassword() {
    LoggingUtils.logStartFunction("validate reinput password");
    Locale currentLocale = Get.locale!;
    validateNotEmptyPassword(currentLocale, errorReInputPassword, inputReInputPassword, indoLang.reinput_password, englishLang.reinput_password);
    validatePasswordLength(currentLocale , errorReInputPassword, inputReInputPassword, indoLang.reinput_password, englishLang.reinput_password);
    if(inputPassword.value != inputReInputPassword.value){
        isPasswordMatch.value = false;
    }
    if(isPasswordMatch.isFalse && errorReInputPassword.value == null){
      errorReInputPassword.value = "TIDAK SAMA BRODI";
    }
    return isValidDataRegis.value;
  }


  //* Detail Password Validation
  void validateNotEmptyPassword(Locale currentLocale, RxnString errorPassword, RxString inputPassword, String fieldIndo, String fieldEnglish) {
    if (CommonConditions.isEmptyValue(inputPassword.value)) {
      errorPassword.value = Utils.isEnglish(currentLocale)
          ? indoLang.empty_validate(fieldIndo)
          : englishLang.empty_validate(fieldEnglish);
      isValidDataRegis.value = false;
    } else {
      isValidDataRegis.value = true;
      errorPassword.value = null;
    }
  }

  void validatePasswordLength(Locale currentLocale, RxnString errorPassword, RxString inputPassword, String fieldIndo, String fieldEnglish) {
    if (inputPassword.value.length < 5) {
      errorPassword.value = Utils.isIndonesian(currentLocale)
          ? englishLang.minimum_length(5, fieldIndo)
          : englishLang.minimum_length(5, fieldEnglish);
      isValidDataRegis.value = false;
    } else {
      errorPassword.value = null;
      isValidDataRegis.value = true;
    }
  }
}
