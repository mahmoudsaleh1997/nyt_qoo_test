import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyt_qoo_test/core/app_colors.dart';
import 'package:nyt_qoo_test/widget/app_text_widget.dart';
import 'package:nyt_qoo_test/widget/custom_network_image.dart';
import '../../../core/ui/gaps.dart';
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
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackgroundColor,
        elevation: 0,
        title: AppTextWidget(
          title: 'Top Stories Details',
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.black,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: GetBuilder<TopStoriesDetailsController>(builder: (_) {
            if (controller.pageState.value == TopStoriesDetailsState.loading) {
              return getWaitingWidget(pageIdentifier);
            } else if (controller.pageState.value ==
                TopStoriesDetailsState.error) {
              return getErrorWidget(pageIdentifier,
                  controller.baseResponse.error ?? 'unknownError'.tr);
            } else {
              return OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    return buildLandscapeView();
                  }
                  return buildPortraitView();
                },
              );
            }
          }),
        ),
      ),
    );
  }

  buildPortraitView() {
    return Container(
        height: 1.sh,
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          children: [
            Container(
              height: 0.8.sh,
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomNetworkImage(
                      height: 0.3.sh,
                      loadingWidget: ImageShimmerEffect(
                        height: 0.3.sh,
                        width: 0.9.sw,
                        raduis: 10,
                      ),
                      errorWidget: Icon(Icons.error),
                      imageUrl: 'https://picsum.photos/id/237/200/300',
                      width: 0.9.sw,
                      boxFit: BoxFit.contain,
                    ),
                  ),
                  Gaps.vGap16,
                  Center(
                      child: AppTextWidget(
                        title: 'This is the title of the story ' * 4,
                        width: 0.9.sw,
                        maxLines: 3,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      )),
                  Gaps.vGap16,
                  Divider(
                    color: AppColors.black.withOpacity(0.4),
                    thickness: 1,
                  ),
                  Gaps.vGap16,
                  Center(
                      child: Text(
                        'This is the title of the story ' * 4,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 17.sp,
                        ),
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.darkBlueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: AppTextWidget(
                    title: 'Read More',
                    color: AppColors.white,

                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }

  buildLandscapeView() {
    return Container(
      height: 1.sh,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomNetworkImage(
              width: 0.3.sw,
              height: 1.sh,
              loadingWidget: ImageShimmerEffect(
                height: 1.sh,
                width: 0.3.sw,
                raduis: 10,
              ),
              errorWidget: Icon(Icons.error),
              imageUrl: 'https://picsum.photos/id/237/200/300',

              boxFit: BoxFit.contain,
            ),
          ),
          Gaps.hGap8,
          SizedBox(
            width: 0.6.sw,
            height: 1.sh,
            child: ListView(
              children: [
                Center(
                    child: AppTextWidget(
                      title: 'This is the title of the story ' * 4,
                      width: 0.9.sw,
                      maxLines: 3,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    )),
                Gaps.vGap16,
                Divider(
                  color: AppColors.black.withOpacity(0.4),
                  thickness: 1,
                ),
                Gaps.vGap16,
                Center(
                    child: Text(
                      'This is the title of the story ' * 30,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 17.sp,
                      ),
                    )),
                Gaps.vGap16,
                Container(
                  height: 50.h,
                  width: 0.6.sw,
                  decoration: BoxDecoration(
                    color: AppColors.darkBlueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: AppTextWidget(
                      title: 'Read More',
                      color: AppColors.white,

                    ),
                  ),
                ),
                Gaps.vGap16,
              ],
            ),
          )
        ],
      ),
    );
  }
}
