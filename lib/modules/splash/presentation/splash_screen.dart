import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import 'splash_state.dart';
import '../../../app_config/size_config.dart';
import '../../../core/ui/error_widget.dart';
import '../../../core/ui/waiting_widget.dart';
class SplashScreen extends StatelessWidget {

  SplashController controller = Get.find();
  static const String routeName = '/SplashScreenRouteName';
  static const String pageIdentifier = 'SplashScreenIdentifier';

  @override
    Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.pageContext = context;
    return Scaffold(body: Container(
      child: GetBuilder<SplashController>(
        builder: (_){
           if (controller.pageState.value == SplashState.loading) {
            return getWaitingWidget(pageIdentifier);
          } else if (controller.pageState.value == SplashState.error) {
            return getErrorWidget(pageIdentifier, controller.baseResponse.error ?? 'unknownError'.tr);
          } else {
            return Container();
          }
        }
      ),
    ),);
  }
  
  
}
