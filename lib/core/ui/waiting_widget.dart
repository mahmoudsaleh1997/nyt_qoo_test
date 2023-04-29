import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';
import '../app_colors.dart';
import 'gaps.dart';

getWaitingWidget(String key) {

  return PrivacyPolicyWaitingWidget();
}

class PrivacyPolicyWaitingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.blueColor,
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
          decoration:const BoxDecoration(
            color: AppColors.shimmerHighlightColor,
          ),
        ),
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        enabled: true,
      period: Duration(seconds:2),
    );
  }
}



