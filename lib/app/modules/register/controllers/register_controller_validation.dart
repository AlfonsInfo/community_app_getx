part of 'register_controller.dart';

extension FullNameValidation on RegisterController {
  bool validateFullName() {
    var activity = "validateFullName";
    LoggingUtils.logFunction(activity, true);
    Locale currentLocale = Get.locale!;

    validateNotEmptyUsername(currentLocale);
    
    return isValidDataRegis.value;
  }

  void validateNotEmptyUsername(Locale currentLocale) {
    if (CommonConditions.isEmptyValue(inputFullName.value)) {
      errorFullName.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.full_name)
          : englishLang.empty_validate(englishLang.full_name);
      isValidDataRegis.value = false;
    } else {
      errorFullName.value = null;
      isValidDataRegis.value = true;
    }
  }
}


extension UserNameValidation on RegisterController{
  
  //* Brain Function
  bool validateUsername() {
    var activity = "validateUsername";
    LoggingUtils.logFunction(activity,true);
    Locale currentLocale = Get.locale!;

    validateNotEmptyUsername(currentLocale);
    
    return isValidDataRegis.value;
  }

  void validateNotEmptyUsername(Locale currentLocale) {
    if (CommonConditions.isEmptyValue(inputUsername.value)) {
      errorUsername.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.username)
          : englishLang.empty_validate(englishLang.username);
      isValidDataRegis.value = false;
    } else {
      errorUsername.value = null;
      isValidDataRegis.value = true;
    }
}
}


extension EmailValidation on RegisterController{
  bool validateEmail() {
    var activity = "validateEmail";
    LoggingUtils.logFunction(activity,true);

    Locale currentLocale = Get.locale!;

    validateNotEmptyEmail(currentLocale);
    return isValidDataRegis.value;
  }


void validateNotEmptyEmail(Locale currentLocale) {
  if (CommonConditions.isEmptyValue(inputEmail.value)) {
    errorEmail.value = Utils.isIndonesian(currentLocale)
        ? indoLang.empty_validate(indoLang.email)
        : englishLang.empty_validate(englishLang.email);
    isValidDataRegis.value = false;
  } else {
    errorEmail.value = null;
    isValidDataRegis.value = true;
  }
}
}


extension RegisPassword on RegisterController {
  bool validatePassword() {
    LoggingUtils.logFunction("validate password",true);
    Locale currentLocale = Get.locale!;

    //* check password empty atau tidak
    validateNotEmptyPassword(currentLocale, errorPassword, inputPassword,
        indoLang.password, englishLang.password);

    if (errorPassword.value == null) {
      validatePasswordLength(currentLocale, errorPassword, inputPassword,
          indoLang.password, englishLang.password);
    }
    return isValidDataRegis.value;
  }
}

extension RegisReinputPassword on RegisterController {
  bool validateReinputPassword() {
    LoggingUtils.logFunction("validate reinput password",true);
    Locale currentLocale = Get.locale!;

    validateNotEmptyPassword(
        currentLocale,
        errorReInputPassword,
        inputReInputPassword,
        indoLang.reinput_password,
        englishLang.reinput_password);

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



extension PasswordValidationMethod on RegisterController {
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
    }else{
      isPasswordMatch.value = true;
    }
    if (isPasswordMatch.isFalse) {
      errorReInputPassword.value = Utils.isIndonesian(currentLocale)
          ? indoLang.non_match_pw
          : englishLang.non_match_pw;
    }else{
      errorReInputPassword.value = null;
    }
  }
}
