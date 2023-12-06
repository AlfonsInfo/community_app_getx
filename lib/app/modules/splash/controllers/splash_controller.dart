import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () => navigateToLogin());
  }
  Future<dynamic>? navigateToLogin() => Get.offNamed("/login");


  @override
  void onClose() async {
    super.onClose();
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPreferencesKey.isFirstInstall, false);
  }
}
