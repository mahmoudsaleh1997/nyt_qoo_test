import 'package:get/get.dart';
import 'package:nyt_qoo_test/modules/splash/bindings/splash_binding.dart';
import 'package:nyt_qoo_test/modules/top_stories/bindings/top_stories_details_binding.dart';
import 'package:nyt_qoo_test/modules/top_stories/bindings/top_stories_list_binding.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_details_screen.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_list_screen.dart';

import '../../modules/splash/presentation/splash_screen.dart';

class AppRouters {
  static String initRoute = SplashScreen.routeName;

  static List<GetPage> PAGES = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: TopStoriesListScreen.routeName,
      page: () => TopStoriesListScreen(),
      binding: TopStoriesListBinding(),
    ),
    GetPage(
      name: TopStoriesDetailsScreen.routeName,
      page: () => TopStoriesDetailsScreen(),
      binding: TopStoriesDetailsBinding(),
    ),
  ];
}
