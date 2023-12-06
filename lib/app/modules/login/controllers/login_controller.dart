import 'package:get/get.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import 'dart:developer';
class LoginController extends GetxController {

  RxBool isIndoLanguage = RxBool(false);



  toggleLanguage(){
    isIndoLanguage.toggle();
    MainAppController mainAppController = Get.find();
    mainAppController.setLanguage(isIndoLanguage);
    log(isIndoLanguage.toString());
    log(mainAppController.isIndonesianLanguage.toString());
  }

}
