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
    if (CommonConditions.validateNotEmptyAndNotContainSpace(password.value)) {
      errorTextPassword.value = Utils.isEnglish(currentLocale)
          ? indoLang.empty_validate(indoLang.password)
          : englishLang.empty_validate(englishLang.password);
      isValidValueForSubmitted.value = false;
    } else {
      errorTextPassword.value = null;
      isValidValueForSubmitted.value = true;
    }

    if (password.value.length < 5) {
      errorTextPassword.value = Utils.isIndonesian(currentLocale)
          ? englishLang.minimum_length(5 , indoLang.password )
          : englishLang.minimum_length(5, englishLang.password );
      isValidValueForSubmitted.value = false;
    } else {
      errorTextPassword.value = null;
      isValidValueForSubmitted.value = true;
    }

    

    return isValidValueForSubmitted.value;
  }

  
}