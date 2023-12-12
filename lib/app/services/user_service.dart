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

  void loginRequest(data) async{
    LoggingUtils.logFunction("loginRequest", true);
    dio.Response? response;
    final loginController = Get.find<LoginController>(); 
    loginController.onStartLogin();

    try{
        response = await ApiConstant.dio
        .post(EndPoint.login ,data: data);

      response.statusCode == 200 
      ? loginController.onSuccess(AppLocalizations.of(Get.context!).login) 
      : loginController.onSuccess(AppLocalizations.of(Get.context!).error_detail_server);

    } on dio.DioException catch(e)
    {

      loginController.onFailed(AppLocalizations.of(Get.context!).error_detail_server);
      LoggingUtils.logDebugValue(e.response!.statusCode.toString(),LoggingConstant.errorResponse);
      loginController.resetState();
      loginController.resetFormField();
    } 
  }

  void regisRequest(data) async {
    LoggingUtils.logFunction("regisRequest", true);
    
    final regisController = Get.find<RegisterController>();
    regisController.isLoading.value = true;
    dio.Response? response;

    try {
      response = await ApiConstant.dio.post(EndPoint.register, data: jsonEncode(data));
      regisController.successResponse(AppLocalizations.of(Get.context!).save);

      ScaffoldMessenger.of(Get.context!)
        .showSnackBar(WidgetConstant.basicSnackBar("Regis Success"));

      LoggingUtils.logDebugValue(
          response.data.toString(), LoggingConstant.successResponse);
    } on dio.DioException catch (e) {
      if (e.response != null) {
        //* a long progress processing error message;
        String? errorMessage;

        regisController.errorResponse(AppLocalizations.of(Get.context!).error,
            errorMessage ?? AppLocalizations.of(Get.context!).error_detail_server);
      } else {
        regisController.errorResponse(AppLocalizations.of(Get.context!).error,
            AppLocalizations.of(Get.context!).error_detail_server);
      }
    }
  }


}
