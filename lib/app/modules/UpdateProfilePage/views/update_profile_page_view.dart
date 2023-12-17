import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import '../controllers/update_profile_page_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dio/dio.dart' as dio;

class UpdateProfilePageView extends GetView<UpdateProfilePageController> {

  UpdateProfilePageView({Key? key}) : super(key: key);
  final prefixLocalizations = AppLocalizations.of(Get.context!);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() {
        controller.handleWillPop();
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              title(name: "Update Photo Profile", message: AppLocalizations.of(Get.context!).update_photo_profile),
              Obx(
                () => controller.image.value != null
                    ? newProfilePhotoContainer()
                    : currentProfilePhotoContainer(),
              ),
              SizedBox(
                height: 2.h,
              ),
              uploadProfileButton(),
              title(name: "Update Profile", message: AppLocalizations.of(Get.context!).update_profile),
              inputFullName(prefixLocalizations)
            ],
          ),
        ),
      ),
    );
  }

  Widget inputFullName(AppLocalizations prefixLocalizations) {
    return Padding(
            padding: WidgetConstant.edgeInsetForm05,
            child: TextFormField(
              // onChanged: (value) => controller.fullNameChanged(value),
              initialValue: controller.inputFullName.value,
              decoration:InputDecoration(
                labelText: prefixLocalizations.full_name,
                // errorText: controller.errorFullName.value
                ),
            ),
          // ),
    );
 }

  Padding title({name,message}) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message,
              style: TextStyle(fontSize: 6.w,fontWeight: FontWeight.bold),),
            );
  }

}


extension UpdateProfileData on UpdateProfilePageView{

}

extension UpdatePhotoProfileComponent on UpdateProfilePageView{
  
  Padding currentProfilePhotoContainer() {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FutureBuilder(
            future: controller.getPhotoProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data! as dio.Response<List<int>>?;
                controller.currentPhotoProfile.value = data!.data!;
                return Image.memory(
                  Uint8List.fromList(controller.currentPhotoProfile.value!),
                  fit: BoxFit.fill,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
                // return Skeletonizer(child: Image.asset(ImageAssetPaths.dummyUser));
              }
            },
          )),
    );
  }

  Widget newProfilePhotoContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          //to show image, you type like this.
          File(controller.image.value!.path),
          fit: BoxFit.cover,
          width: MediaQuery.of(Get.context!).size.width,
          height: 300,
        ),
      ),
    );
  }

  Widget uploadProfileButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  myAlert();
                },
                child: Text(AppLocalizations.of(Get.context!).upload_photo),
              ),
            ),
          ),
        ),
        Obx(() => (controller.isNewPhotoProfileSelected())
            ? IconButton(
                onPressed: () => confirmUpdatePhotoDialog(),
                icon: const Icon(Icons.check_box))
            : const SizedBox.shrink()),
        Obx(() => (controller.isNewPhotoProfileSelected())
            ? IconButton(
                onPressed: () => cancelUpdatePhotoDialog(),
                icon: const Icon(Icons.delete))
            : const SizedBox.shrink()),
      ],
    );
  }

  void confirmUpdatePhotoDialog() {
    Get.defaultDialog(
      title: AppLocalizations.of(Get.context!).confirm_change,
      middleText: AppLocalizations.of(Get.context!)
          .update_confirmation(AppLocalizations.of(Get.context!).photo_profile),
      textConfirm: AppLocalizations.of(Get.context!)
          .update_subject(AppLocalizations.of(Get.context!).photo_profile),
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.blue, // Warna latar belakang tombol konfirmasi
      radius: 10.0, // Jari-jari sudut dialog
      textCancel: AppLocalizations.of(Get.context!).cancel,
      onConfirm: () => controller.handleConfirmUpdateProfilePhoto(),
    );
  }

  void cancelUpdatePhotoDialog() {
    Get.defaultDialog(
      title: AppLocalizations.of(Get.context!).confirm_cancelled_title,
      middleText: AppLocalizations.of(Get.context!).confirm_cancelled_middle,
      textConfirm: AppLocalizations.of(Get.context!).yes,
      textCancel: AppLocalizations.of(Get.context!).no,
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.blue, // Warna latar belakang tombol konfirmasi
      radius: 10.0, // Jari-jari sudut dialog
      onConfirm: () => controller.handleCancelNewProfilePhoto(),
    );
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(AppLocalizations.of(Get.context!).choose_media),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.getImage(ImageSource.gallery);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.image),
                          Text(AppLocalizations.of(Get.context!).from_gallery),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      //if user click this button. user can upload image from camera
                      onPressed: () {
                        Navigator.pop(context);
                        controller.getImage(ImageSource.camera);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.camera),
                          Text(AppLocalizations.of(Get.context!).from_camera),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
