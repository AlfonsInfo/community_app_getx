import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        Center(
            child: Text(
              'kuddos',
              style: TextStyle(fontSize: 20),
            ),
          ),
             Text(
              'cop points ??',
              style: TextStyle(fontSize: 20),
            ),
      ],
    );
  }
}
