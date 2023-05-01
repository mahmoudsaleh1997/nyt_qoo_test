import 'package:dio/dio.dart';

class BaseResponse<E>{
  E? response;
  DioError? dioError;
  bool success;

  BaseResponse({
    required this.success,
    this.response,
    this.dioError,
});


}