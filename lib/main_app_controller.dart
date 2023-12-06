

import 'package:get/get.dart';

class MainAppController extends GetxController{
  RxBool isThemeModeBySistem = RxBool(true);
  RxBool isIndonesianLanguage = RxBool(true);

  void setLanguage(RxBool language){
    isIndonesianLanguage = language;
  }

  

}