import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';

class RegisterController extends GetxController implements GetxControllerAbstract {
  RxBool isEyeToggleHideItem1 = RxBool(true);
  RxBool isEyeToggleHideItem2 = RxBool(true);

  //* form value
  final fullNameController = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final reInputPasswordController = TextEditingController().obs;
  
  @override
  toggleEye(RxBool value) => value.toggle();
}
