import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/top_stories_list_service.dart';
import '../presentation/top_stories_list_state.dart';
import '../../../core/net/response/base_response.dart';

class TopStoriesListController extends GetxController{

  final _service = TopStoriesListService();
  Rx<TopStoriesListState> pageState= TopStoriesListState.initial.obs;		
  late BaseResponse baseResponse;
  late BuildContext pageContext;

  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() async {
    super.onReady();
  }

}