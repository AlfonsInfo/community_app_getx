import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/modules/ProfilePage/controllers/profile_page_controller.dart';
import 'package:jdlcommunity_getx/app/services/user_service.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class UpdateProfilePageController extends GetxController {

  UserService userService = Get.find<MainAppController>().userService;
  //*Profile Image
  Rxn<XFile?> image = Rxn();
  final ImagePicker picker = ImagePicker();
  Rxn<List<int>> currentPhotoProfile = Rxn();


  //*Initial Data
  UserProfile userProfile = UserProfile();
  //* input value
  final inputEmail = Get.find<ProfilePageController>().userProfile.email.obs;
  final inputFullName = Get.find<ProfilePageController>().userProfile.fullname.obs;
  final inputUsername = Get.find<ProfilePageController>().userProfile.username.obs;

  //* loading data
  final isLoading = false.obs;

  //* dropdown Flutter
  final mapGender = {
    0 : {'ind' : 'Laki-laki' , 'eng' : 'Male'},
    1 : {'ind' : 'Perempuan' , 'eng' : 'Female'},
  };


  handleWillPop()
  {
    image.value = null;
    Get.find<ProfilePageController>().currentPhotoProfile.value = currentPhotoProfile.value;
    Get.back();
  }


  //* Processing Photo Profile
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
  }

  handleCancelNewProfilePhoto()
  {
    image.value = null;
    Get.back();
  }

  getPhotoProfile()
  {
    return userService.getPhotoProfile();
  }


  //* Processing Data Profil

    @override
  void onInit() {
    fetchProfileData();
    super.onInit();
  }

  fetchProfileData() async{
    try{
      isLoading.value = true; 
      userProfile = await userService.currentUser();
      await Future.delayed(const Duration(seconds: 3));
    }catch(e)
    {
      LoggingUtils.logError("fetchProfileData", e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  handleConfirmUpdateProfileData() async{


    Get.back();
  }
}
