import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nyt_qoo_test/core/net/base_response.dart';
import 'package:nyt_qoo_test/core/ui/dialogs.dart';
import 'package:nyt_qoo_test/core/ui/snack_bars.dart';
import 'package:nyt_qoo_test/modules/top_stories/model/response/top_stories_list_response.dart';

import '../../../core/net/http_client.dart';
import '../../../core/net/rest_client.dart';

class TopStoriesListService {
  HttpClient httpClient = HttpClient();
  Logger logger = Logger();

  Future<BaseResponse<TopStoriesListModel>> getTopStories(
      String section) async {
    TopStoriesListModel? topStoriesListModel;
    RestClient restClient = RestClient(httpClient.instance);
    try {
      topStoriesListModel = await restClient.getTopStories(section);
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
    return BaseResponse(
      success: false,
      dioError: null,
      response: null,
    );
  }
}
