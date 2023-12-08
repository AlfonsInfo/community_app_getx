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
      Get.toNamed(Routes.login);
    }    
  }


}
