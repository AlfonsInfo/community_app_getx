// import 'package:dio/dio.dart' as dio;
// import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
// import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Test  user service', (){
//     test("test current User", () async {
//       var session = 'fbd81aaf-ea02-4eed-97d4-1f366abf9f71';
//       dio.Response response = await ApiConstant.dio.get(EndPoint.current,
//           options: dio.Options(headers: {
//             'authorization':
//                 session //*Get.find<MainAppController>().box.read(ApiConstant.sessionToken)
//           }));
//       final map = response.data['data'];
//       UserProfile? userProfile = UserProfile.fromJson(map);
//       expect(userProfile.runtimeType, UserProfile);
//     });

//     test("test getstorage", () {
//       // GetStorage box = GetStorage();
//       // GetStorage.init();

//     });
//   });
// }
