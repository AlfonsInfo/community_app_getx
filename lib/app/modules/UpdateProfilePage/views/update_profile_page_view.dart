import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';
import '../controllers/update_profile_page_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdateProfilePageView extends GetView<UpdateProfilePageController> {
  const UpdateProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          controller.image != null
              ? newProfilePhotoContainer(context)
              : currentProfilePhotoContainer(),
          SizedBox(
            height: 2.h,
          ),
          uploadProfileButton(),
        ],
      ),
    );
  }

  Padding currentProfilePhotoContainer() {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiConstant.prefixEndpoint}${EndPoint.photoProfile}',
                      httpHeaders: Get.find<MainAppController>().headers,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator.adaptive()),
                    )),
              );
  }

  Padding newProfilePhotoContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          //to show image, you type like this.
          File(controller.image!.path),
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
        IconButton(onPressed: (){}, icon: const Icon(Icons.check_box)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
      ],
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
