import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nyt_qoo_test/core/app_colors.dart';
import 'package:nyt_qoo_test/widget/logo.dart';
import '../../../core/ui/gaps.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBackgroundColor,
        body: Container(
        child: GetBuilder<SplashController>(
          builder: (_){
             if (controller.pageState.value == SplashState.loading) {
              return getWaitingWidget(pageIdentifier);
            } else if (controller.pageState.value == SplashState.error) {
              return getErrorWidget(pageIdentifier, controller.baseResponse.error ?? 'unknownError'.tr);
            } else {
              return OrientationBuilder(
                builder: (context , orientation){
                  if(orientation == Orientation.landscape){
                    return buildLandscapeView();
                  }
                  return buildPortraitView();
                },
              );
            }
          }
        ),
      ),),
    );
  }


  buildPortraitView(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            Gaps.vGap16,
            SizedBox(
              width: 200.h,
              child: const LinearProgressIndicator(

              ),
            ),
          ],
        ),
      );
  }

  buildLandscapeView(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          Gaps.vGap16,
          SizedBox(
            width: 200.h,
            child: const LinearProgressIndicator(

            ),
          ),
        ],
      ),
    );
  }
  
}
