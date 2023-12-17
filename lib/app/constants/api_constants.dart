import 'package:dio/dio.dart';
abstract class ApiConstant{
  // static const localHost = 'http://192.168.1.15';
  static const localHost = 'http://10.200.119.132';
  // static const localHost = 'http://10.176.74.202';
  // static const localHost = 'http://192.168.43.34';
  static const port = ':8000';
  static const prefixEndpoint = '$localHost$port/api';
  static final dio = Dio(BaseOptions(
    baseUrl: prefixEndpoint,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60)
  ));

  static const sessionToken = 'session_token';
  
} 
abstract class EndPoint{
  static const register = '/user';
  static const login = '$register/login';
  static const current = '$register/current';
  static const photoProfile = '$register/photo-profile';
}

