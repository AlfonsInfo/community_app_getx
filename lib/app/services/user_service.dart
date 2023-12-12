import 'dart:convert';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/login_controller.dart';
import 'package:jdlcommunity_getx/app/modules/register/controllers/register_controller.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';

class UserService {

  void loginRequest(data,{required Function onStart,required Function onSuccess ,required Function(String) onFailed  }) async{
    Get.find<LoginController>().isLoading.value = true;
    dio.Response? response;

    try{
        response = await ApiConstant.dio
        .post("${ApiConstant.prefixEndpoint}/user/login",data: data);

        if(response.statusCode == 200)
        {
          onSuccess();
        }
    } on dio.DioException catch(e)
    {

      LoggingUtils.logDebugValue(e.response!.statusCode.toString(),LoggingConstant.errorResponse);
      onFailed(AppLocalizations.of(Get.context!).error_detail_server);
    } 
  }

  void regisRequest(data) async {
    Get.find<RegisterController>().isLoading.value = true;
    dio.Response? response;
    try {
      response = await ApiConstant.dio
          .post('${ApiConstant.prefixEndpoint}/user', data: jsonEncode(data));

      successResponse(AppLocalizations.of(Get.context!).save);

      ScaffoldMessenger.of(Get.context!)
        .showSnackBar(WidgetConstant.basicSnackBar("Login Success"));

      LoggingUtils.logDebugValue(
          response.data.toString(), LoggingConstant.successResponse);
    } on dio.DioException catch (e) {
      if (e.response != null) {
        //* a long progress processing error message;
        String? errorMessage;

        errorResponse(AppLocalizations.of(Get.context!).error,
            errorMessage ?? AppLocalizations.of(Get.context!).error_detail_server);
      } else {
        errorResponse(AppLocalizations.of(Get.context!).error,
            AppLocalizations.of(Get.context!).error_detail_server);

        LoggingUtils.logDebugValue(
            (e.response == null).toString(), LoggingConstant.requestError);
      }
    }
  }


}


extension UserServiceHelper on UserService{
  void errorResponse(String errorTitle, String errorMessage) {
    Get.defaultDialog(title: errorTitle, middleText: errorMessage);
    Get.find<RegisterController>().isLoading.value = false;
  }

  void successResponse(String message) {
    //* Show Notif
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(WidgetConstant.basicSnackBar(message));

    //* Stop Loading
    Get.find<RegisterController>().isLoading.value = false;
  }
}