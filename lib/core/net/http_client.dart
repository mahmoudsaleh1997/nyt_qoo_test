import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nyt_qoo_test/core/constants.dart';

class HttpClient{
  late Dio _dio;

  Dio get instance => _dio;

  HttpClient() {
    BaseOptions _options = BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 100000,
      sendTimeout: 30000,
      responseType: ResponseType.json,
    );
    _dio = Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: ( options,  handler){
        options.queryParameters.addAll({
          'api-key':AppConstants.apiKay,
        });
      if(kDebugMode){
        print('new request to : -> ${options.baseUrl}${options.path}');

      }
        return handler.next(options);
      }
    ));
  }
}