import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/top_stories_details_service.dart';
import '../presentation/top_stories_details_state.dart';
import '../../../core/net/response/base_response.dart';

class TopStoriesDetailsController extends GetxController{

  final _service = TopStoriesDetailsService();
  Rx<TopStoriesDetailsState> pageState= TopStoriesDetailsState.initial.obs;		
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