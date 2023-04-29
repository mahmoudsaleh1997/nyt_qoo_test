import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nyt_qoo_test/core/app_colors.dart';
import 'package:nyt_qoo_test/core/system_enum/view_cards_enum.dart';
import 'package:nyt_qoo_test/widget/app_text_widget.dart';
import '../../../core/constans.dart';
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
          child: GetBuilder<TopStoriesListController>(builder: (_) {
            if (controller.pageState.value == TopStoriesListState.loading) {
              return getWaitingWidget(pageIdentifier);
            } else if (controller.pageState.value ==
                TopStoriesListState.error) {
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
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.white,
            ),
            height: 50.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: AppColors.gold,
                decoration: InputDecoration(
                  icon: SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      AppConstants.searchIcon,
                      color: AppColors.grey,
                    ),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (v) {},
              ),
            ),
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
                child: DropdownSearch(
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
                    prefixIcon: SvgPicture.asset(AppConstants.filterIcon),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onListViewTapped();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.listView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SvgPicture.asset(
                        AppConstants.listViewIcon,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  Gaps.hGap8,
                  GestureDetector(
                    onTap: () {
                      controller.onGridViewTapped();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.gridView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SvgPicture.asset(
                        AppConstants.gridViewIcon,
                        height: 30,
                        width: 30,
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
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: AppColors.white,
                ),
                width: 0.5.sw,
                height: 50.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    cursorColor: AppColors.gold,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          AppConstants.searchIcon,
                          color: AppColors.grey,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (v) {},
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsetsDirectional.only(start: 5),
                constraints: BoxConstraints(
                  maxWidth: .2.sw,
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
                  dropdownSearchTextAlignVertical: TextAlignVertical.center,
                  dropdownSearchDecoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Filter'.tr,
                    prefixIcon: SvgPicture.asset(AppConstants.filterIcon),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onListViewTapped();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.listView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SvgPicture.asset(
                        AppConstants.listViewIcon,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  Gaps.hGap8,
                  GestureDetector(
                    onTap: () {
                      controller.onGridViewTapped();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            controller.viewCardsEnum == ViewCardsEnum.gridView
                                ? AppColors.grey.withOpacity(0.5)
                                : null,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SvgPicture.asset(
                        AppConstants.gridViewIcon,
                        height: 30,
                        width: 30,
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
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onCardTapped();
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
                    child: CustomNetworkImage(
                      width: 0.3.sw,
                      imageUrl: 'https://picsum.photos/id/237/200/300',
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
                          title: 'this is the title here ' * 3,
                          width: 0.5.sw,
                          maxLines: 3,
                          fontSize: 16.sp,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'By:',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'Auther Name ' * 4,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        )
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

  buildPortraitGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onCardTapped();
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
                    child: CustomNetworkImage(
                      width: 0.5.sw,
                      imageUrl: 'https://picsum.photos/id/237/200/300',
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
                  Gaps.hGap8,
                  Container(
                    width: 0.5.sw,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          title: 'this is the title here ' * 3,
                          width: 0.5.sw,
                          maxLines: 3,
                          fontSize: 16.sp,
                        ),
                        Gaps.vGap16,
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            text: 'By:',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'Auther Name ' * 4,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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

  buildLandscapeGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onCardTapped();
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
                    child: CustomNetworkImage(
                      width: 0.5.sw,
                      imageUrl: 'https://picsum.photos/id/237/200/300',
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
                  Gaps.hGap8,
                  Container(
                    width: 0.5.sw,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          title: 'this is the title here ' * 3,
                          width: 0.5.sw,
                          maxLines: 3,
                          fontSize: 16.sp,
                        ),
                        Gaps.vGap16,
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            text: 'By:',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'Auther Name ' * 4,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
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

  buildLandscapeListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onCardTapped();
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
                    child: CustomNetworkImage(
                      width: 0.2.sw,
                      imageUrl: 'https://picsum.photos/id/237/200/300',
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
                  Gaps.hGap8,
                  Container(
                    height: 100,
                    width: 0.6.sw,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          title: 'this is the title here ' * 3,
                          width: 0.5.sw,
                          maxLines: 3,
                          fontSize: 16.sp,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'By:',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'Auther Name ' * 4,
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        )
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
}
