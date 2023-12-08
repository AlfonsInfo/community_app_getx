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

  //* Detail Password Validation
  validateNotEmptyPassword(Locale currentLocale, RxnString errorPassword,
      RxString inputPassword, String fieldIndo, String fieldEnglish) {
    if (CommonConditions.isEmptyValue(inputPassword.value)) {
      errorPassword.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(fieldIndo)
          : englishLang.empty_validate(fieldEnglish);
      isValidDataRegis.value = false;
    } else {
      isValidDataRegis.value = true;
      errorPassword.value = null;
    }
  }

  void validatePasswordLength(Locale currentLocale, RxnString errorPassword,
      RxString inputPassword, String fieldIndo, String fieldEnglish) {
    if (inputPassword.value.isNotEmpty &&
        inputPassword.value.length < NumberConstant.minimumLengthPw) {
      errorPassword.value = Utils.isIndonesian(currentLocale)
          ? indoLang.minimum_length(NumberConstant.minimumLengthPw, fieldIndo)
          : englishLang.minimum_length(
              NumberConstant.minimumLengthPw, fieldEnglish);
      isValidDataRegis.value = false;
    } else {
      errorPassword.value = null;
      isValidDataRegis.value = true;
    }
  }

  void validateMatchPassword(Locale currentLocale) {
    if (inputPassword.value != inputReInputPassword.value) {
      isPasswordMatch.value = false;
    }
    if (isPasswordMatch.isFalse && errorReInputPassword.value == null) {
      errorReInputPassword.value = Utils.isIndonesian(currentLocale)
          ? indoLang.non_match_pw
          : englishLang.non_match_pw;
    }
  }
}

extension RegisPassword on RegisterController {
  bool validatePassword() {

    LoggingUtils.logStartFunction("validate password");
    Locale currentLocale = Get.locale!;

    //* check password empty atau tidak
    validateNotEmptyPassword(
      currentLocale, 
      errorPassword, 
      inputPassword,
      indoLang.password, 
      englishLang.password
      );

    if (errorPassword.value == null) {
      validatePasswordLength(
        currentLocale, 
        errorPassword, 
        inputPassword,
        indoLang.password,
        englishLang.password
      );
    }
    return isValidDataRegis.value;
  }
}

extension RegisReinputPassword on RegisterController {
  bool validateReinputPassword() {
    
    LoggingUtils.logStartFunction("validate reinput password");
    Locale currentLocale = Get.locale!;

    validateNotEmptyPassword(
        currentLocale,
        errorReInputPassword,
        inputReInputPassword,
        indoLang.reinput_password,
        englishLang.reinput_password
    );

    if (errorReInputPassword.value == null) {
      validatePasswordLength(
          currentLocale,
          errorReInputPassword,
          inputReInputPassword,
          indoLang.reinput_password,
          englishLang.reinput_password);
    }
    if (errorReInputPassword.value == null) {
      validateMatchPassword(currentLocale);
    }
    return isValidDataRegis.value;
  }
}
