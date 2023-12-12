import 'package:dio/dio.dart';
abstract class ApiConstant{
  static const localHost = 'http://10.176.74.202';
  static const port = ':8000';
  static final dio = Dio();
  static const prefixEndpoint = '$localHost$port/api';
} 


abstract class EndPoint{
  static const register = '${ApiConstant.prefixEndpoint}/user';
  static const login = '$register/login';
}