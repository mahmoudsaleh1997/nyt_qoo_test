import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getP;

import '../../app_config/default_settings.dart';
import '../../core/net/response/base_response.dart';
import '../development/pretty_print.dart';
import 'app_urls.dart';
import 'constants.dart';

class BaseRepository {
  late Dio _dio;

  Dio get instance => _dio;

  BaseRepository() {
    BaseOptions _options = BaseOptions(
      connectTimeout: 150000,
      receiveTimeout: 150000,
      sendTimeout: 150000,
      responseType: ResponseType.json,
      baseUrl: APIUrls.BASE_URL,
    );
    _dio = Dio(_options);
  }

  Future<BaseResponse> requestApi({
    required String method,
    required String url,
    String? idToken = '',
    Map<String, dynamic>? queryParam,
    Options? options,
    dynamic data,
  }) async {
    BaseResponse response =
    BaseResponse(status: HTTP_INTERNAL_SERVER_ERROR, success: false);

    try {
      response = await _sendRequest(
        method: method,
        url: url,
        idToken: idToken!,
        queryParam: queryParam,
        options: options,
        data: data,
      );

      return response;
    } catch (e) {
      debugPrint('Error from base repository $e');
      if (e is SocketException) {
        response.error = 'error_while_connect_to_server'.tr;
      }
      return response;
    }
  }

  Future<BaseResponse> _sendRequest({
    required String method,
    required String url,
    String? idToken,
    Map<String, dynamic>? queryParam,
    Options? options,
    dynamic data,
  }) async {
    try {
      Response apiReturn;

      options ??= Options(
        headers: {},
      );

      options.headers!['Authorization'] = 'Bearer 24|iTEUvdVUJbV7AJrZ8ef2zYtEWfW7ELuG3wArzpwK';

      options.headers!['Accept'] = 'application/json';
      options.headers!['local'] = '${DefaultSetting.lang}';

      print('call api : ${APIUrls.BASE_URL}$url');

      if (method == APIType.GET) {
        apiReturn =
        await _dio.get(url, queryParameters: queryParam, options: options);
      } else if (method == APIType.POST) {
        apiReturn = await _dio.post(url,
            queryParameters: queryParam, options: options, data: data);
      } else if (method == APIType.PUT) {
        apiReturn = await _dio.put(url,
            queryParameters: queryParam, options: options, data: data);
      } else {
        apiReturn = await _dio.delete(url,
            queryParameters: queryParam, options: options, data: data);
      }
      print(apiReturn.statusCode);
      printJson(apiReturn.data);
      if (apiReturn.statusCode == 401) {
      } else if (apiReturn.statusCode == 429) {
        return BaseResponse(
          status: apiReturn.statusCode,
          success: false,
          data: apiReturn.data['data'],
          errorGeneric: 'too_many_attempts'.tr,
        );
      }
      return BaseResponse(
          status: apiReturn.statusCode,
          success: true,
          data: apiReturn.data['data'],
          errorGeneric: apiReturn.data['errors'] ?? '');
    } on DioError catch (ex) {
      debugPrint(ex.error.toString());
      debugPrint('Error on request to $url');
      print(ex.response!.data);
      if (ex.type == DioErrorType.connectTimeout) {
        //   debugPrint('Error Connection Timeout Exception ${ex.message}');
        // throw Exception("Connection  Timeout Exception");
      } else {
        debugPrint('Error Exception ${ex.message}');
        if (ex.response != null) {
        } else {
          debugPrint('Error $ex');
          debugPrint('Error Message ${ex.message}');
        }
        // throw Exception(ex.message);
      }

      return BaseResponse(
          status: ex.response!.statusCode ?? HTTP_INTERNAL_SERVER_ERROR,
          success: false,
          data: {},
          errorGeneric: ex.response!.data['errors'] ?? 'error500'.tr);
    }
  }
}
