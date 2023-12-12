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
      UserService userService =  Get.find<MainAppController>().userService;
    
      Map<String,dynamic> loginRequest = 
      {
        "username" : username.value,
        "password" : password.value
      };

      userService.loginRequest(loginRequest,onStart:  onStart, onSuccess:  onSuccess,onFailed:  onFailed);
      resetState();

    } 
  }

  onStart()
  {
    isLoading.value = true;
  }

  onSuccess(message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(WidgetConstant.basicSnackBar(message));
    //* Stop Loading
    isLoading.value = false;
  }

  onFailed(message)
  {    //* Show Notif
    ScaffoldMessenger.of(Get.context!).showSnackBar(WidgetConstant.basicSnackBar(message));
    //* Stop Loading
    isLoading.value = false;

  }

  

}