import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePageController extends GetxController {

  XFile? image;
  final ImagePicker picker = ImagePicker();



  Future getImage(ImageSource media) async{
    var img = await picker.pickImage(source: media);

    image = img;
  }
}
