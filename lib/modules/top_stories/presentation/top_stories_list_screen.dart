import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/top_stories_list_controller.dart';
import 'top_stories_list_state.dart';
import '../../../app_config/size_config.dart';
import '../../../core/ui/error_widget.dart';
import '../../../core/ui/waiting_widget.dart';
class TopStoriesListScreen extends StatelessWidget {

  TopStoriesListController controller = Get.find();
  static const String routeName = '/TopStoriesListScreenRouteName';
  static const String pageIdentifier = 'TopStoriesListScreenIdentifier';

  @override
    Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.pageContext = context;
    return Scaffold(body: Container(
      child: GetBuilder<TopStoriesListController>(
        builder: (_){
           if (controller.pageState.value == TopStoriesListState.loading) {
            return getWaitingWidget(pageIdentifier);
          } else if (controller.pageState.value == TopStoriesListState.error) {
            return getErrorWidget(pageIdentifier, controller.baseResponse.error ?? 'unknownError'.tr);
          } else {
            return Container();
          }
        }
      ),
    ),);
  }
  
  
}
