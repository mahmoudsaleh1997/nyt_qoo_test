import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import '../app_colors.dart';

class AppSnackBars {


  static showErrorSnackBar({
    required String title,
    required String description,

  }) {
    Get.snackbar(
      title,
      description,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.white,
      borderWidth: 1,
      backgroundColor: AppColors.redAccent.withOpacity(0.5),
      icon: const Icon(Icons.error),
      isDismissible: true,
      borderColor: AppColors.redAccent.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  static showNoInternetSnackBar() {
    Get.snackbar(
      'Internet Connection Lost'.tr,
      'Check your internet connection',
      snackPosition: SnackPosition.BOTTOM,
      borderWidth: 1,
      backgroundColor: AppColors.grey.withOpacity(0.5),
      icon: const Icon(Icons.signal_wifi_connected_no_internet_4_sharp),
      isDismissible: false,
      duration: const Duration(seconds: 60),

      borderColor: AppColors.grey.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  static showConnectionRestoredSnackBar() {
    Get.snackbar(
      'Connection Restored'.tr,
      'Internet connection restored, have fun !',
      snackPosition: SnackPosition.BOTTOM,
      borderWidth: 1,
      backgroundColor: AppColors.grey.withOpacity(0.5),
      icon: const Icon(Icons.wifi),
      isDismissible: true,
      duration: const Duration(seconds: 2),
      borderColor: AppColors.grey.withOpacity(0.8),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

}
