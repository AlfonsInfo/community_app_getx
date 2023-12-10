import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

part 'home_component.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('HomeView'),
      centerTitle: true,
    ),
    // body: gridMenu());
    body: Obx(() => WillPopScope(
      onWillPop: () => controller.onWillPopScopeTap(logoutComponent) ,
      child: bodyView[controller.navIndex.value])),
    bottomNavigationBar: Obx(() => homeNavbar()),
    );
  }

  logoutComponent(){
    return Get.defaultDialog(title: "Logout Confirmation",middleText: "are you sure want to logout" , textConfirm: "mantap");
  }


//* best practice for home view navigation ?
//* sharing index ?
}
