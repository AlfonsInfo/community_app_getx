import 'dart:io';
import 'dart:typed_data';
import 'package:multi_dropdown/multiselect_dropdown.dart';
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
      onWillPop: () {
        controller.handleWillPop();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(Get.context!).update_profile),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              title(AppLocalizations.of(Get.context!).update_photo_profile),
              Obx(
                () => controller.image.value != null
                    ? newProfilePhotoContainer()
                    : currentProfilePhotoContainer(),
              ),
              WidgetConstant.spacingCustomable(2.h),
              uploadProfileButton(),
              title(AppLocalizations.of(Get.context!).update_your_information),
              inputFullName(prefixLocalizations),
              inputEmail(prefixLocalizations),
              inputUsername(prefixLocalizations),
              inputGender(prefixLocalizations),
              inputBio(prefixLocalizations),
              inputHobby(prefixLocalizations),
              updateUserInformation()
            ],
          ),
        ),
      ),
    );
  }

  Padding title(message,{name}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(fontSize: 6.w, fontWeight: FontWeight.bold),
      ),
    );
  }
}

extension UpdateProfileData on UpdateProfilePageView {
  Widget updateUserInformation() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                confirmUpdateProfile();
              },
              child: Text(AppLocalizations.of(Get.context!).update_profile),
            ),
          ),
        ),
      )
    ]);
  }

    void confirmUpdateProfile() {
    Get.defaultDialog(
      title: AppLocalizations.of(Get.context!).confirm_change,
      middleText: AppLocalizations.of(Get.context!)
          .update_confirmation(AppLocalizations.of(Get.context!).profile),
      textConfirm: AppLocalizations.of(Get.context!)
          .update_subject(AppLocalizations.of(Get.context!).profile),
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.blue, // Warna latar belakang tombol konfirmasi
      radius: 10.0, // Jari-jari sudut dialog
      textCancel: AppLocalizations.of(Get.context!).cancel,
      onConfirm: () => controller.handleConfirmUpdateProfileData(),
    );
  }

  Widget inputFullName(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm05,
      child: TextFormField(
        // onChanged: (value) => controller.fullNameChanged(value),
        initialValue: controller.inputFullName.value,
        decoration: InputDecoration(
          labelText: prefixLocalizations.full_name,
          // errorText: controller.errorFullName.value
        ),
      ),
      // ),
    );
  }

  Widget inputEmail(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm05,
      child: TextFormField(
        // onChanged: (value) => controller.fullNameChanged(value),
        initialValue: controller.inputEmail.value,
        decoration: InputDecoration(
          labelText: prefixLocalizations.full_name,
          // errorText: controller.errorFullName.value
        ),
      ),
      // ),
    );
  }

  Widget inputUsername(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm05,
      child: TextFormField(
        // onChanged: (value) => controller.fullNameChanged(value),
        initialValue: controller.inputUsername.value,
        decoration: InputDecoration(
          labelText: prefixLocalizations.full_name,
          // errorText: controller.errorFullName.value
        ),
      ),
      // ),
    );
  }

  Widget inputBio(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm05,
      child: TextFormField(
        maxLines: 3,
        maxLength: 150,
        decoration: InputDecoration(
          labelText: prefixLocalizations.biography,
          // errorText: controller.errorFullName.value
        ),
      ),
      // ),
    );
  }

  Widget inputHobby(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm05,
      child: MultiSelectDropDown<int>(
        onOptionSelected: (List<ValueItem> selectedOptions) {},
        options: const <ValueItem<int>>[
          ValueItem(label: 'Option 1', value: 1),
          ValueItem(label: 'Option 2', value: 2),
          ValueItem(label: 'Option 3', value: 3),
          ValueItem(label: 'Option 4', value: 4),
          ValueItem(label: 'Option 5', value: 5),
          ValueItem(label: 'Option 6', value: 6),
        ],
        selectionType: SelectionType.multi,
        chipConfig: const ChipConfig(wrapType: WrapType.scroll),
        dropdownHeight: 300,
        optionTextStyle: const TextStyle(fontSize: 16),
        selectedOptionIcon: const Icon(Icons.check_circle),
        radiusGeometry: const BorderRadius.all(Radius.circular(0)),
      ),
    );
  }

  Widget inputGender(AppLocalizations prefixLocalizations) {
    return Padding(
      padding: WidgetConstant.edgeInsetForm05,
      child: DropdownButtonFormField<int>(
        items: controller.mapGender.entries.map<DropdownMenuItem<int>>(
          (MapEntry<int, Map<String, String>> entry) {
            return DropdownMenuItem<int>(
              value: entry.key,
              child: Text(entry.value['ind']!),
            );
          },
        ).toList(),
        onChanged: (value) {
          // Handle when the value is changed
        },
        decoration: InputDecoration(
          labelText: prefixLocalizations.gender,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}

extension UpdatePhotoProfileComponent on UpdateProfilePageView {
  Padding currentProfilePhotoContainer() {
    return Padding(
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
                  alertUploadPhoto();
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
  void alertUploadPhoto() {
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
