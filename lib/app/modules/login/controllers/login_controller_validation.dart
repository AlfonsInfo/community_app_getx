part of 'login_controller.dart';


extension LoginControllerValidation on  LoginController{
  
  bool validateUsername() {
    LoggingUtils.logStartFunction("validateUsername");
    Locale currentLocale = Get.locale!;
    if (CommonConditions.isEmptyValue(username.value)) {
      errorTextUsername.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.username)
          : englishLang.empty_validate(englishLang.username);
      isValidValueForSubmitted.value= false;
    } else {
      errorTextUsername.value = null;
      isValidValueForSubmitted.value = true;
    }
    return isValidValueForSubmitted.value;
  }


    bool validatePassword() {
    Locale currentLocale = Get.locale!;
    validateLength(currentLocale);
    validateNotEmpty(currentLocale);

    

    return isValidValueForSubmitted.value;
  }

  void validateLength(Locale currentLocale) {
    if (password.value.length < 5) {
      errorTextPassword.value = Utils.isIndonesian(currentLocale)
          ? indoLang.minimum_length(5 , indoLang.password )
          : englishLang.minimum_length(5, englishLang.password );
      isValidValueForSubmitted.value = false;
    } else {
      errorTextPassword.value = null;
      isValidValueForSubmitted.value = true;
    }
  }

  void validateNotEmpty(Locale currentLocale) {
    if (CommonConditions.isEmptyValue(password.value)) {
      errorTextPassword.value = Utils.isIndonesian(currentLocale)
          ? indoLang.empty_validate(indoLang.password)
          : englishLang.empty_validate(englishLang.password);
      isValidValueForSubmitted.value = false;
    } else {
      errorTextPassword.value = null;
      isValidValueForSubmitted.value = true;
    }
  }
  
}
