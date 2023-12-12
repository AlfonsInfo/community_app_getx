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

      loginRequestHandling(userService, loginRequest);
    } 
    
    
  }

  onSuccess(message,data){
    Get.find<MainAppController>().box.write(ApiConstant.sessionToken, data['session'] );
    ScaffoldMessenger.of(Get.context!).showSnackBar(WidgetConstant.basicSnackBar(message));
    Get.offNamed(Routes.home);    
    isLoading.value = false;
  }

  onFailed(message)
  {   
    ScaffoldMessenger.of(Get.context!).showSnackBar(WidgetConstant.basicSnackBar(message));
    isLoading.value = false;
  }

  void loginRequestHandling(UserService userService, Map<String, dynamic> loginRequest) async {
    try{
      isLoading.value = true;
      var response = await userService.loginRequest(loginRequest);
      onSuccess(AppLocalizations.of(Get.context!).login_success(response['username'] ?? "members"), response);
    }catch(e)
    {
      onFailed(AppLocalizations.of(Get.context!).login_failed);
    }
  }
  

}
