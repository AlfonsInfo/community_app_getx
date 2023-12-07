import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/modules/abstract/controller_abstract.dart';
import 'package:jdlcommunity_getx/app/routes/app_pages.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
// import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
class LoginController extends GetxController implements GetxControllerAbstract {

  RxBool isIndoLanguageToggle = RxBool(true);
  RxBool isEyeToggleHideItem = RxBool(true);
  RxInt firstChanges = 1.obs;

  RxString username = RxString("");
  RxnString errorTextUsername = RxnString();  

  RxString password = RxString("");
  RxnString errorTextPassword = RxnString();
  final formKey = GlobalKey<FormState>().obs;

  RxBool isEverFocusedUsername = RxBool(false);
  RxBool isEverFocusedPassword= RxBool(false);
  

  usernameChanged(value){
    username.value = value;
    validateUsername();
  }
  passwordChanged(value){
    password.value = value;
      validatePassword();
  }
  toggleLanguage(){
    Locale sebelumLocale = Get.locale!;
    LoggingUtils.logDebugValue(sebelumLocale.toString(), "SEBELUM");

    isIndoLanguageToggle.toggle();


    BuildContext context2 = Get.context!;
    Locale sesudahLocale = Get.locale!;
    Locale sesudahDariContext = Localizations.localeOf(context2);
    LoggingUtils.logDebugValue(sesudahLocale.toString(), "locale cek 2");
    LoggingUtils.logDebugValue(sesudahDariContext.toString(), "locale sesudah dari context");
    
    
    LoggingUtils.logDebugValue(AppLocalizations.of(context2).empty_validate(""), "") ;
    validateUsername(context: context2);

  }
  @override
  toggleEye(RxBool value) => value.toggle();
  checkEverFocusedOnUsername() {
    isEverFocusedUsername.value = true;
  }
  checkEverFocusedOnPassword(){      
    isEverFocusedPassword.value = true;
    
  }

  // Rx<AppLocalizations?> appLocalizations = Rx<AppLocalizations?>(AppLocalizations.of(Get.context!));


  @override
  void onInit() {
      ever(isIndoLanguageToggle, (_) {  
        //validateUsername(context: context);
        //validatePassword(context: context);
    });
    super.onInit();
  }



  validateUsername({BuildContext? context})
  {
    CommonConditions.validateNotEmptyAndNotContainSpace(username.value) 
    ? errorTextUsername.value = AppLocalizations.of(context ?? Get.context!).empty_validate(AppLocalizations.of(Get.context!).username)
    : errorTextUsername.value =  null;
  }


  validatePassword({BuildContext? context} ){
    if(CommonConditions.validateNotEmptyAndNotContainSpace(password.value))
    {
      errorTextPassword.value =  AppLocalizations.of(context ?? Get.context!).empty_validate(AppLocalizations.of(Get.context!).password);
      return;
    }else{
      errorTextPassword.value =  null;
    }

    if(password.value.length < 5){
      errorTextPassword.value =  AppLocalizations.of(Get.context!).minimum_length( "5", AppLocalizations.of(Get.context!).password);
      return;
    } else{
      errorTextPassword.value =  null;
    }
  }

  Future<bool> Function() submitFunction() {
    LoggingUtils.logStartFunction("SubmitFunction");
    return () async {
      await Future.delayed(const Duration(seconds: 0), () 
      {
        validateUsername();
        validatePassword();
         if(errorTextUsername.value == null && errorTextPassword.value == null){
            Get.toNamed(Routes.home);
         }
      });
      return true;
    };
  }
}

