import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class UserService {
  loginRequest(data) async {
    dio.Response? response;
    try {
      response = await ApiConstant.dio.post(EndPoint.login, data: data);
      return response.data['data'];
    } on dio.DioException catch (e) {
      LoggingUtils.logDebugValue(e.toString(), "Exception");
      return response?.statusCode;
    }
  }

  regisRequest(data) async {
    dio.Response? response;
    try {
      response =
          await ApiConstant.dio.post(EndPoint.register, data: jsonEncode(data));
      return response.statusCode.toString();
    } on dio.DioException catch (e) {
      LoggingUtils.logDebugValue(e.toString(), "Exception");
      return response?.statusCode.toString();
    }
  }

  currentUser() async {
    dio.Response? response;
    try {
      response = await ApiConstant.dio.get(EndPoint.current,
          options: dio.Options(headers: {
            'authorization':
                Get.find<MainAppController>().box.read(ApiConstant.sessionToken)
          }));
      if (response.statusCode == 200) {
        final userProfile = UserProfile.fromJson(response.data['data']);
        return userProfile;
      } else {
        return null;
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        return null;
      }
    }
  }

  getPhotoProfile() async {
    dio.Response? response;

    try {
      response = await ApiConstant.dio.get<List<int>>(EndPoint.photoProfile,
          options: dio.Options(
              headers: Get.find<MainAppController>().headers,
              responseType: dio.ResponseType.bytes));
              
      return response;
    } on dio.DioException catch (e) {
      LoggingUtils.logDebugValue(e.toString(), "Exception");
      return response?.statusCode.toString();
    }
  }

  postPhotoProfile(XFile? data) async {
    dio.Response? response;
    File file = File(data!.path);
    String fileName = file.path.split('/').last;
    dio.FormData formData = dio.FormData.fromMap({
         "image":  await dio.MultipartFile.fromFile(file.path, filename: fileName)
    });
    
    try {
      response = await ApiConstant.dio.post(EndPoint.photoProfile,
          options: dio.Options(
              headers: Get.find<MainAppController>().headers,
              ),
              data: formData);
      return response;
    } on dio.DioException catch (e) {
      LoggingUtils.logDebugValue(e.toString(), "Exception");
      return response?.statusCode.toString();
    }
  }
}
