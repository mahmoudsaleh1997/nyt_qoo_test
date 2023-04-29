import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AppTextWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final double? width;
  final Color? color;
  final FontWeight? fontWeight;
  final Function()? onTap;
  final int maxLines;

  AppTextWidget({
    required this.title,
    this.color = null,
    this.fontSize = 20,
    this.width,
    this.onTap,
    this.fontWeight,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Text('$title',
            style: TextStyle(
                color: color ?? AppColors.black,
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.normal,
                overflow: TextOverflow.ellipsis),
            overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
