import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
import 'package:jdlcommunity_getx/app/data/model/user_profile.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
import 'package:jdlcommunity_getx/main_app_controller.dart';

class UserService extends GetxService {
  loginRequest(data) async {
    dio.Response? response;
    try {
       response = await ApiConstant.dio.post(EndPoint.login, data: data);
      return response.data['data'];
    } on dio.DioException catch (e) {
      LoggingUtils.logDebugValue(e.toString(),"Exception");
      return response?.statusCode;
    }
  }

  regisRequest(data) async {
    dio.Response? response;
    try {
      response = await ApiConstant.dio.post(EndPoint.register, data: jsonEncode(data));
      return response.statusCode.toString();
    } on dio.DioException catch (e) {
      LoggingUtils.logDebugValue(e.toString(),"Exception");
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
}
