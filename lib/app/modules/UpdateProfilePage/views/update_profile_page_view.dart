import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_profile_page_controller.dart';

class UpdateProfilePageView extends GetView<UpdateProfilePageController> {
  const UpdateProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateProfilePageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpdateProfilePageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
