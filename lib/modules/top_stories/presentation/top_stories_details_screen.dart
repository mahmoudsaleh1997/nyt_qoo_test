import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/top_stories_details_controller.dart';
import 'top_stories_details_state.dart';
import '../../../app_config/size_config.dart';
import '../../../core/ui/error_widget.dart';
import '../../../core/ui/waiting_widget.dart';
class TopStoriesDetailsScreen extends StatelessWidget {

  TopStoriesDetailsController controller = Get.find();
  static const String routeName = '/TopStoriesDetailsScreenRouteName';
  static const String pageIdentifier = 'TopStoriesDetailsScreenIdentifier';

  @override
    Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.pageContext = context;
    return Scaffold(body: Container(
      child: GetBuilder<TopStoriesDetailsController>(
        builder: (_){
           if (controller.pageState.value == TopStoriesDetailsState.loading) {
            return getWaitingWidget(pageIdentifier);
          } else if (controller.pageState.value == TopStoriesDetailsState.error) {
            return getErrorWidget(pageIdentifier, controller.baseResponse.error ?? 'unknownError'.tr);
          } else {
            return Container();
          }
        }
      ),
    ),);
  }
  
  
}
