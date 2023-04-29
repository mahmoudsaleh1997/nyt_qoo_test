import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_details_screen.dart';
import '../../../core/system_enum/view_cards_enum.dart';
import '../services/top_stories_list_service.dart';
import '../presentation/top_stories_list_state.dart';
import '../../../core/net/response/base_response.dart';

class TopStoriesListController extends GetxController {
  final _service = TopStoriesListService();
  Rx<TopStoriesListState> pageState = TopStoriesListState.initial.obs;
  late BaseResponse baseResponse;
  late BuildContext pageContext;
  ViewCardsEnum viewCardsEnum = ViewCardsEnum.listView;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  onListViewTapped() {
    if (viewCardsEnum == ViewCardsEnum.gridView) {
      viewCardsEnum = ViewCardsEnum.listView;
      update();
    }
  }

  onGridViewTapped() {
    if (viewCardsEnum == ViewCardsEnum.listView) {
      viewCardsEnum = ViewCardsEnum.gridView;
      update();
    }
  }

  onCardTapped(){
    Get.toNamed(TopStoriesDetailsScreen.routeName);
  }
}
