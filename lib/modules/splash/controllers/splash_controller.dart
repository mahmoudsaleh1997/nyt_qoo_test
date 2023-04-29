import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_list_screen.dart';
import '../services/splash_service.dart';
import '../presentation/splash_state.dart';
import '../../../core/net/response/base_response.dart';

class SplashController extends GetxController{

  final _service = SplashService();
  Rx<SplashState> pageState= SplashState.initial.obs;		
  late BaseResponse baseResponse;
  late BuildContext pageContext;

  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() async {
    Future.delayed(Duration(seconds: 1)).then((value) {
      Get.offAllNamed(TopStoriesListScreen.routeName);
    });
    super.onReady();
  }

}