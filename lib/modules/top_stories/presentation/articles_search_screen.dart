import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nyt_qoo_test/core/app_colors.dart';
import 'package:nyt_qoo_test/widget/app_text_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/constants.dart';
import '../../../core/ui/gaps.dart';
import '../../../widget/custom_network_image.dart';
import '../../../widget/search_text_field.dart';
import '../controllers/articles_search_controller.dart';
import 'articles_search_state.dart';
import '../../../app_config/size_config.dart';
import '../../../core/ui/error_widget.dart';
import '../../../core/ui/waiting_widget.dart';

class ArticlesSearchScreen extends StatelessWidget {
  ArticlesSearchController controller = Get.find();
  static const String routeName = '/ArticlesSearchScreenRouteName';
  static const String pageIdentifier = 'ArticlesSearchScreenIdentifier';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.pageContext = context;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.lightBackgroundColor,
          elevation: 0,
          title: AppTextWidget(
            title: 'Search In Articles',
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
        body: Container(
          height: 1.sh,
          width: 1.sw,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchInputField(
                height: 50.h,
                searchController: controller.searchFieldController,
                onSubmit: (v) {
                  controller.search();
                },
              ),
              Gaps.vGap16,
              RichText(
                text: TextSpan(
                    text: 'Search Results about: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 18.sp,
                    ),
                    children: [
                      TextSpan(
                          text:
                              '\" ${controller.searchFieldController.text} \"',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                            fontSize: 18.sp,
                          ),
                          children: []),
                    ]),
              ),
              Gaps.vGap16,
              GetBuilder<ArticlesSearchController>(builder: (_) {
                if (controller.pageState.value == ArticlesSearchState.loading) {
                  return getWaitingWidget(pageIdentifier);
                } else if (controller.pageState.value ==
                    ArticlesSearchState.error) {
                  return getErrorWidget(pageIdentifier, 'unknownError'.tr);
                } else {
                  if (controller.searchResults.isEmpty) {
                    return Center(
                      child: AppTextWidget(title: 'No Data to show'),
                    );
                  } else {
                    return Expanded(
                      child: SmartRefresher(
                        controller: controller.refreshController,
                        enablePullDown: false,
                        enablePullUp: true,
                        header: const WaterDropMaterialHeader(
                          color: AppColors.grey,
                          backgroundColor: AppColors.white,
                        ),
                        onLoading: controller.loadMore,
                        footer: CustomFooter(
                          builder: (context, state) {
                            if (state == null) {
                              return SizedBox();
                            }
                            if (state == LoadStatus.idle) {
                              return Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_circle_up),
                                    Gaps.hGap15,
                                    AppTextWidget(
                                      title: 'Pull To Load More'.tr,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              );
                            }
                            if (state == LoadStatus.loading) {
                              return DefaultWaitingWidget();
                            }
                            if (state == LoadStatus.failed) {
                              return Text("Load Failed! Click retry!");
                            }
                            if (state == LoadStatus.canLoading) {
                              return Text("Release to load more");
                            }
                            if (state == LoadStatus.noMore) {
                              return Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.pending_outlined),
                                    Gaps.hGap15,
                                    const Text("Release to load more")
                                  ],
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        child: ListView.separated(
                          itemCount: controller.searchResults.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.onCardTapped(index);
                              },
                              child: Container(
                                width: 0.9.sw,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: AppColors.gold)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CustomNetworkImage(
                                        width: 0.3.sw,
                                        imageUrl: controller.getImage(index),
                                        height: 100,
                                        errorWidget: Icon(Icons.error),
                                        loadingWidget: ImageShimmerEffect(
                                          height: 100,
                                          width: 0.3.sw,
                                          raduis: 10,
                                        ),
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                    Gaps.hGap8,
                                    Container(
                                      height: 100,
                                      width: 0.5.sw,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppTextWidget(
                                            title:
                                                controller.getHeadLine(index),
                                            width: 0.5.sw,
                                            maxLines: 3,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          AppTextWidget(
                                            title: controller
                                                .searchResults[index]
                                                .byline
                                                .original,
                                            width: 0.5.sw,
                                            maxLines: 3,
                                            color: AppColors.grey,
                                            fontSize: 14.sp,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Gaps.vGap10;
                          },
                        ),
                      ),
                    );
                  }
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
