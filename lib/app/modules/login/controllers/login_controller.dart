import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';

class LoginController extends GetxController implements GetxControllerAbstract {

  RxBool isIndoLanguageToggle = RxBool(true);
  RxBool isEyeToggleHideItem = RxBool(true);
  
  Rx<AppLocalizations?> appLocalizations = Rx<AppLocalizations?>(AppLocalizations.of(Get.context!));

  @override
  void onInit() {
    ever(isIndoLanguageToggle, (_) {
      // appLocalizations.value = AppLocalizations.of(Get.context!);
    });
    super.onInit();
  }

  toggleLanguage() => isIndoLanguageToggle.toggle();
  @override
  toggleEye(RxBool value) => value.toggle();
}
