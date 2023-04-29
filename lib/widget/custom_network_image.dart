import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double  height;
  final String imageUrl;
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
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.fill,
      errorWidget: (_,__,___) => errorWidget,
      placeholder:(_,__) => loadingWidget,
    );
  }
}
