import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {

  RxBool isIndoLanguageToggle = RxBool(false);
  Rx<AppLocalizations?> appLocalizations = Rx<AppLocalizations?>(AppLocalizations.of(Get.context!));

  @override
  void onInit() {
    ever(isIndoLanguageToggle, (_) {
      appLocalizations.value = AppLocalizations.of(Get.context!);
    });
    super.onInit();
  }

  toggleLanguage(){
    isIndoLanguageToggle.toggle();
  }
}
