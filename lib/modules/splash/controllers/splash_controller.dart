import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_list_screen.dart';
import '../../../core/net/network_checker.dart';
import '../../../core/ui/dialogs.dart';
import '../services/splash_service.dart';
import '../presentation/splash_state.dart';

class SplashController extends GetxController{

  final _service = SplashService();
  Rx<SplashState> pageState= SplashState.initial.obs;		
  late BuildContext pageContext;

  NetworkChecker networkChecker = NetworkChecker.instance;

  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() async {
    checkInternet();
    super.onReady();
  }

  checkInternet()async{
    bool isOnline = await networkChecker.initialise();
    if(!isOnline){
      AppDialogs.noInternetDialog((){
        Get.back();
        checkInternet();
      });
    }
    else{
      Future.delayed(Duration(seconds: 1)).then((value) {
        Get.offAllNamed(TopStoriesListScreen.routeName);
      });
    }
  }

}