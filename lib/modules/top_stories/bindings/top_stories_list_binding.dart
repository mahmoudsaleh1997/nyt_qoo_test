import 'package:get/get.dart';
import '../controllers/top_stories_list_controller.dart';

class TopStoriesListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<TopStoriesListController>(TopStoriesListController());
  }
}