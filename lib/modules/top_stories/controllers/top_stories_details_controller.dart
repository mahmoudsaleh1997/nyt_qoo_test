import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nyt_qoo_test/modules/top_stories/model/article_details_model.dart';
import 'package:nyt_qoo_test/widget/app_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/ui/gaps.dart';
import '../services/top_stories_details_service.dart';
import '../presentation/top_stories_details_state.dart';

class TopStoriesDetailsController extends GetxController {
  final _service = TopStoriesDetailsService();
  Rx<TopStoriesDetailsState> pageState = TopStoriesDetailsState.initial.obs;
  late BuildContext pageContext;

  late ArticleDetailsModel articleDetailsModel;

  @override
  void onInit() {
    articleDetailsModel = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  onReadMoreTapped() {
    showModalBottomSheet(
      context: pageContext,
      builder: (ctx) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: AppTextWidget(
                      title: 'Open Article With',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Gaps.vGap32,
                  GestureDetector(
                    onTap: () {
                      openArticleInWebView();
                    },
                    child: Container(
                      width: 1.sw,
                      child: AppTextWidget(
                        title: 'Internally: using app web view',
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Gaps.vGap8,
                  Divider(),
                  Gaps.vGap16,
                  GestureDetector(
                    onTap: () {
                      openArticleInBrowser();
                    },
                    child: Container(
                      width: 1.sw,
                      child: AppTextWidget(
                        title: 'Externally: using web browser',
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Gaps.vGap8,
                  Divider()
                ],
              ),
            );
          },
          onClosing: () {},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: 1.sh,
          ),
          enableDrag: false,
        );
      },
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            40,
          ),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: 0.4.sh,
      ),
    );
  }

  getBigImage() {
    return articleDetailsModel.imageUrl;
  }

  openArticleInBrowser() {
    if(articleDetailsModel.webUrl != null){
      launchUrl(
        Uri.parse(articleDetailsModel.webUrl!),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  openArticleInWebView() {
    if(articleDetailsModel.webUrl!= null){
      launchUrl(
        Uri.parse(articleDetailsModel.webUrl!),
        mode: LaunchMode.inAppWebView,
      );
    }
  }
}
