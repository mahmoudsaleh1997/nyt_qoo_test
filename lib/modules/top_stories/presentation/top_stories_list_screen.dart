import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nyt_qoo_test/core/app_colors.dart';
import 'package:nyt_qoo_test/core/system_enum/view_cards_enum.dart';
import 'package:nyt_qoo_test/widget/app_text_widget.dart';
import '../../../core/constants.dart';
import '../../../core/ui/gaps.dart';
import '../../../widget/custom_network_image.dart';
import '../../../widget/search_text_field.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightBackgroundColor,
        body: Container(
          child: GetBuilder<TopStoriesListController>(
            builder: (_) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    return buildLandscapeView();
                  }
                  return buildPortraitView();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  buildPortraitView() {
    return Container(
      height: 1.sh,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Gaps.vGap12,
          CustomSearchInputField(
            height: 50.h,
            searchController: controller.searchController,
            onSubmit: (v) {
              controller.onSearchSubmit();
            },
          ),
          Gaps.vGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsetsDirectional.only(start: 5),
                constraints: BoxConstraints(
                  maxWidth: .5.sw,
                  minHeight: 50,
                  minWidth: .5.sw,
                ),
                child: DropdownSearch<String>(
                  dropdownButtonProps: const IconButtonProps(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.grey,
                      size: 30,
                    ),
                  ),
                  mode: Mode.MENU,
                  dropdownSearchTextAlignVertical: TextAlignVertical.center,
                  dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Filter'.tr,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 5),
                      child: SvgPicture.asset(AppConstants.filterIcon),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 20,
                    ),
                  ),
                  selectedItem: controller.selectedSection,
                  items: controller.sections,
                  onChanged: (v) {
                    controller.onFilterChanged(v);
                  },
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onListViewTapped();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.listView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(child: Icon(Icons.format_list_bulleted)),
                      ),
                    ),
                  ),
                  Gaps.hGap8,
                  GestureDetector(
                    onTap: () {
                      controller.onGridViewTapped();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.gridView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(child: Icon(Icons.grid_view)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Gaps.vGap16,
          controller.viewCardsEnum == ViewCardsEnum.gridView
              ? buildPortraitGridView()
              : buildPortraitListView(),
        ],
      ),
    );
  }

  buildLandscapeView() {
    return Container(
      height: 1.sh,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSearchInputField(
                height: 50.h,
                width: 0.5.sw,
                searchController: controller.searchController,
                onSubmit: (v) {
                  controller.onSearchSubmit();
                },
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsetsDirectional.only(start: 5),
                constraints: BoxConstraints(
                  maxWidth: .25.sw,
                  minHeight: 50.h,
                  minWidth: .2.sw,
                ),
                child: DropdownSearch(
                  dropdownButtonProps: const IconButtonProps(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.grey,
                      size: 30,
                    ),
                  ),
                  mode: Mode.MENU,
                  onChanged: (section) {
                    controller.onFilterChanged(section);
                  },
                  dropdownSearchTextAlignVertical: TextAlignVertical.center,
                  dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Filter'.tr,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 5),
                      child: SvgPicture.asset(AppConstants.filterIcon),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 20,
                    ),
                  ),
                  items: controller.sections,
                  selectedItem: controller.selectedSection,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onListViewTapped();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.listView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(child: Icon(Icons.format_list_bulleted)),
                      ),
                    ),
                  ),
                  Gaps.hGap8,
                  GestureDetector(
                    onTap: () {
                      controller.onGridViewTapped();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.gridView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(child: Icon(Icons.grid_view)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Gaps.vGap16,
          controller.viewCardsEnum == ViewCardsEnum.gridView
              ? buildLandscapeGridView()
              : buildLandscapeListView(),
        ],
      ),
    );
  }

  buildPortraitListView() {
    return GetBuilder<TopStoriesListController>(builder: (_) {
      if (controller.pageState.value == TopStoriesListState.loading) {
        return getWaitingWidget('${pageIdentifier}ListPortrait');
      } else if (controller.pageState.value == TopStoriesListState.error) {
        return getErrorWidget(pageIdentifier, 'unknownError'.tr);
      } else {
        return Expanded(
          child: ListView.separated(
            itemCount: controller.topStories.length,
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
                      border: Border.all(width: 1, color: AppColors.gold)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: '$index',
                          child: CustomNetworkImage(
                            width: 0.3.sw,
                            imageUrl: controller.getSmallImageOfStory(index),
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
                      ),
                      Gaps.hGap8,
                      Container(
                        height: 100,
                        width: 0.5.sw,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                              title: controller.topStories[index].title,
                              width: 0.5.sw,
                              maxLines: 3,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            AppTextWidget(
                              title: controller.topStories[index].byline,
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
        );
      }
    });
  }

  buildPortraitGridView() {
    return GetBuilder<TopStoriesListController>(builder: (_) {
      if (controller.pageState.value == TopStoriesListState.loading) {
        return getWaitingWidget(pageIdentifier + 'GridPortrait');
      } else if (controller.pageState.value == TopStoriesListState.error) {
        return getErrorWidget(pageIdentifier, 'unknownError'.tr);
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: controller.topStories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.onCardTapped(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: AppColors.gold)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: '$index',
                          child: CustomNetworkImage(
                            width: 0.5.sw,
                            imageUrl: controller.getSmallImageOfStory(index),
                            height: 100,
                            errorWidget: Icon(Icons.error),
                            loadingWidget: ImageShimmerEffect(
                              height: 100,
                              width: 0.3.sw,
                              raduis: 10,
                            ),
                            boxFit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: 0.5.sw,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                title: controller.topStories[index].title,
                                width: 0.5.sw,
                                maxLines: 3,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              Gaps.vGap16,
                              AppTextWidget(
                                title: controller.topStories[index].byline,
                                width: 0.5.sw,
                                maxLines: 2,
                                color: AppColors.grey,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }

  buildLandscapeGridView() {
    return GetBuilder<TopStoriesListController>(builder: (_) {
      if (controller.pageState.value == TopStoriesListState.loading) {
        return getWaitingWidget('${pageIdentifier}GridLandscape');
      } else if (controller.pageState.value == TopStoriesListState.error) {
        return getErrorWidget(pageIdentifier, 'unknownError'.tr);
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: controller.topStories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.onCardTapped(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: AppColors.gold)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: '$index',
                          child: CustomNetworkImage(
                            width: 0.5.sw,
                            imageUrl: controller.getSmallImageOfStory(index),
                            height: 100,
                            errorWidget: Icon(Icons.error),
                            loadingWidget: ImageShimmerEffect(
                              height: 100,
                              width: 0.3.sw,
                              raduis: 10,
                            ),
                            boxFit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Gaps.hGap8,
                      Flexible(
                        child: Container(
                          width: 0.5.sw,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                title: controller.topStories[index].title,
                                width: 0.5.sw,
                                maxLines: 3,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              Gaps.vGap16,
                              AppTextWidget(
                                title: controller.topStories[index].byline,
                                width: 0.5.sw,
                                maxLines: 3,
                                color: AppColors.grey,
                                fontSize: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }

  buildLandscapeListView() {
    return GetBuilder<TopStoriesListController>(builder: (_) {
      if (controller.pageState.value == TopStoriesListState.loading) {
        return getWaitingWidget('${pageIdentifier}ListLandscape');
      } else if (controller.pageState.value == TopStoriesListState.error) {
        return getErrorWidget(pageIdentifier, 'unknownError'.tr);
      } else {
        return Expanded(
          child: ListView.separated(
            itemCount: controller.topStories.length,
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
                      border: Border.all(width: 1, color: AppColors.gold)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: '$index',
                          child: CustomNetworkImage(
                            width: 0.2.sw,
                            imageUrl: controller.getSmallImageOfStory(index),
                            height: 100,
                            errorWidget: Icon(Icons.error),
                            loadingWidget: ImageShimmerEffect(
                              height: 100,
                              width: 0.3.sw,
                              raduis: 10,
                            ),
                            boxFit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Gaps.hGap8,
                      Container(
                        height: 100,
                        width: 0.6.sw,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(
                              title: controller.topStories[index].title,
                              width: 0.7.sw,
                              maxLines: 3,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                            AppTextWidget(
                              title: controller.topStories[index].byline,
                              width: 0.5.sw,
                              maxLines: 3,
                              color: AppColors.grey,
                              fontSize: 15.sp,
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
        );
      }
    });
  }
}
