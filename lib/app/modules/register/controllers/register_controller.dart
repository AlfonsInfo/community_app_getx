import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/data/model/user.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_id.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/app/utils/utils.dart';


part 'register_controller_input.dart';
part 'register_controller_validation.dart';

class RegisterController extends GetxController
    implements GetxControllerAbstract {
  RxBool isEyeToggleHideItem1 = RxBool(true);
  RxBool isEyeToggleHideItem2 = RxBool(true);

  //* input value
  final inputFullName = "".obs;
  final inputUsername = "".obs;
  final inputEmail = "".obs;
  final inputPassword = "".obs;
  final inputReInputPassword = "".obs;


  final englishLang = AppLocalizationsEn();
  final indoLang = AppLocalizationsId();


  //* error validation
  RxnString errorFullName = RxnString();
  RxnString errorUsername = RxnString();
  RxnString errorEmail = RxnString();
  RxnString errorPassword = RxnString();
  RxnString errorReInputPassword = RxnString();
  //* valid / non valid data regis
  RxBool isValidDataRegis = false.obs;
  RxBool isPasswordMatch = true.obs;
  User? regisData;
  RxBool isLoading = false.obs;
  
  //* services
  UserService userService = UserService();
  @override
  toggleEye(RxBool value) => value.toggle();



}
