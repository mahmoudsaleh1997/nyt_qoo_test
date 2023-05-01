import 'package:get/get.dart';
import '../controllers/articles_search_controller.dart';

class ArticlesSearchBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ArticlesSearchController>(ArticlesSearchController());
  }
}