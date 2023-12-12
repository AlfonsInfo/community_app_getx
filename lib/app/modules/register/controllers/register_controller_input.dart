part of 'register_controller.dart';



extension RegisControllerInput on  RegisterController{


  fullNameChanged(String value) {
    inputFullName.value = value;
    validateFullName();
  }

  usernameChanged(String value){
    inputUsername.value = value;
    validateUsername();  
}

  emailChanged(String value){
    inputEmail.value = value;
    validateEmail();
  }

  passwordChanged(String value)
  {
    inputPassword.value = value;
    validatePassword();
  }

  reinputPasswordChanged(String value)
  {
    inputReInputPassword.value = value;
    validateReinputPassword();
  }


  onRegisterPressed()
  {
    var condition1 = validateFullName();
    var condition2 = validateUsername();
    var condition3 = validateEmail();
    var condition4 = validatePassword();
    var condition5 = validateReinputPassword();

    isValidDataRegis.value =  condition1 && condition2 && condition3 && condition4 && condition5;

    if(isValidDataRegis.value){
      regisData = User(
        inputUsername.value, 
        inputFullName.value, 
        inputPassword.value,
        inputEmail.value
      );
      userService.regisRequest(regisData);
    }    
  }


  void errorResponse(String errorTitle, String errorMessage) {
    Get.defaultDialog(title: errorTitle, middleText: errorMessage);
    isLoading.value = false;
  }

  void successResponse(String message) {
    //* Show Notif
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(WidgetConstant.basicSnackBar(message));

    //* Stop Loading
    Get.find<RegisterController>().isLoading.value = false;
  }
}