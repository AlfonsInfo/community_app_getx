import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';

class SlideShowController extends GetxController {
    RxList<String> imageList = RxList.of([
      ImageAssetPaths.futsal,
      ImageAssetPaths.secretSanta,
    ]);



}
