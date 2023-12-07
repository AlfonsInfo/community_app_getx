import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';
class LoginController extends GetxController implements GetxControllerAbstract {

  RxBool isIndoLanguageToggle = RxBool(true);
  RxBool isEyeToggleHideItem = RxBool(true);
  RxBool isToggleEnable = RxBool(true);
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final formKey = GlobalKey<FormState>().obs;
  
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


  String? validateUsername(String value, BuildContext context)
  {
    if(CommonConditions.validateNotEmptyAndNotContainSpace(value)){
      return AppLocalizations.of(context).empty_validate(AppLocalizations.of(context).username);
    }

    //*validasi unique char

    return null;
  }

  String? validatePassword(String value, BuildContext context){

    if(CommonConditions.validateNotEmptyAndNotContainSpace(value)){
      return AppLocalizations.of(context).empty_validate(AppLocalizations.of(context).password);
    }

    //*validasi length
    if(value.length < 5)
    {
      return "minimum length 5";
    }
    return null;
  }
}
