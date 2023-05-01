import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nyt_qoo_test/core/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final double  height;
  final String? imageUrl;
  double ? width;
  BoxFit boxFit;
  Widget errorWidget;
  Widget loadingWidget;

  CustomNetworkImage({
    required this.height,
     this.width,
    required this.imageUrl,
    required this.errorWidget,
    required this.loadingWidget,
    this.boxFit = BoxFit.fill,

});

  @override
  Widget build(BuildContext context) {
    return imageUrl == null? Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: errorWidget,
    ) :CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: boxFit,
      errorWidget: (_,__,___) => errorWidget,
      placeholder:(_,__) => loadingWidget,
    );
  }
}
