import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

part 'home_component.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => controller.onWillPopScopeTap(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          // body: gridMenu());
          body: Obx(() => bodyView[controller.navIndex.value]),
          bottomNavigationBar: Obx(() => homeNavbar()),
        ));
  }

//* best practice for home view navigation ?
//* sharing index ?
}
