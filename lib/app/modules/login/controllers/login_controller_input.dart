part of 'login_controller.dart';

extension LoginControllerInput on  LoginController{
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
    if (isEverFocusedUsername.value || isEverFocusedPassword.value || (isValidValueForSubmitted.isFalse || countSubmitHit.value > 0)) {
      isValidValueForSubmitted.value = validateUsername();
      isValidValueForSubmitted.value = validatePassword();
    }
  }

  submitFunction() {
    LoggingUtils.logFunction("SubmitFunction",true);
    countSubmitHit++;
    var condition1 = validateUsername();
    var condition2 = validatePassword();
    isValidValueForSubmitted.value =  condition1 & condition2;    

    if(isValidValueForSubmitted.value)
    {
      resetState();
      Get.toNamed(Routes.home);
    }
  }

  

}