import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jdlcommunity_getx/app/modules/ProfilePage/controllers/profile_page_controller.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class UpdateProfilePageController extends GetxController {

  Rxn<XFile?> image = Rxn();
  final ImagePicker picker = ImagePicker();
  UserService userService = Get.find<MainAppController>().userService;
  Rxn<List<int>> currentPhotoProfile = Rxn();



  Future getImage(ImageSource media) async{
    var img = await picker.pickImage(source: media);

    image.value = img;
  }


  isNewPhotoProfileSelected()
  {
    return image.value != null;
  }

  handleConfirmUpdateProfilePhoto() async
  {
    userService.postPhotoProfile(image.value);
    var response = await userService.getPhotoProfile();
    var data = response as dio.Response<List<int>>?;
    currentPhotoProfile.value = data!.data!;
    image.value = null;
    Get.back();
   // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("test" ),));
  }

  handleCancelNewProfilePhoto()
  {
    image.value = null;
    Get.back();
  }

  handleWillPop()
  {
    image.value = null;
    Get.find<ProfilePageController>().currentPhotoProfile.value = currentPhotoProfile.value;
    // Get.find<ProfilePageController>().update();
    Get.back();
  }

  getPhotoProfile()
  {
    return userService.getPhotoProfile();
  }
}
