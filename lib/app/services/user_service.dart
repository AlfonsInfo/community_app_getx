import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/api_constants.dart';
import 'package:jdlcommunity_getx/app/constants/widget_constants.dart';
import 'package:jdlcommunity_getx/app/utils/logging_utils.dart';
class UserService{

  void regisRequest(data) async{
      dio.Response? response; 
    try{
      response = await ApiConstant.dio.post('${ApiConstant.prefixEndpoint}/user', data: jsonEncode(data));
      LoggingUtils.logDebugValue(response.data.toString(),"SUCCESS RESPONSE");
      ScaffoldMessenger.of(Get.context!).showSnackBar(WidgetConstant.basicSnackBar("Sukses"));
    } on dio.DioException catch(e){
      if(e.response != null){
        Map? errors = JsonEncoder(response!.data);
        LoggingUtils.logDebugValue(e.response!.statusCode.toString(), "SERVER ERRORS");
        LoggingUtils.logDebugValue(e.response!.data.toString(), "SERVER ERRORS");
      Get.snackbar("GAGAL!", e.message ?? "Terjadi kesalahan",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      }else{
        LoggingUtils.logDebugValue((e.response == null).toString(), "REQUEST ERRORS");
      ScaffoldMessenger.of(Get.context!).showSnackBar(WidgetConstant.basicSnackBar("Error"));
      }
    }
  }
}