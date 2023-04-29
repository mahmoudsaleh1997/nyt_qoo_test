import 'package:get/get.dart';
import '../controllers/top_stories_details_controller.dart';

class TopStoriesDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<TopStoriesDetailsController>(TopStoriesDetailsController());
  }
}