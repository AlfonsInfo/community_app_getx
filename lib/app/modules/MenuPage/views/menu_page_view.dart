import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menu_page_controller.dart';

class MenuPageView extends GetView<MenuPageController> {
  const MenuPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Center(
        child: Text(
          'Menu Page is working',
          style: TextStyle(fontSize: 20),
        ),
      );
  }
}
