import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    controller.onClose();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [splashImages(), splashText()],
        ),
      ),
    );
  }

  Widget splashText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textAlign: TextAlign.center,
        TextConstants.splashScreenWelcomeMessage,
        style: GoogleFonts.akayaKanadaka(fontSize: 30),
      ),
    );
  }

  Widget splashImages() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          ImageAssetPaths.splashLogoPath,
        ));
  }
}
