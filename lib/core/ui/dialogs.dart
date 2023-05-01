import 'dart:io';

import 'package:nyt_qoo_test/widget/app_text_widget.dart';

import '../app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import 'gaps.dart';

class AppDialogs {
  static Future<bool?> noInternetDialog(Callback callback) async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: AppTextWidget(
          title: 'No Internet'.tr,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              title: 'Check Your Internet Connection '.tr,
              fontSize: 18.sp,
              maxLines: 4,
            ),
            Gaps.vGap40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: callback,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: AppColors.lightBackgroundColor.withOpacity(0.7),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ]),
                    child: Center(
                      child: AppTextWidget(
                        title: 'Retry'.tr,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gaps.vGap12,
          ],
        ),
      ),
      name: 'no_internet_dialog',
    );
  }
}
