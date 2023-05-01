import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/articles_search_screen.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_list_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import '../app_colors.dart';
import 'gaps.dart';

getWaitingWidget(String key) {
  switch (key) {
    case '${TopStoriesListScreen.pageIdentifier}GridPortrait':
      return const GridPortraitWaitingWidget();
    case '${TopStoriesListScreen.pageIdentifier}ListPortrait':
      return const ListPortraitWaitingWidget();
    case '${TopStoriesListScreen.pageIdentifier}GridLandscape':
      return const GridLandscapeWaitingWidget();
    case '${TopStoriesListScreen.pageIdentifier}ListLandscape':
      return const ListLandscapeWaitingWidget();
    case ArticlesSearchScreen.pageIdentifier:
      return const ListPortraitWaitingWidget();
  }
  return DefaultWaitingWidget();
}

class DefaultWaitingWidget extends StatelessWidget {
  const DefaultWaitingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.blueColor,
      ),
    );
  }
}

class ListPortraitWaitingWidget extends StatelessWidget {
  const ListPortraitWaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor.withOpacity(.2),
        highlightColor: AppColors.shimmerHighlightColor,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}

class GridPortraitWaitingWidget extends StatelessWidget {
  const GridPortraitWaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor.withOpacity(.2),
        highlightColor: AppColors.shimmerHighlightColor,
        enabled: true,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8
          ),
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 0.4.sw,
                  height: 0.4.sw,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
                Container(
                  width: 0.4.sw,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 0.4.sw,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 0.4.sw,
                  height: 8.0,
                  color: Colors.white,
                ),

              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}

class GridLandscapeWaitingWidget extends StatelessWidget {
  const GridLandscapeWaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor.withOpacity(.2),
        highlightColor: AppColors.shimmerHighlightColor,
        enabled: true,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8
          ),
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 0.2.sw,
                  height: 0.2.sw,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Gaps.vGap8,
                Container(
                  width: 0.15.sw,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 0.15.sw,
                  height: 8.0,
                  color: Colors.white,
                ),
                Gaps.vGap8,
                Container(
                  width: 0.15.sw,
                  height: 8.0,
                  color: Colors.white,
                ),

              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}

class ListLandscapeWaitingWidget extends StatelessWidget {
  const ListLandscapeWaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor.withOpacity(.2),
        highlightColor: AppColors.shimmerHighlightColor,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 6,
        ),
      ),
    );
  }
}

class ImageShimmerEffect extends StatelessWidget {
  final double width, height, raduis;

  ImageShimmerEffect({
    required this.height,
    required this.raduis,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.shimmerHighlightColor,
        ),
      ),
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      enabled: true,
      period: Duration(seconds: 2),
    );
  }
}
