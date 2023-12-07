import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';

class RegisterController extends GetxController implements GetxControllerAbstract {
  RxBool isEyeToggleHideItem1 = RxBool(true);
  RxBool isEyeToggleHideItem2 = RxBool(true);

  @override
  toggleEye(RxBool value) => value.toggle();
}
