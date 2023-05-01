

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:nyt_qoo_test/core/net/http_client.dart';

import '../../../core/net/base_response.dart';
import '../../../core/net/rest_client.dart';
import '../model/response/search_articles_list_response.dart';

class ArticlesSearchService {
  HttpClient httpClient = HttpClient();
  Logger logger = Logger();

  Future<BaseResponse<SearchArticlesListModel>> search(
      String keyword , int pageNumber) async {
    SearchArticlesListModel? topStoriesListModel;
    RestClient restClient = RestClient(httpClient.instance);
    try {
      topStoriesListModel = await restClient.search(keyword,keyword,keyword,pageNumber);
      return BaseResponse(
        success: true,
        dioError: null,
        response: topStoriesListModel,
      );
    } on DioError catch (error) {
      switch (error.runtimeType) {
        case DioError:
          if (error.response != null) {
            final res = (error as DioError).response;
            print(error.type);
            logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
            return BaseResponse(
              success: false,
              dioError: error,
              response: null,
            );
          } else if (error.error is SocketException) {
            return BaseResponse(
              success: false,
              dioError: error,
              response: null,
            );
          }
          return BaseResponse(
            success: false,
            dioError: error,
            response: null,
          );

        default:
          return BaseResponse(
            success: false,
            dioError: error,
            response: null,
          );
      }
    }
  }
}